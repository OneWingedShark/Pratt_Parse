Pragma Ada_2012;
Pragma Assertion_Policy( Check );

Private Package Lexington.Consumer_Functions with Pure is

   Function Epsilon_Function
     (Characters : not null access Ada.Streams.Root_Stream_Type'Class)
       return Boolean is (True);

   Function Nil_Function
     (Characters : not null access Ada.Streams.Root_Stream_Type'Class)
       return Boolean is (False);

   -- Comments,
   -- Separators,
   -- Whitespace,
   -- Identifiers,
   -- Literals
--     Function "+"(Right : Recognizer) return Discriminator;
End Lexington.Consumer_Functions;
