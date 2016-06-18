Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
Ada.Streams;

Function Readington (File : not null access
                       Ada.Streams.Root_Stream_Type'Class) return Wide_Wide_String;
