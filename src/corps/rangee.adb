pragma Ada_2012;
package body Rangee is

   ----------------------
   -- ConstruireRangee --
   ----------------------

   function ConstruireRangee (T : in Integer) return Type_Rangee is
      R : Type_Rangee;
   begin
      R.Taille := T;
      for i in 1 .. T loop
         R.R(i) := INCONNU;
      end loop;
      return R;
   end ConstruireRangee;

   -------------
   -- EstVide --
   -------------

   function EstVide (R : in Type_Rangee) return Boolean is
   begin
      for i in 1 .. R.Taille loop
         if R.R(i) /= INCONNU then
            return False;
         end if;
      end loop;
      return True;
   end EstVide;

   ----------------
   -- EstRemplie --
   ----------------

   function EstRemplie (R : in Type_Rangee) return Boolean is
   begin
      for i in 1 .. R.Taille loop
         if EstInconnue(R.R(i)) then
            return False;
         end if;
      end loop;
      return True;
   end EstRemplie;

   ------------
   -- Taille --
   ------------

   function Taille (R : in Type_Rangee) return Integer is
   begin
      return R.Taille;
   end Taille;

   --------------------
   -- ObtenirChiffre --
   --------------------

   function ObtenirChiffre
     (R : in Type_Rangee; I : in Integer) return Type_Chiffre
   is
   begin
      if I < 1 or I > R.Taille then
         raise TRANCHE_INVALIDE;
      end if;

      return R.R(I);
   end ObtenirChiffre;

   --------------------------
   -- nombreChiffresConnus --
   --------------------------

   function nombreChiffresConnus (R : in Type_Rangee) return Integer is
      cpt : Integer;
   begin
      cpt := 0;
      for i in 1 .. R.Taille loop
         if R.R(i) /= INCONNU then
            cpt := cpt+1;
         end if;
      end loop;
      return cpt;
   end nombreChiffresConnus;

   ----------------------------
   -- nombreChiffresDeValeur --
   ----------------------------

   function nombreChiffresDeValeur
     (R : in Type_Rangee; V : in Type_Chiffre) return Integer
   is
      cpt : Integer;
   begin
      cpt := 0;
      for i in 1 .. R.Taille loop
         if R.R(i) = V then
            cpt := cpt+1;
         end if;
      end loop;
      return cpt;
   end nombreChiffresDeValeur;

   ---------------------
   -- chiffreDeDroite --
   ---------------------

   function chiffreDeDroite
     (E : in Type_Rangee; I : in Integer) return Type_Chiffre
   is
   begin
      if I < 1 or I > E.Taille then
         raise TRANCHE_INVALIDE;
      end if;
      if I = E.Taille then
         return INCONNU;
      end if;
      return E.R(I+1);
   end chiffreDeDroite;

   ---------------------
   -- chiffreDeGauche --
   ---------------------

   function chiffreDeGauche
     (E : in Type_Rangee; I : in Integer) return Type_Chiffre
   is
   begin
      if I < 1 or I > E.Taille then
         raise TRANCHE_INVALIDE;
      end if;
      if I = 1 then
         return INCONNU;
      end if;
      return E.R(I-1);
   end chiffreDeGauche;

   -----------------------------------
   -- SontDeuxChiffresDeDroiteEgaux --
   -----------------------------------

   function SontDeuxChiffresDeDroiteEgaux
     (E : in Type_Rangee; I : in Integer) return Boolean
   is
   begin
      if I < 1 or I > E.Taille then
         raise TRANCHE_INVALIDE;
      end if;
      if I = E.Taille or I = E.Taille-1 then
         return False;
      end if;
      return E.R(I+1) /= INCONNU and E.R(I+2) /= INCONNU and E.R(I+1) = E.R(I+2);
   end SontDeuxChiffresDeDroiteEgaux;

   -----------------------------------
   -- SontDeuxChiffresDeGaucheEgaux --
   -----------------------------------

   function SontDeuxChiffresDeGaucheEgaux
     (E : in Type_Rangee; I : in Integer) return Boolean
   is
   begin
      if I < 1 or I > E.Taille then
         raise TRANCHE_INVALIDE;
      end if;
      if I = 1 or I = 2 then
         return False;
      end if;
      return E.R(I-1) /= INCONNU and E.R(I-2) /= INCONNU and E.R(I-1) = E.R(I-2);
   end SontDeuxChiffresDeGaucheEgaux;

   --------------------
   -- AjouterChiffre --
   --------------------

   function AjouterChiffre
     (R : in Type_Rangee; I : in Integer; C : in Type_Chiffre)
      return Type_Rangee
   is
      R1: Type_Rangee;
   begin
      if I < 1 or I > R.Taille then
         raise TRANCHE_INVALIDE;
      end if;
      R1:=R;
      R1.R(I) := C;
      return R1;
   end AjouterChiffre;

   --------------------
   -- RetirerChiffre --
   --------------------

   function RetirerChiffre
     (R : in Type_Rangee; I : in Integer) return Type_Rangee
   is
      R1:Type_Rangee;
   begin
      if I < 1 or I > R.Taille then
         raise TRANCHE_INVALIDE;
      end if;

      R1:=R;
      R1.R(I) := INCONNU;
      return R1;
   end RetirerChiffre;

end Rangee;
