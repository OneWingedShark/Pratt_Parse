Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
Parslets.Generic_Prefix_Create,
Parslets.Generic_Infix_Create,
Expressions.List,
Expressions.Instances;

Package Body Parslets.Instances is

    -----------
    --  UTIL --
    -----------

   Procedure Consume(Parser   : in out Parslets.Parser;
                     Expected : in     Aux.Token_ID
                    ) is
      Temp : Aux.Token := Parslets.Consume(Parser, Expected);
   begin
      null;
   End Consume;


   Package EI renames Expressions.Instances;
   Package EL renames Expressions.List;
   Function "+"(Item : PE.Expression'Class) return EI.Expression_Holder_Pkg.Holder
      renames EI."+";
   Function "+"(Item : Wide_Wide_String) return EI.String_Holder_Pkg.Holder
      renames EI.String_Holder_Pkg.To_Holder;



    ------------------------------
    --  GENERIC INSTANTIATIONS  --
    ------------------------------

    Function Create_Instance is new Generic_Prefix_Create(Compilation_Unit);
    Function Create_Instance is new Generic_Infix_Create(Assign);
    Function Create_Instance is new Generic_Infix_Create(Binary_Operator);
    Function Create_Instance is new Generic_Infix_Create(Call_Parameters);
    Function Create_Instance is new Generic_Prefix_Create(Grouping_Parens);
    Function Create_Instance is new Generic_Prefix_Create( Name );


    ------------------------
    --  CREATE RENAMINGS  --
    ------------------------

    Function Create( Parser : not null access Parslets.Parser ) return Compilation_Unit renames Create_Instance;
    Function Create( Parser : not null access Parslets.Parser ) return Assign           renames Create_Instance;
    Function Create( Parser : not null access Parslets.Parser ) return Binary_Operator  renames Create_Instance;
    Function Create( Parser : not null access Parslets.Parser ) return Call_Parameters  renames Create_Instance;
    Function Create( Parser : not null access Parslets.Parser ) return Grouping_Parens  renames Create_Instance;
    Function Create( Parser : not null access Parslets.Parser ) return Name             renames Create_Instance;


    -----------------------
    --  PARSE FUNCTIONS  --
    -----------------------

    Function Parse(Item   : in     Compilation_Unit;
		   Parser : in out Parslets.Parser;
		   Token  : in     Aux.Token
		  ) return PE.Expression'Class is
    begin
	-- STUB.
	Return Parse(Parser, ASSIGNMENT-1);
    End Parse;


   Function Parse(Item   : in     Assign;
                  Parser : in out Parslets.Parser;
                  Left   : in     PE.Expression'Class;
                  Token  : in     Aux.Token
                 ) return PE.Expression'Class is
   Begin
      if (Left not in EI.Name_Expression'Class) then
         raise Program_Error with "The left-hand side of an assignment must be a name.";
      end if;

      declare
         Name_Object : EI.Name_Expression renames EI.Name_Expression( Left );
      begin
         return EI.Assignment_Expression'(
            Name  => +Name_Object,
            Value => +Parse(Parser, ASSIGNMENT-1) -- Right value.
           );
      end;
   End Parse;

   Function Parse(Item   : in     Binary_Operator;
                  Parser : in out Parslets.Parser;
                  Left   : in     PE.Expression'Class;
                  Token  : in     Aux.Token
                 ) return PE.Expression'Class is
      Offset : constant Integer := (if Item.Is_Right then -1 else 0);
      Right  : pe.Expression'Class := Parse(Parser, Item.Precedence - Offset);
   Begin
      Return EI.Operator_Expression'(
         Left     => +Left,
         Right    => +Right,
         Operator => ID(Token)
        );
   End Parse;

   Function Parse(Item   : in     Call_Parameters;
                  Parser : in out Parslets.Parser;
                  Left   : in     PE.Expression'Class;
                  Token  : in     Aux.Token
                 ) return PE.Expression'Class is
      Function Close_Paren return Boolean is
        ( Match(Parser, AUX.ch_Close_Paren) );
      Function Comma return Boolean is
        ( Match(Parser, AUX.ch_Comma) );

      Arguments : EL.Vector;
   Begin
      if Close_Paren then
         Raise Program_Error with "A parameterless subprogram has no parenthises.";
      else
         loop
            Arguments.Append( Parse(Parser) );
            Exit when not Comma;
         end loop;
         Consume(Parser, AUX.ch_Close_Paren);
      end if;

      Return EI.Call_Expression'(
         Fn        => +Left,
         Arguments =>  Arguments
        );
   End Parse;

   Function Parse(Item   : in     Grouping_Parens;
                  Parser : in out Parslets.Parser;
                  Token  : in     Aux.Token
                 ) return PE.Expression'Class is
      Expression : PE.Expression'Class renames Parse(Parser);
   Begin
      Consume( Parser, Aux.ch_Close_Paren );
      return Expression;
   End Parse;

   Function Parse(Item   : in     Name;
                  Parser : in out Parslets.Parser;
                  Token  : in     Aux.Token
                 ) return PE.Expression'Class is
    ( EI.Name_Expression'( Name => +(-Token) ) );

   ------------------------
   --  CREATE FUNCTIONS  --
   ------------------------


End Parslets.Instances;
