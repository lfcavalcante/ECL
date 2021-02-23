﻿IMPORT $;
IMPORT STD;
IPTU :=$.File_IPTU2019.File2019;
 

ds := IPTU;
EXPORT Iptufix := MODULE

EXPORT Layout := RECORD
 ds.NUMERO_DO_CONTRIBUINTE;
 // UNSIGNED ANO_DO_EXERCICIO;
 // UNSIGNED NUMERO_DA_NL;
 // STRING DATA_DO_CADASTRAMENTO;
 // STRING TIPO_DE_CONTRIBUINTE_1;
 // STRING CPF_CNPJ_DO_CONTRIBUINTE_1;
 // STRING NOME_DO_CONTRIBUINTE_1; 
 // STRING TIPO_DE_CONTRIBUINTE_2;
 // STRING CPF_CNPJ_DO_CONTRIBUINTE_2;
 // STRING NOME_DO_CONTRIBUINTE_2;
 ds.NUMERO_DO_CONDOMINIO;
 // STRING CODLOG_DO_IMOVEL;
 // STRING NOME_DE_LOGRADOURO_DO_IMOVEL;
 // UNSIGNED NUMERO_DO_IMOVEL;
 // STRING COMPLEMENTO_DO_IMOVEL;
 // STRING BAIRRO_DO_IMOVEL;
 // STRING REFERENCIA_DO_IMOVEL;
 // STRING CEP_DO_IMOVEL;
 ds.QUANTIDADE_DE_ESQUINAS_FRENTES;
 decimal5_4 FRACAO_IDEAL:= (decimal5_4)STD.Str.SubstituteIncluded(ds.FRACAO_IDEAL,',','.');
 ds.AREA_DO_TERRENO;
 ds.AREA_CONSTRUIDA;
 ds.AREA_OCUPADA;
 ds.VALOR_DO_M2_DO_TERRENO;
 ds.VALOR_DO_M2_DE_CONSTRUCAO;
 ds.ANO_DA_CONSTRUCAO_CORRIGIDO;
 ds.QUANTIDADE_DE_PAVIMENTOS;
 decimal6_2 TESTADA_PARA_CALCULO:= (decimal6_2)STD.Str.SubstituteIncluded(ds.TESTADA_PARA_CALCULO,',','.');
 ds.TIPO_DE_USO_DO_IMOVEL;
 ds.TIPO_DE_PADRAO_DA_CONSTRUCAO;
 ds.TIPO_DE_TERRENO;
 decimal5_4 FATOR_DE_OBSOLESCENCIA := (decimal5_4)STD.Str.SubstituteIncluded(ds.FATOR_DE_OBSOLESCENCIA,',','.');
 
 // UNSIGNED ANO_DE_INICIO_DA_VIDA_DO_CONTRIBUINTE;
 // UNSIGNED MES_DE_INICIO_DA_VIDA_DO_CONTRIBUINTE;
 // UNSIGNED FASE_DO_CONTRIBUINTE;
 END;
EXPORT File2019 := TABLE(ds,Layout): PERSIST('~IC::LF::PERSIST::IPTU_2019');

// EXPORT File2018 := DATASET('~IC::LF::IPTU_2018',Layout,CSV(HEADING(1)));
// EXPORT File2017 := DATASET('~usp::ic::lf::iptu_2017',Layout,CSV(HEADING(1)));
// EXPORT File2016 := DATASET('~usp::ic::lf::iptu_2016',Layout,CSV(HEADING(1)));
// EXPORT File2015 := DATASET('~usp::ic::lf::iptu_2015',Layout,CSV(HEADING(1)));
// EXPORT File2014 := DATASET('~usp::ic::lf::iptu_2014',Layout,CSV(HEADING(1)));
// EXPORT File2013 := DATASET('~usp::ic::lf::iptu_2013',Layout,CSV(HEADING(1)));
// EXPORT File2012 := DATASET('~usp::ic::lf::iptu_2012',Layout,CSV(HEADING(1)));
// EXPORT File2011 := DATASET('~usp::ic::lf::iptu_2011',Layout,CSV(HEADING(1)));
// EXPORT File2010 := DATASET('~usp::ic::lf::iptu_2010',Layout,CSV(HEADING(1)));
// Files := (+)(File2019,File2018,File2017,File2016,File2015);

// EXPORT Years := Files;

//EXPORT Files:= DATASET('~IC::LF::pregao_2019',Layout,CSV());

END;

