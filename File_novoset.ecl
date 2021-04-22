// IMPORT $;
Vencomp := $.File_Vencomp;
IsCEP := Vencomp.CEP_DO_IMOVEL = '05145-000';
IsCEP2 := Vencomp.CEP_DO_IMOVEL = '04297-000';
IsCEP3 := Vencomp.CEP_DO_IMOVEL = '03210-001';
IsConstr := Vencomp.construcao != 0;
Iszona := Vencomp.zona = '1SZU';
IsCond := Vencomp.condominio != 1;
IsNotCond := Vencomp.condominio = 1;


// EXPORT File_novoset := IsConstr AND Iszona AND IsCEP;
// EXPORT File_novoset := IsConstr AND (IsCEP OR IsCEP2 OR IsCEP3);
// EXPORT File_novoset := IsConstr AND Iszona;
EXPORT File_novoset := IsConstr;
// EXPORT File_novoset := IsConstr AND Iszona AND IsCEP AND IsNotCond;
