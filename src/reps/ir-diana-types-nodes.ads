Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
Ada.Containers.Indefinite_Ordered_Maps;

Package IR.Diana.Types.Nodes is new Ada.Containers.Indefinite_Ordered_Maps(
--        "<"          => ,
--        "="          => ,
      Key_Type     => Identifier,
      Element_Type => Internal
   );
