With
Ada.Containers.Indefinite_Holders;

Package Expressions.Holders is new Ada.Containers.Indefinite_Holders(
       Element_Type => Expression'Class
      ) with Preelaborate;
