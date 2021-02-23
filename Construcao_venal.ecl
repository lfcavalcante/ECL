IMPORT $;
// IMPORT STD;
Isso := $.Iptufix.File2019;
Tabel := $.File_TabelaVI.TabelaVI;

// EXPORT Construcao_venal := MODULE
VenalLayout := RECORD
	
	$.Iptufix.Layout;
	
	STRING Zona;
	// UNSIGNED Construcao;
	UNSIGNED Profundidade_Eq;
	DECIMAL5_4 FatordeProf;
	DECIMAL3_2 Condominio;
	
	
END;


VenalLayout cc($.Iptufix.Layout Le,$.File_TabelaVI.Layout Ri) := TRANSFORM

// SELF.Construcao := Le.AREA_CONSTRUIDA*Le.VALOR_DO_M2_DE_CONSTRUCAO*Le.FATOR_DE_OBSOLESCENCIA;
SELF.Zona := Ri.Zona;
SELF.Profundidade_Eq := IF(Le.TESTADA_PARA_CALCULO != 0, Le.AREA_DO_TERRENO / Le.TESTADA_PARA_CALCULO, 1);
SELF.Fatordeprof := 1.0000;
SELF.Condominio := IF(Le.NUMERO_DO_CONDOMINIO != '00-0' AND (Le.TIPO_DE_PADRAO_DA_CONSTRUCAO[1..20] = 'Residencial vertical' OR Le.TIPO_DE_PADRAO_DA_CONSTRUCAO[1..18] = 'Comercial vertical'),1.60,1.00);

SELF := Le;
END;
// Venal := PROJECT(Isso, cc(LEFT));
Venal := JOIN(Isso,Tabel,LEFT.TIPO_DE_PADRAO_DA_CONSTRUCAO = RIGHT.Tipop AND LEFT.VALOR_DO_M2_DE_CONSTRUCAO = RIGHT.Valor, cc(LEFT,RIGHT),LEFT OUTER);

// EXPORT Venalk := Venal;
EXPORT Construcao_venal := Venal: PERSIST('~USP::IC::PERSIST::Venals');