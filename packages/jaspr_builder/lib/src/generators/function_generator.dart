import 'package:analyzer/dart/element/element.dart';

import '../utils.dart';
import 'element_generator.dart';

class FunctionGenerator extends ElementGenerator<ExecutableElement> {
  FunctionGenerator(ExecutableElement element, ResolverFn canResolve) : super(element, canResolve);

  @override
  String generate() {
    var returnType = typeName(element.returnType);

    var static = element.isStatic && element.enclosingElement is ClassElement ? 'static ' : '';
    var body = "throw UnimplementedError('${element.name}');";

    var e = element;
    if (e is PropertyAccessorElement) {
      if (e.isGetter) {
        return '$static$returnType get ${e.variable.name} => $body';
      } else {
        var t = typeName(e.variable.type);
        return '${static}set ${e.variable.name}($t _) => $body';
      }
    }

    var params = <String>[];
    var namedParams = <String>[];
    var optParams = <String>[];

    for (var param in element.parameters) {
      var t = typeName(param.type);
      var def = param.defaultValueCode != null ? ' = ${param.defaultValueCode}' : '';
      if (param.isNamed) {
        namedParams.add('${param.isRequiredNamed ? 'required ' : ''}$t ${param.name}$def');
      } else if (param.isOptional) {
        optParams.add('$t ${param.name}$def');
      } else {
        params.add('$t ${param.name}');
      }
    }

    var paramsString = params.join(',');
    if (namedParams.isNotEmpty) {
      if (paramsString.isNotEmpty) paramsString += ', ';
      paramsString += '{${namedParams.join(', ')}}';
    } else if (optParams.isNotEmpty) {
      if (paramsString.isNotEmpty) paramsString += ', ';
      paramsString += '[${optParams.join(', ')}]';
    }

    if (e is ConstructorElement) {
      var conststr = e.isFactory && e.isConst ? 'const ' : '';
      var name = '${e.enclosingElement.name}${e.name.isNotEmpty ? '.${e.name}' : ''}';
      return '${conststr}factory $name($paramsString) => $body';
    }

    var typeParams =
        element.typeParameters.map((e) => '${e.name}${e.bound != null ? ' extends ${typeName(e.bound!)}' : ''}');
    var typeParamsStr = typeParams.isNotEmpty ? '<${typeParams.join(', ')}>' : '';

    return '$static$returnType ${element.isOperator ? 'operator ' : ''}${element.name}$typeParamsStr($paramsString)'
        '${element.isAbstract ? ';' : ' => $body'}';
  }

  @override
  Iterable<Element> getTransitiveElements({bool recursive = false}) {
    return [
      if (recursive) ...element.type.transitiveElements,
    ];
  }
}
