With
Ada.Containers.Indefinite_Holders,
Ada.Containers.Indefinite_Ordered_Maps;

Package Body Parsington is


--     Package Token_Holder is new Ada.Containers.Indefinite_Holders(
--        "="          => Lexer."=",
--        Element_Type => Lexer.Token
--       );
--
--     Function "<"(Left, Right : Token_Holder.Holder) return Boolean is
--       ( Lexer."<"(Left.Element,Right.Element) );

   Package Moiety_Map is new Ada.Containers.Indefinite_Ordered_Maps(
         "<"          => Lexer."<",
--           "="          => ,
         Key_Type     => Lexer.Token_ID, --Token_Holder.Holder,
         Element_Type => Expression'Class
        );

   Type Parser_Actual is record
      Moieties : Moiety_Map.Map;
   end record;

   Procedure Register( Object          : Parser;
                       Lexical_Element : Lexer.Token_ID;
                       Moiety          : Expression'Class) is
--        Function "+"(Right:Lexer.Token) return Token_Holder.Holder
--          renames Token_Holder.To_Holder;
   Begin
      Object.Object.Moieties.Insert(New_Item => Moiety, Key => Lexical_Element);
   End Register;

   Function Create return Parser is
     ( Parser'(Object => new Parser_Actual) );

End Parsington;
