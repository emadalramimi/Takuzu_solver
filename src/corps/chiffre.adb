package body Chiffre is

   -------------------
   -- ValeurChiffre --
   -------------------

   function ValeurChiffre (C : in Type_Chiffre) return Integer is
   begin
      return Integer(C);
   end ValeurChiffre;

   -----------------
   -- EstInconnue --
   -----------------

   function EstInconnue (C : in Type_Chiffre) return Boolean is
   begin
      if C = INCONNU then
           return True;
      end if;
      return FALSE;
   end EstInconnue;


   ----------------
   -- Complement --
   ----------------

   function Complement (C : in Type_Chiffre) return Type_Chiffre is
      CC : Type_Chiffre;
   begin
      if C = ZERO then
         CC := UN;
      elsif C = UN then
         CC := ZERO;
      else
         raise VALEUR_INCONNUE;
      end if;

      return CC;
   end Complement;


   ---------
   -- "=" --
   ---------

   function "="
     (c1 : in Type_Chiffre; c2 : in Type_Chiffre) return Boolean is
   begin
      if Integer(c1)=Integer(c2) then
         return True;
      else
         return False;
      end if;
   end "=";

end Chiffre;
