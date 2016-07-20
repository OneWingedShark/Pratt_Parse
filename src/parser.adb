pragma Wide_Character_Encoding(UTF8);

with
Readington,
Lexington.Parameters.Consumingtion,
Lexington.Aux,
Lexington.Tokens,
Lexington.Token_Vector_Pkg,
Parsington,

Ada.Containers.Indefinite_Ordered_Maps,
Ada.Wide_Wide_Text_IO.Text_Streams;

with
Ada.Strings.Equal_Case_Insensitive,
Ada.Characters.Conversions,
Ada.Characters.Wide_Wide_Latin_1,
Ada.Wide_Wide_Text_IO,
Ada.Wide_Wide_Characters.Handling,
Ada.Strings.Wide_Wide_Fixed,
Ada.Strings.Wide_Wide_Maps.Wide_Wide_Constants,
Ada.Strings.Wide_Wide_Maps;

WITH
Ada.Tags.Generic_Dispatching_Constructor,
Parslets.Instances,
Expressions.Instances;

WITH
Interfaces;

Procedure Parser is
--     Type Enumeration_ID is (One, Two, Three);
--
--     Package Lex_Param	is new Lexington.Parameters(Token_ID => Enumeration_ID);
--     Package Consumers	renames Lexington.Consumers;
--
--     Consumer_Map : Lex_Param.Discriminator_Map:=
--       ( One => Consumers.Epsilon, Two..Three => Consumers.Nil );
--
--     Package Lex_Consume	is new Lex_Param.Consumingtion( Consumer_Map );
--     Package Parser_Pkg is new Parsington(Lexer => Lex_Param, Consumers => Lex_Consume);
--
--
--     Test_1 : Lex_Param.Token:= Lex_Param.Make_Token(Two, "~~~2~~~");
--     Test_2 : Parser_Pkg.Parser:= Parser_Pkg.Create;
--     Test_3 : Parser_Pkg.Expression'Class:=
--       Parser_Pkg.Parse( Object => Test_2, Input => Test_1 );





--  At the line marked CANDIDATE, I would have liked to write something like
--
--  type Discrete_Type_16_or_32_or_64 is (<>)
--     with Static_Predicate => Discrete_Type_16_or_32_or_64'Size in 16 | 32 | 64;
--

   Function Test return Ada.Wide_Wide_Text_IO.File_Type is
      use Ada.Wide_Wide_Text_IO;
   Begin
      return Result : File_Type do
         Open( Result, Name => "BOM_Test.adb", Mode => In_File);
      end return;
   End Test;


   File   : Ada.Wide_Wide_Text_IO.File_Type:= Test;
   Stream : aliased Ada.Wide_Wide_Text_IO.Text_Streams.Stream_Access:=
     Ada.Wide_Wide_Text_IO.Text_Streams.Stream(File);

   Upper_Case_Map : Ada.Strings.Wide_Wide_Maps.Wide_Wide_Character_Mapping renames
     Ada.Strings.Wide_Wide_Maps.Wide_Wide_Constants.Upper_Case_Map;

   ß : Wide_Wide_Character renames
     Ada.Characters.Wide_Wide_Latin_1.LC_German_Sharp_S;
   LC_Test_String : constant wide_wide_string := "Preu"&ß&"en";
   UC_Test_String : constant wide_wide_string := "PREUSSEN";


   Tokens : aliased Lexington.Token_Vector_Pkg.Vector;
Begin
--     Ada.Text_IO.Put_Line( "Test Value: " & Lex_Param.Lexeme(Test_1) );
--     Ada.Text_IO.Put_Line( "Test Value: " & Test_3.Print );

   Tokens:= Lexington.Tokens( Readington(Stream) );


   for Token of Tokens loop
      declare
	    use all type Lexington.Aux.Token_Pkg.Token;
	    package K renames Lexington.Aux.Token_Pkg;
      begin
         Ada.Wide_Wide_Text_IO.Put_Line( K.Print(Token) );
      end;
   end loop;


   Ada.Wide_Wide_Text_IO.Put_Line( "----------------------------------------" );

   TEST_PRATT_PARSER:
   Declare
      Parse_Count : Positive := 1;
      Parser : Parslets.Parser:= Parslets.Create( Tokens );
      use Parslets, Parslets.Instances, Expressions.Instances, Lexington.Aux;
   Begin
      Register(Parser, aux.op_Add,           Binary_Operator'Tag, Infix => True );
      Register(Parser, aux.op_Sub,           Binary_Operator'Tag, Infix => True );
      Register(Parser, aux.op_Mul,           Binary_Operator'Tag, Infix => True );
      Register(Parser, aux.op_Div,           Binary_Operator'Tag, Infix => True );
      Register(Parser, aux.op_Concat,        Binary_Operator'Tag, Infix => True );
      Register(Parser, aux.op_Less_Than,     Binary_Operator'Tag, Infix => True );
      Register(Parser, aux.op_Greater_Than,  Binary_Operator'Tag, Infix => True );
      Register(Parser, aux.op_Equal,         Binary_Operator'Tag, Infix => True );
      Register(Parser, aux.kw_Rem,           Binary_Operator'Tag, Infix => True );
      Register(Parser, aux.kw_Mod,           Binary_Operator'Tag, Infix => True );

      Register(Parser, aux.ch_Open_Paren,    Call_Parameters'Tag, Infix => True  );
      Register(Parser, aux.ch_Open_Paren,    Grouping_Parens'Tag, Infix => False );

      Register(Parser, aux.Identifier,       Name'Tag,            Infix => False );
      Register(Parser, aux.ss_Assign,        Assign'Tag,          Infix => True  );


      Register(Parser, aux.kw_If, Binary_Operator'Tag, Infix => True );


	--Register(Parser, aux.kw_Procedure, Binary_Operator'Tag, Infix => False );
--        Register(Parser, aux.kw_If, Binary_Operator'Tag, Infix => True );
      --Ada.Tags.Generic_Dispatching_Constructor
      null;
--loop
      declare
         Root : constant Expressions.Expression'Class := Parslets.Parse( Parser );
         use Ada.Wide_Wide_Text_IO;

         ID : Aux.Token := Consume( Parser );
      begin
         null;
       Put_Line( "Parse-count:" & Positive'Wide_Wide_Image(Parse_Count) );
       Put_Line(  Root.Print  );
       Parse_Count:= Positive'Succ(Parse_Count);
      end;
--end loop;
--     exception
--        when others =>
--           Ada.Wide_Wide_Text_IO.Put_Line("Something went wrong.");
   End TEST_PRATT_PARSER;



--     PARSER_TEST:
--     declare
--        package PP renames Parser_Implementation;
--        Token_Stream : aliased Lexington.Token_Vector_Pkg.Vector:= Tokens;
--        DD : PP.Parser:= PP.Create( Token_Stream );
--        use all type Lexington.Aux.Token_Pkg.Token;
--        function PUT(Input: Lexington.Aux.Token) return Wide_Wide_String
--                     renames Lexington.Aux.Token_Pkg.Print;
--     begin
--        Token_Stream.Clear;
--        Token_Stream.Append( Make_Token(38,"this") );
--        for X of DD.Token_Stream.All loop
--           Ada.Wide_Wide_Text_IO.Put_Line( Put(X) );
--        end loop;
--     End PARSER_TEST;




--     Ada.Text_IO.New_Line(2);
--
--
--     CASING_TEST:
--     declare
--        --        Wide_Wide_Characters.Unicode.
--  --        Ada.Wide_Wide_Characters.Handling.
--        Translated : Wide_Wide_String renames
--          Ada.Wide_Wide_Characters.Handling.To_Upper(LC_Test_String);
--        --Translate(LC_Test_String,Upper_Case_Map);
--        --        Strings.Wide_Wide_Fixed.
--        --Ada.Wide_Wide_Characters.Handling.
--        t1 : constant Wide_Wide_String:= "ΣΟΣ";
--        t2 : constant Wide_Wide_String:= "σος";
--        Equivelant : constant Boolean :=
--          Ada.Strings.Equal_Case_Insensitive(t1,t2);
--        --        Ada.Strings.Wide_Wide_Fixed.
--
--
--  --          Ada.Strings.Equal_Case_Insensitive();
--  --          wide_wide_
--     begin
--        Ada.Text_IO.Put( "Test: " );
--        Ada.Wide_Wide_Text_IO.Put( LC_Test_String );
--        Ada.Text_IO.Put( " --> " );
--        Ada.Wide_Wide_Text_IO.Put( Translated );
--        Ada.Text_IO.New_Line;
--        Ada.Text_IO.Put( "Equiv: " & Boolean'Image( Equivelant ) );
--        Ada.Text_IO.New_Line(2);
--     End CASING_TEST;

   Ada.Wide_Wide_Text_IO.Close(File);
   Ada.Wide_Wide_Text_IO.Put_Line( "Done." );
End Parser;
