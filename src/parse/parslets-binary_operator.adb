Pragma Ada_2012;
Pragma Assertion_Policy( Check );

With
Expressions.Instances;

Use
Expressions.Instances;

Package Body Parslets.Binary_Operator is

   Function Parse(Item   : in     Instance;
                  Parser : in out Parslets.Parser;
                  Left   : in     PE.Expression'Class;
                  Token  : in     Aux.Token
                 ) return PE.Expression'Class is
      Offset : constant Integer := (if Is_Right then -1 else 0);
      Right  : pe.Expression'Class := Parse(Parser, Item.Precedence + Offset);

      Use Aux.Token_Pkg;
   Begin
      Return Operator_Expression'(
         Left     => +Left,
         Right    => +Right,
         Operator => ID(Token)
        );
   End Parse;

End Parslets.Binary_Operator;
