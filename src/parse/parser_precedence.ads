Pragma Ada_2012;
Pragma Assertion_Policy( Check );

Package Parser_Precedence with Pure is

   ASSIGNMENT  : Constant Natural := 10;
   CONDITIONAL : Constant Natural := 20;
   SUM         : Constant Natural := 50;
   PRODUCT     : Constant Natural := 60;
   EXPONENT    : Constant Natural := 70;
   PREFIX      : Constant Natural := 96;
   POSTFIX     : Constant Natural := 97;
   CALL        : Constant Natural := 98;

End Parser_Precedence;
