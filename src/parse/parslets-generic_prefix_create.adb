Function Parslets.Generic_Prefix_Create( Parser : not null access Parslets.Parser ) return Prefix_Type is
Begin
--      Ada.Wide_Wide_Text_IO.Put( "Creating Prefix of: " );
--      Ada.Wide_Wide_Text_IO.Flush;

    Return Result : Prefix_Type := Init do
--        Prefix_Type(
--  		  Prefix'Class'(
--  		    Parslets.Create(Tag => Prefix_Type'Tag, Parser => Parser.All)
--  		   ) -- -- End qualification.
--  		 ) -- End conversion.
--  	Ada.Wide_Wide_Text_IO.Put_Line( Ada.Tags.Wide_Wide_Expanded_Name(Prefix_Type'Tag) );
	null;
    end return;
End Parslets.Generic_Prefix_Create;
