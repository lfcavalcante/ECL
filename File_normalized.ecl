IMPORT $;
myData := $.File_transhufid;
IPTU1 :=$.File_parametros.myAggs;


// atk := IPTU1(number=1)[1].mean;
Layout := RECORD
 myData.id;
 DECIMAL QUANTIDADE_DE_ESQUINAS_FRENTES;
 
 DECIMAL AREA_DO_TERRENO;
 DECIMAL AREA_CONSTRUIDA;
 DECIMAL AREA_OCUPADA;
 DECIMAL ANO_DA_CONSTRUCAO_CORRIGIDO;
 DECIMAL QUANTIDADE_DE_PAVIMENTOS;
 myData.TESTADA_PARA_CALCULO;
 DECIMAL zona;
 
 DECIMAL condominio;
 
 DECIMAL area_exc;
 myData.construcao;
 myData.terreno;
 myData.excesso;
 myData.NUMERO_DO_CONTRIBUINTE;
 myData.CEP_DO_IMOVEL;



END;

Layout cc ($.File_transhufid Le) := TRANSFORM


 
 SELF.QUANTIDADE_DE_ESQUINAS_FRENTES := (Le.QUANTIDADE_DE_ESQUINAS_FRENTES - IPTU1(number=1)[1].mean) / IPTU1(number=1)[1].sd ;
 
 SELF.AREA_DO_TERRENO:= (Le.AREA_DO_TERRENO - IPTU1(number=2)[1].mean) / IPTU1(number=2)[1].sd;
 SELF.AREA_CONSTRUIDA:= (Le.AREA_CONSTRUIDA - IPTU1(number=3)[1].mean) / IPTU1(number=3)[1].sd;
 SELF.AREA_OCUPADA:= (Le.AREA_OCUPADA - IPTU1(number=4)[1].mean) / IPTU1(number=4)[1].sd;
 SELF.ANO_DA_CONSTRUCAO_CORRIGIDO:= (Le.ANO_DA_CONSTRUCAO_CORRIGIDO - IPTU1(number=5)[1].mean) / IPTU1(number=5)[1].sd;
 SELF.QUANTIDADE_DE_PAVIMENTOS:= (Le.QUANTIDADE_DE_PAVIMENTOS - IPTU1(number=6)[1].mean) / IPTU1(number=6)[1].sd;
 SELF.TESTADA_PARA_CALCULO:= (Le.TESTADA_PARA_CALCULO - IPTU1(number=7)[1].mean) / IPTU1(number=7)[1].sd;
 SELF.zona:= (Le.zona - IPTU1(number=8)[1].mean) / IPTU1(number=8)[1].sd;
 
 SELF.condominio:= (Le.condominio - IPTU1(number=9)[1].mean) / IPTU1(number=9)[1].sd;
 
 SELF.area_exc:= (Le.area_exc - IPTU1(number=10)[1].mean) / IPTU1(number=10)[1].sd;
 SELF.construcao:= (Le.construcao - IPTU1(number=11)[1].mean) / IPTU1(number=11)[1].sd;
 SELF.terreno := (Le.terreno - IPTU1(number=12)[1].mean) / IPTU1(number=12)[1].sd;
 SELF.excesso := (Le.excesso - IPTU1(number=13)[1].mean) / IPTU1(number=13)[1].sd;
 
SELF := LE;

END;

Venal := PROJECT(myData, cc(LEFT));



EXPORT File_normalized := Venal : PERSIST('~USP::IC::PERSIST::Dados_normalizados');