Function Parslets.Generic_Infix_Create( Parser : not null access Parslets.Parser ) return Infix_Type is
Begin
--      Ada.Wide_Wide_Text_IO.Put( "Creating Infix of: " );
--      Ada.Wide_Wide_Text_IO.Flush;

    Return Result : Infix_Type := Init do
--        Infix_Type(
--  		  Infix'Class'(
--  		    Parslets.Create(Tag => Infix_Type'Tag, Parser => Parser.All)
--  		   ) -- -- End qualification.
--  		 ) -- End conversion.
--  	Ada.Wide_Wide_Text_IO.Put_Line( Ada.Tags.Wide_Wide_Expanded_Name(Infix_Type'Tag) );
	null;
    end return;
End Parslets.Generic_Infix_Create;
