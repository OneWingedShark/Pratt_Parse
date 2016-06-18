Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
Lexington.Parameters.Consumingtion;

Generic
   with Package Lexer is new Lexington.Parameters(<>);
   with Package Consumers is new Lexer.Consumingtion(<>);
Package Parsington is

   Type Parser(<>) is private;
   Type Expression(<>) is tagged;

   Function  Parse( Object : Parser; Input : Lexer.Token ) return Expression'Class;
   Function  Create return Parser;
   Procedure Register( Object : Parser; Lexical_Element : Lexer.Token_ID; Moiety : Expression'Class);

   Type Expression is abstract tagged record
      Power : Natural;
   end record;

     --( Power : Natural ) is abstract tagged null record;
   Function Print( Item : Expression ) return String is abstract;



   -- re: moiety (a portion)
Private
   Type Parser_Actual;
   Type Parser( Object : not null access Parser_Actual ) is null record;

   Type Stub_Expression is new Expression with null record;
   Function Print( Item : Stub_Expression ) return String is
     ("STUB");

   Function Parse( Object : Parser; Input : Lexer.Token ) return Expression'Class is
     ( Stub_Expression'(others => 1) );


End Parsington;
