Pragma Ada_2012;
Pragma Assertion_Policy( Check );

Generic
	Precedence_Value : in Natural;
	Is_Right         : in Boolean;
Package Parslets.Binary_Operator is

    Type Instance is new Infix with Null Record;

Private

    Function Precedence(Item : Instance) return Natural is (Precedence_Value);
    Function Create( Parser : not null access Parslets.Parser ) return Instance is
	(Null Record);
   Function Parse(Item   : in     Instance;
                  Parser : in out Parslets.Parser;
                  Left   : in     PE.Expression'Class;
                  Token  : in     Aux.Token
                 ) return PE.Expression'Class;

End Parslets.Binary_Operator;
