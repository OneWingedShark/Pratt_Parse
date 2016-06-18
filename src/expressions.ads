With
Ada.Characters.Wide_Wide_Latin_1,
Lexington.Aux,
Ada.Containers;

Package Expressions with Pure is
   Type Expression is interface;
   Function "+"( Object : Expression'Class ) return Wide_Wide_String with Inline;
   Function To_String( Object : Expression'Class;
                       Level  : Natural := 0
                     ) return Wide_Wide_String;
   Function  Print   ( Object : Expression;
                       Level  : Ada.Containers.Count_Type := 0
                     ) return Wide_Wide_String is abstract;

Private
   Function "+"( Object : Expression'Class ) return Wide_Wide_String is
     ( Object.To_String );

   Package WWL renames Ada.Characters.Wide_Wide_Latin_1;
   EOL : constant Wide_Wide_String := (WWL.CR, WWL.LF);
   TAB : Wide_Wide_Character renames WWL.HT;
End Expressions;
