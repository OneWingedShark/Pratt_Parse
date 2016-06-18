Pragma Ada_2012;
Pragma Assertion_Policy( Check );

pragma Warnings(OFF);
with
GNAT.Spitbol.Patterns,
GNAT.Spitbol.Table_Boolean,
GNAT.Spitbol.Table_Integer,
GNAT.Spitbol.Table_VString,
Ada.Strings.Unbounded,
Ada.Streams;
pragma Warnings(ON);

Package SNOBOL is --with Preelaborate is -- with Pure is

   subtype VString is Ada.Strings.Unbounded.Unbounded_String;

   function V (Source : String) return VString
     renames Ada.Strings.Unbounded.To_Unbounded_String;

   function S (Source : VString) return String
     renames Ada.Strings.Unbounded.To_String;

   Nul : VString renames Ada.Strings.Unbounded.Null_Unbounded_String;



End SNOBOL;
