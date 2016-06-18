Pragma Ada_2012;
Pragma Assertion_Policy( Check );

Procedure Lexington.Aux.P1(Input : String; Output : out Token_Vector_Pkg.Vector) is
Begin
   Output:= Token_Vector_Pkg.Empty_Vector;
   Token_Vector_Pkg.Append( Output, Make_Token(Text, Input) );
End;
