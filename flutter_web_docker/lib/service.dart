import 'package:math_expressions/math_expressions.dart';

double eval(String expression) {
  try {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  } catch (e) {
    return double.nan;
  }
}
