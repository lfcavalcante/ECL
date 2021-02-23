IMPORT STD;
ds := $.FIle_ndatanum;

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
 UNSIGNED zona;
 // ds.profundidade_eq;
 // ds.fatordeprof;
 UNSIGNED condominio;
 // ds.fator_terreno;
 ds.area_exc;
 ds.construcao;
 ds.terreno;
 ds.excesso;
 
 INTEGER NUMERO_DO_CONTRIBUINTE;
 INTEGER CEP_DO_IMOVEL;
END;



zona(STRING z) := FUNCTION
 zona1 := z = '1SZU';
 zona2 := z = '2SZU';
 zona3 := z = '3SZU';
 
 RETURN MAP(zona1 => 1,
 zona2 => 2,
 zona3 => 3, 
 0);
END;

condominio(DECIMAL c) := FUNCTION
 cond := c != 1;
 
 
 RETURN MAP(cond => 1,
 0);
END;

Layout cc ($.FIle_ndatanum Le) := TRANSFORM
// SELF.ID := cnt;
 
SELF.zona := zona(Le.zona);
SELF.condominio := condominio(Le.condominio);
// SELF.NUMERO_DO_CONTRIBUINTE := INTFORMAT (ds.NUMERO_DO_CONTRIBUINTE,11,1);
// SELF.CEP_DO_IMOVEL := INTFORMAT (ds.CEP_DO_IMOVEL,8,1);

SELF := Le;

END;

Venal := PROJECT (ds, cc(LEFT));
EXPORT File_nuntrans := Venal;