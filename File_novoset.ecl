IMPORT $;
Vencomp := $.File_Vencomp;
IsCEP := Vencomp.CEP_DO_IMOVEL = '05303-000';
IsConstr := Vencomp.construcao != 0;
Iszona := Vencomp.zona = '1SZU';

// EXPORT File_novoset := IsConstr AND Iszona AND IsCEP;
EXPORT File_novoset := IsConstr AND Iszona;
