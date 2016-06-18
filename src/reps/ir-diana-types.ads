Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
Ada.Containers.Indefinite_Ordered_Maps,
Ada.Wide_Wide_Characters.Handling,
IR.Diana.Sequences;

Package IR.Diana.Types is

   Type Internal( Sequence_of : Basic_Internal_Type;
                  Data_Type   : Extended_Internal_Type;
                  Length      : Natural
                ) is private;
   Function Print( Item : Internal ) return Wide_Wide_String;

   ----------------------------------------------------------

   Function Valid_Identifier( Input: Wide_Wide_String ) return Boolean;
   Subtype Identifier is Wide_Wide_String
     with Dynamic_Predicate => Valid_Identifier( Identifier );

   ----------------------------------------------------------



Private
   Package Seq renames IR.Diana.Sequences;
   Package ACH renames Ada.Wide_Wide_Characters.Handling;

   Type Internal( Sequence_of : Basic_Internal_Type;
                  Data_Type   : Extended_Internal_Type;
                  Length      : Natural
                ) is record
      case Data_Type is
         when bt_Sequence =>
            case Sequence_of is
               when bt_Boolean  => Boolean_Sequence : Seq.Boolean_Sequence;
               when bt_Integer  => Integer_Sequence : Seq.Integer_Sequence;
               when bt_Rational => Rational_Sequence: Seq.Rational_Sequence;
               when bt_Name     => Name_Sequence    : Seq.Name_Sequence;
            end case;
         when others => Basic_Value : Basic_Internal(Data_Type, Length);
      end case;
   end record;

   Function Sequence( Item : Internal ) return IR.Diana.Sequences.Internal_Sequence_Pkg.Vector is
     (case Item.Sequence_of is
         when bt_Boolean  => Item.Boolean_Sequence,
         when bt_Integer  => Item.Integer_Sequence,
         when bt_Rational => Item.Rational_Sequence,
         when bt_Name     => Item.Name_Sequence
      ) with Pre => Item.Data_Type = bt_Sequence;

   Function Print( Item : Internal ) return Wide_Wide_String is
     (case Item.Data_Type is
         when Basic_Internal_Type => Print(Item.Basic_Value),
         when bt_Sequence         => IR.Diana.Sequences.Print( Sequence(Item) )
     );


   Function Valid_Identifier( Input: Wide_Wide_String ) return Boolean is
     ( Input'Length in Positive and then
      ACH.Is_Letter(Input(Input'First)) and then
      ACH.Is_Alphanumeric(Input(Input'Last)) and then
        (for all Ch of Input => Ch = '_' or ACH.Is_Alphanumeric(Ch)) and then
          (for all Index in Input'First..Positive'Pred(Input'Last) =>
             (if Input(Index) = '_' then Input(Index+1) /= '_')
          )
     );

End IR.Diana.Types;
