%%

%class mail
%standalone

letter = [a-zA-Z]
digit = [0-9]
id = ({letter}|{digit})+
username = {id}
domainname = {id}
extension = ({letter})+
email = {username}@{domainname}(\.{extension})+
email1 = {username} | {username}@ | {username}@{domainname}
whitespace = [\t\n]+
%%

{email} {System.out.println("Correct: "+ yytext() );}
{email1} {System.out.println("Incorrect: "+ yytext() );}
{whitespace} { /* Do Nothing */}