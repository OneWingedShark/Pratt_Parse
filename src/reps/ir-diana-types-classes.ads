Pragma Ada_2012;
Pragma Assertion_Policy( Check );

with
IR.Diana.Types.Nodes,
Ada.Containers.Indefinite_Ordered_Maps;

use
IR.Diana.Types.Nodes;

Package IR.Diana.Types.Classes is new Ada.Containers.Indefinite_Ordered_Maps(
--        "<"          => ,
--        "="          => ,
      Key_Type     => Identifier,
      Element_Type => IR.Diana.Types.Nodes.Map
   );
