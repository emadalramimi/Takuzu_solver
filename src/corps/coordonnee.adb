package body Coordonnee is

   ---------------------------
   -- ConstruireCoordonnees --
   ---------------------------

   function ConstruireCoordonnees
     (Ligne, Colonne : in Integer) return Type_Coordonnee is
      Coo : Type_Coordonnee;
   begin
      Coo.Ligne := Ligne;
      coo.Colonne := Colonne;
      return Coo;
   end ConstruireCoordonnees;


   ------------------
   -- ObtenirLigne --
   ------------------

   function ObtenirLigne (C : in Type_Coordonnee) return Integer is
   begin
      return C.Ligne;
   end ObtenirLigne;


   --------------------
   -- ObtenirColonne --
   --------------------

   function ObtenirColonne (C : in Type_Coordonnee) return Integer is
   begin
      return C.Colonne;
   end ObtenirColonne;


end Coordonnee;
