Generic
    Type Prefix_Type(<>) is new Prefix with private;
    with function Init return Prefix_Type is <>;
Function Parslets.Generic_Prefix_Create( Parser : not null access Parslets.Parser ) return Prefix_Type
with Inline;
