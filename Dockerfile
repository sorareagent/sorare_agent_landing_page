# Use latest stable channel SDK.
FROM dart:stable as dart

# busybox = shell into the container and see status of the files (`ls`, etc)
RUN apt update && apt install busybox

# Resolve app dependencies.
WORKDIR /app
COPY . .
WORKDIR /app
RUN dart pub get
RUN dart run jaspr build

FROM scratch
# copying contents of the runtime directory to root directory
COPY --from=dart /runtime/ /
COPY --from=dart /app/build/ /app/bin/
# Copying busybox binary from Stage 1 to Stage 2
COPY --from=dart /bin/busybox /bin/busybox
# Installing fake shell so busybox installer works
COPY --from=dart /bin/busybox /bin/sh
# Install busybox by creating symbolic links in /bin
RUN /bin/busybox --install -s /bin
# remove unrequired copy of busybox and replacing it with symbolic link
RUN rm /bin/sh && ln -s /bin/busybox /bin/sh

# Start server.
EXPOSE 8080

ENV DART_SDK_PATH=/usr/lib/dart
WORKDIR /app/bin
CMD ["./app"]