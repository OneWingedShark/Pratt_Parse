Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
Ada.Containers.Indefinite_Vectors;

Package IR.Diana.Sequences is

   package Internal_Sequence_Pkg is new Ada.Containers.Indefinite_Vectors(
     Index_Type   => Positive,
     Element_Type => IR.Diana.Basic_Internal
    );

   Function Check_Type(Seq      : Internal_Sequence_Pkg.Vector) return Boolean;
   Function Check_Type(Seq      : Internal_Sequence_Pkg.Vector;
                       Seq_Type : IR.Diana.Basic_Internal_Type
                      ) return Boolean is
     (for all Item of Seq => Item.Data_Type = Seq_Type);

   subtype Boolean_Sequence is Internal_Sequence_Pkg.Vector
     with Dynamic_Predicate => Check_Type( Boolean_Sequence, bt_Boolean );

   subtype Integer_Sequence is Internal_Sequence_Pkg.Vector
     with Dynamic_Predicate => Check_Type( Integer_Sequence, bt_Integer );

   subtype Rational_Sequence is Internal_Sequence_Pkg.Vector
     with Dynamic_Predicate => Check_Type( Rational_Sequence, bt_Rational );

   subtype Name_Sequence is Internal_Sequence_Pkg.Vector
     with Dynamic_Predicate => Check_Type( Name_Sequence, bt_Name );


   Function Print(Seq : Internal_Sequence_Pkg.Vector) return Wide_Wide_String;

private

   Function Check_Type(Seq : Internal_Sequence_Pkg.Vector) return Boolean is
     (if Seq.Is_Empty then True
      else Check_Type(Seq, Seq.First_Element.Data_Type)
     );

   Function Print(Seq : Internal_Sequence_Pkg.Vector; Index : Natural) return Wide_Wide_String is
     (if Index not in Positive then ""
      elsif Index = 1 then Print( Seq(1) )
      elsif Index > Seq.Last_Index then Print(Seq, seq.Last_Index)
      else Print(Seq, Index-1) & ", " & Print( Seq(Index) )
     );

   Function Print(Seq : Internal_Sequence_Pkg.Vector) return Wide_Wide_String is
     ('[' &
      ( Print(Seq, Seq.Last_Index) ) &
      ']'
     );

End IR.Diana.Sequences;
