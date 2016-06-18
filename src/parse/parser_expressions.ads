Pragma Ada_2012;
Pragma Assertion_Policy( Check );

With
Lexington.Aux;

Package Parser_Expressions is

   Type Expression is abstract tagged null record;
   Function As_String( Item : Expression ) return Wide_Wide_String is abstract;
   Function Print( Item : Expression'Class ) return Wide_Wide_String;

private
   Function Print( Item : Expression'Class ) return Wide_Wide_String is
     ( As_String(Item) );
End Parser_Expressions;
