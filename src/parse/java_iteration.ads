With Lexington.Token_Vector_Pkg;

Package Java_Iteration is

    Type Iterable_Token_Vector is new Lexington.Token_Vector_Pkg.Vector with
       record
	   Consumed : Boolean := False;
       end record;



End J;
