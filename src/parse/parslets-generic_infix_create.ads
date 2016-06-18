Generic
    Type Infix_Type(<>) is new Infix with private;
    with function Init return Infix_Type is <>;
Function Parslets.Generic_Infix_Create( Parser : not null access Parslets.Parser ) return Infix_Type
with Inline;
