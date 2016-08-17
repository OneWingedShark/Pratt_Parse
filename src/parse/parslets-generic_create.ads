Generic
    Type Parselet_Type is new Abstract_Parslet with private;
Function Parslets.Generic_Create( Parser : not null access Parslets.Parser ) return Parselet_Type
with Inline;
