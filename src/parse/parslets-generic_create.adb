Function Parslets.Generic_Create( Parser : not null access Parslets.Parser ) return Parselet_Type is
Begin
    -- We return the default pbject here.
    Return Result : Parselet_Type;
End Parslets.Generic_Create;
