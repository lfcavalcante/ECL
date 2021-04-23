
IMPORT $;
IMPORT ML_Core;


blobs := $.File_CEPclusterizado.Venal2;
Isso := $.File_centroidmean;

Layout := RECORD
	$.File_CEPclusterizado.Venal2;
	DECIMAL Distancia;


END;

// abba (UNSIGNED sec) := FUNCTION

		// k := blobs(clusterid = sec);
		// ML_Core.ToField(k,recs);
		// ola := ML_Core.FieldAggregates(recs).simple;
	// RETURN ola;

// END;

// dist (UNSIGNED dec, DECIMAL p1, DECIMAL p2, DECIMAL p3, DECIMAL p4, DECIMAL p5, DECIMAL p6, DECIMAL p7, DECIMAL p8,
// DECIMAL p9, DECIMAL p10, DECIMAL p11, DECIMAL p12, DECIMAL p13) := FUNCTION

		// a1 := POWER(p1 - abba(dec)(number=1)[1].mean, 2.0);
		// a2 := POWER(p2 - abba(dec)(number=2)[1].mean, 2.0);
		// a3 := POWER(p3 - abba(dec)(number=3)[1].mean, 2.0);
		// a4 := POWER(p4 - abba(dec)(number=4)[1].mean, 2.0);
		// a5 := POWER(p5 - abba(dec)(number=5)[1].mean, 2.0);
		// a6 := POWER(p6 - abba(dec)(number=6)[1].mean, 2.0);
		// a7 := POWER(p7 - abba(dec)(number=7)[1].mean, 2.0);
		// a8 := POWER(p8 - abba(dec)(number=8)[1].mean, 2.0);
		// a9 := POWER(p9 - abba(dec)(number=9)[1].mean, 2.0);
		// a10 := POWER(p10 - abba(dec)(number=10)[1].mean, 2.0);
		// a11 := POWER(p11 - abba(dec)(number=11)[1].mean, 2.0);
		// a12 := POWER(p12 - abba(dec)(number=12)[1].mean, 2.0);
		// a13 := POWER(p13 - abba(dec)(number=13)[1].mean, 2.0);
		
		// result := SQRT(a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13);
		
		
		
	// RETURN result; 

// END;

dist (UNSIGNED dec, DECIMAL p1, DECIMAL p2, DECIMAL p3, DECIMAL p4, DECIMAL m1, DECIMAL m2, DECIMAL m3, DECIMAL m4) := FUNCTION

		a1 := POWER(p1 - m1, 2.0);
		a2 := POWER(p2 - m2, 2.0);
		a3 := POWER(p3 - m3, 2.0);
		a4 := POWER(p4 - m4, 2.0);
		
		
		result := SQRT(a1+a2+a3+a4);
		
		
		
	RETURN result; 

END;

// Layout cc ($.File_CEPclusterizado.Venal2 Le) := TRANSFORM

// SELF.Distancia := dist(Le.Clusterid, Le.QUANTIDADE_DE_ESQUINAS_FRENTES, Le.AREA_DO_TERRENO, Le.AREA_CONSTRUIDA, Le.AREA_OCUPADA,
// Le.ANO_DA_CONSTRUCAO_CORRIGIDO, Le.QUANTIDADE_DE_PAVIMENTOS, Le.TESTADA_PARA_CALCULO, Le.zona, Le.condominio, Le.area_exc,
// Le.construcao, Le.terreno, Le.excesso);
// SELF := LE;

// END;
// DECIMAL10_9 Tamanho_dos_terrenos_e_frentes;
 // DECIMAL10_9 Valor_dimensional_financeiro_do_imovel;
 // DECIMAL10_9  Adensamento_urbano ;
 
 // myData.ANO_DA_CONSTRUCAO_CORRIGIDO;
Layout cc ($.File_CEPclusterizado.Venal2 Le, $.File_centroidmean Ri) := TRANSFORM

SELF.Distancia := dist(Le.Clusterid, Le.Tamanho_dos_terrenos_e_frentes, Le.Valor_dimensional_financeiro_do_imovel,
 Le.Adensamento_urbano, Le.ANO_DA_CONSTRUCAO_CORRIGIDO, Ri.MF1, Ri.MF2, Ri.MF3, RI.MF4);
SELF := LE;

END;

Venal := JOIN(blobs, Isso, LEFT.clusterid = RIGHT.id, cc(LEFT, RIGHT));
Venal2 := SORT(Venal, clusterid, distancia);


EXPORT File_distcluster := Venal2 : PERSIST('~USP::IC::PERSIST::CEPclusterizado_com_distancia') ;