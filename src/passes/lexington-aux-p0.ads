Pragma Ada_2012;
Pragma Assertion_Policy( Check );

With
Lexington.Token_Vector_Pkg;

-- Takes a string, returns a vector containing a single-token  (a TEXT token).
Procedure Lexington.Aux.P1(Input : String; Output : out Token_Vector_Pkg.Vector);
