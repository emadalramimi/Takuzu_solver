package body Resolution_Takuzu is

   --------------------
   -- CompleterLigne --
   --------------------

   procedure CompleterLigne
     (G   : in out Type_Grille; IsSolved : out Boolean; L : in Integer;
      Col : in     Integer)
   is
      Current_Line : Type_Rangee     := extraireLigne (G, L);
      Coordinate   : Type_Coordonnee := ConstruireCoordonnees (L, Col);
      SG           : Type_Grille     := G;
      V            : Type_Chiffre    := ZERO;
   begin
      IsSolved := False;
      --verifi que la grille est juste si elle rempli des l'entrÃ©e dans la fonction
      if EstRemplie (SG) then
         if VerifierGrille (SG) then
            IsSolved := True;
         end if;
         --regarde si la ligne est rempli si elle est rempli en passe a la suivante
      elsif EstRemplie (Current_Line) then
         CompleterLigne (G, IsSolved, L + 1, 1);
         --regarde si le chiffre ou en est inconnu
      elsif EstInconnue (ObtenirChiffre (Current_Line, Col)) then
         V := ZERO;
         --verifi tout les possibiliter de cette case
         for temp in 1 .. 2 loop
            if not IsSolved and not EstInconnue (V)  and CheckValuePossibility(G,Coordinate,V)  then

               SG := FixerChiffre (G, Coordinate, V);

               if (not EstRemplie (SG)) then
                  if Col = Taille (Current_Line) then
                     CompleterLigne (SG, IsSolved, L + 1, 1);
                  else
                     CompleterLigne (SG, IsSolved, L, Col + 1);
                  end if;
               end if;
               --verifi si avec la valeur on a trouver la solution
               if VerifierGrille (SG) then
                  IsSolved := True;
                  G        := SG;
               end if;
            end if;
        \\    --pour passer de 1 a 0 ou 0 a 1
            V := Complement (V);
         end loop;
      else
         --si la casse elle est rempli on passe a la suivante
         if Col = Taille(Current_Line) then
         --reutilisation de completerligne recurence backtraking

            CompleterLigne (G, IsSolved, L + 1, 1);
         else
            CompleterLigne (G, IsSolved, L, Col + 1);
         end if;
      end if;

   end CompleterLigne;

   ----------------------
   -- CompleterColonne --
   ----------------------

   procedure CompleterColonne
     (G   : in out Type_Grille; IsSolved : out Boolean; L : in Integer;
      Col : in     Integer)
   is
      Current_Column : Type_Rangee     := extraireColonne (G, Col);
      Coordinate     : Type_Coordonnee := ConstruireCoordonnees (L, Col);
      SG             : Type_Grille     := G;
      V              : Type_Chiffre    := ZERO;
   begin
      IsSolved := False;

      if EstRemplie (G) then
         if VerifierGrille (G) then
            IsSolved := True;
         end if;
      elsif EstRemplie (Current_Column) then
         CompleterColonne (G, IsSolved, 1, Col + 1);
      elsif EstInconnue (ObtenirChiffre (Current_Column, L)) then
         V := ZERO;
         for temp in 1 .. 2 loop
            if not IsSolved and not EstInconnue (V) and CheckValuePossibility(G,Coordinate,V) then

               SG := FixerChiffre (G, Coordinate, V);

               if (not EstRemplie (SG)) then
                  if L = Taille (Current_Column) then
                     if (L /= Taille (Current_Column)) then
                        CompleterColonne (SG, IsSolved, 1, Col + 1);
                     end if;
                  else
                     CompleterColonne (SG, IsSolved, L + 1, Col);
                  end if;
               elsif VerifierGrille (SG) then
                  Put_Line("Done");
                  IsSolved := True;
                  G        := SG;
                  AfficherGrille(G);
               end if;

            end if;
            V := Complement(V);
         end loop;
      else
         if (not EstRemplie (SG)) then
            if L = Taille (Current_Column) then
               if (L /= Taille (Current_Column)) then
                  CompleterColonne (G, IsSolved, 1, Col + 1);
               end if;
            else
               CompleterColonne (G, IsSolved, L + 1, Col);
            end if;
         end if;
      end if;
   end CompleterColonne;
--verifi pour voir si la valeur peut etre inserter la a l'emplacement defini dans la grille
   function CheckValuePossibility(G : in Type_Grille;C : Type_Coordonnee;V :Type_Chiffre) return Boolean
   is
   begin
      return CheckValuePossibility(extraireColonne(G,ObtenirColonne(C)),ObtenirLigne(C),V) and  CheckValuePossibility(extraireLigne(G,ObtenirLigne(C)),ObtenirColonne(C),V);
   end CheckValuePossibility;
--verifi pour voir si la valeur peut etre inserter la a l'emplacement defini dans la ranger
   function CheckValuePossibility(R : in Type_Rangee;I : in Integer; V: Type_Chiffre) return Boolean
   is

      LeftNumber: Type_Chiffre := chiffreDeGauche(R,I);
      RightNumber: Type_Chiffre := chiffreDeDroite(R,I);
   begin
      if(nombreChiffresDeValeur(R,V) = Taille(R)/2) then
         return False;
      end if;

      if (LeftNumber = RightNumber and (not EstInconnue(RightNumber)) and RightNumber = V) then
         return False;
      elsif (SontDeuxChiffresDeDroiteEgaux(R,I) and V = RightNumber ) then
         return False;
      elsif (SontDeuxChiffresDeGaucheEgaux(R,I) and V = LeftNumber ) then
         return False;
      else
         return True;
      end if;

   end CheckValuePossibility;
--verifi si la grille est rempli
   function VerifierGrille (G : in Type_Grille) return Boolean is
   begin
      if (not EstRemplie(G)) then
         return False;
           end if;
      for i in 1 .. Taille (G) loop
         if (not VerifierRangee (extraireColonne (G, i))) or
           (not VerifierRangee (extraireLigne (G, i)))
         then
            return False;
         end if;

      end loop;

      return VerifierDoublon (G);

   end VerifierGrille;

   function VerifierDoublon (G : in Type_Grille) return Boolean is
   begin
      for i in 1 .. (Taille (G) - 1) loop
         for j in (i + 1) .. Taille (G) loop

            if (extraireLigne (G, i) = extraireLigne (G, j)) or
              (extraireColonne (G, i) = extraireColonne (G, j))
            then
               return False;
            end if;

         end loop;
      end loop;

      return True;
   end VerifierDoublon;

   function VerifierRangee (R : in Type_Rangee) return Boolean is
   --m : Type_Rangee;
   begin
      for i in 2 .. Taille (R)-1 loop

         if ObtenirChiffre (R, i) = chiffreDeDroite (R, i) and
           chiffreDeDroite (R, i) = chiffreDeGauche (R, i)
         then
            return False;
         end if;
      end loop;

      if nombreChiffresDeValeur (R, UN) /=
        nombreChiffresDeValeur (R, ZERO)
      then
         return False;
      end if;

      if not EstRemplie (R) then
         return False;
      end if;

      return True;
   end VerifierRangee;
   --------------------
   -- ResoudreTakuzu --
   --------------------

   procedure ResoudreTakuzu
     (G : in out Type_Grille; Trouve : out Boolean)
   is
   begin

      CompleterLigne (G, Trouve, 1, 1);
   end ResoudreTakuzu;

end Resolution_Takuzu;
