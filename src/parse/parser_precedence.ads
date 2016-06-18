Pragma Ada_2012;
Pragma Assertion_Policy( Check );

Package Parser_Precedence with Pure is

   ASSIGNMENT  : Constant Natural := 1;
   CONDITIONAL : Constant Natural := 2;
   SUM         : Constant Natural := 3;
   PRODUCT     : Constant Natural := 4;
   EXPONENT    : Constant Natural := 5;
   PREFIX      : Constant Natural := 6;
   POSTFIX     : Constant Natural := 7;
   CALL        : Constant Natural := 8;

End Parser_Precedence;
