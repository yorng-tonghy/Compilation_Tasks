%%

%class OperationFunction
%standalone

digit = [0-9]
number = {digit}+
integer = {number}
float = {number}"."{number}
operand1 = {integer} | {float}
func_name = "add" | "minus" | "multi"
id = {func_name}\({operand1},{operand1}\)
whitespace = [\t\n]+
%%

{id} {
  String[] parts = yytext().split("[(),]");
  String funcName = parts[0];
  double operand1 = Double.parseDouble(parts[1]);
  double operand2 = Double.parseDouble(parts[2]);
  double result = 0;
  switch (funcName) {
    case "add":
      result = operand1 + operand2;
      break;
    case "minus":
      result = operand1 - operand2;
      break;
    case "multi":
      result = operand1 * operand2;
      break;
  }
  System.out.println(yytext() + " = " + result);
}
{whitespace} { /* Do Nothing */}