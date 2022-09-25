#!/bin/bash

# This is to be used locally
COMMIT=$(git rev-parse --short=8 HEAD)
gcloud beta run deploy sorare-agent-landing-page --allow-unauthenticated --source=. --set-env-vars=COMMIT=$COMMIT
