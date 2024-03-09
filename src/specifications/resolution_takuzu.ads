with Grille;     use Grille;
with Coordonnee; use Coordonnee;
with Chiffre;    use Chiffre;
with Rangee;     use Rangee;
with Ada.Text_IO; use Ada.Text_IO;
with affichage;            use affichage;

package Resolution_Takuzu is

   -- RÃ¨gle 1 : complÃ¨te la lignes l qui ont dÃ©jÃ  4 UN ou 4 ZERO
   procedure CompleterLigne
     (G : in out Type_Grille; IsSolved : out Boolean; L : in Integer; Col :in Integer);

   -- RÃ¨gle 1 : complÃ¨te les colonnes qui ont dÃ©jÃ  4 UN ou 4 ZERO
   procedure CompleterColonne
     (G : in out Type_Grille; IsSolved : out Boolean; L : in Integer; Col :in Integer);
  function VerifierGrille (G : in Type_Grille) return Boolean;
  function VerifierDoublon (G : in Type_Grille) return Boolean;
  function VerifierRangee (R : in Type_Rangee) return Boolean;
  function CheckValuePossibility(G : in Type_Grille;C : Type_Coordonnee;V :Type_Chiffre) return Boolean;
  function CheckValuePossibility(R : in Type_Rangee;I : in Integer; V: Type_Chiffre) return Boolean;
   -- si la solution a ete trouve pour la grille g, alors Trouve est a VRAI et
   -- la grille est complete sinon Trouve est a FAUX et la grille n'a aucune
   -- valeur significative parcours la grille
   procedure ResoudreTakuzu (G : in out Type_Grille; Trouve : out Boolean);

end Resolution_Takuzu;
