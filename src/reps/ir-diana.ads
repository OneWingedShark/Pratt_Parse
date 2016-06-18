Pragma Ada_2012;
Pragma Assertion_Policy( Check );


Package IR.Diana with Pure is

   Type Internal_Type is (
      bt_Boolean,	-- Internal Boolean attribute.
      bt_Integer,	-- Internal Integer attribute
      bt_Rational,	-- Internal float/fixed number.
      bt_Name,		-- A name.
      bt_Sequence,	-- A sequence of the given type.
      bt_User		-- A user-defined type.
     );

   subtype Basic_Internal_Type is Internal_Type range Internal_Type'First..bt_Name;
   subtype Extended_Internal_Type is Internal_Type range Internal_Type'First..bt_Sequence;

   Type Basic_Internal( Data_Type : Basic_Internal_Type; Length : Natural ) is private;
   Function Print( Item : Basic_Internal ) return Wide_Wide_String;

Private

   Type Basic_Internal( Data_Type : Basic_Internal_Type; Length : Natural ) is record
      case Data_Type is
         when bt_Boolean  => Boolean_Value  : Boolean;
         when bt_Integer  => Integer_Value  : Long_Long_Integer;
         when bt_Rational => Rational_Value : Long_Long_Float;
         when bt_Name     => Name_Value     : Wide_Wide_String(1..Length);
      end case;
   end record;

   Function Print( Item : Basic_Internal ) return Wide_Wide_String is
     (case Item.Data_Type is
         when bt_Boolean  => Boolean'Wide_Wide_Image(Item.Boolean_Value),
         when bt_Integer  => Long_Long_Integer'Wide_Wide_Image(Item.Integer_Value),
         when bt_Rational => Long_Long_Float'Wide_Wide_Image(Item.Rational_Value),
         when bt_Name     => Item.Name_Value
     );


End IR.Diana;
