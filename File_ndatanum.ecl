IMPORT STD;
ds := $.FIle_ndatas;



Layout := RECORD
 // INTEGER ID;
 
 ds.QUANTIDADE_DE_ESQUINAS_FRENTES;
 
 ds.AREA_DO_TERRENO;
 ds.AREA_CONSTRUIDA;
 ds.AREA_OCUPADA;
 // ds.VALOR_DO_M2_DO_TERRENO;
 // ds.VALOR_DO_M2_DE_CONSTRUCAO;
 ds.ANO_DA_CONSTRUCAO_CORRIGIDO;
 ds.QUANTIDADE_DE_PAVIMENTOS;
 ds.TESTADA_PARA_CALCULO; 
 ds.zona;
 // ds.profundidade_eq;
 // ds.fatordeprof;
 ds.condominio;
 // ds.fator_terreno;
 ds.area_exc;
 ds.construcao;
 ds.terreno;
 ds.excesso;
 
 UNSIGNED NUMERO_DO_CONTRIBUINTE:= (UNSIGNED)STD.Str.FindReplace(ds.NUMERO_DO_CONTRIBUINTE,'-','');
 UNSIGNED CEP_DO_IMOVEL:= (UNSIGNED)STD.Str.FindReplace(ds.CEP_DO_IMOVEL,'-','');
END;

Venal := TABLE(ds,LAYOUT);
EXPORT File_ndatanum := Venal;

