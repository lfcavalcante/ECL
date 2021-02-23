IMPORT $;
// IMPORT STD;
Isso := $.Construcao_venal;
// Tabel := $.File_TabelaI.TabelaI;

ProfLayout := RECORD
	
	$.Construcao_venal;
		
	DECIMAL3_2 Fator_terreno;
	UNSIGNED Area_exc;
		
	
END;


Terreno(STRING Zon,STRING Tpter,STRING Tpc) := FUNCTION
 ZER := Tpter = 'Lote de esquina' AND Tpc[1..22] = 'Residencial horizontal';
 Temesquina1 := (Tpter ='De esquina' OR Tpter = 'De duas ou mais') AND Zon = '1SZU';
 Temesquina2 := (Tpter ='De esquina' OR Tpter = 'De duas ou mais') AND Zon = '2SZU';
 Temesquina3 := (Tpter ='De esquina' OR Tpter = 'De duas ou mais') AND Zon = '3SZU';
 Diversosfundo := Tpter = 'Lote de fundos';
 Diversosinterno := Tpter = 'Terreno interno';
 RETURN MAP(ZER => 1.00,
 Temesquina1 => 1.30,
 Temesquina2 => 1.20,
 Temesquina3 => 1.10,
 Diversosfundo => 0.60,
 Diversosinterno => 0.70,
 1.00);
END;

Area(STRING Zon, UNSIGNED tot, UNSIGNED ocu) := FUNCTION
 Anula:= ocu = 0;
 E1 := Zon = '1SZU' AND ((tot/ocu) >4) ;
 E2 := Zon = '2SZU' AND ((tot/ocu) >6);
 E3 := Zon = '3SZU' AND ((tot/ocu) >11);
 
 RETURN MAP(Anula => tot,
 E1 => (tot - (4*ocu)),
 E2 => (tot - (6*ocu)),
 E3 => (tot - (11*ocu)),
 0);
 END;
// ProfLayout cc($.Construcao_venal Le,$.File_TabelaI.Layout Ri) := TRANSFORM
ProfLayout cc($.Construcao_venal Le) := TRANSFORM

SELF.Fator_terreno := Terreno(Le.Zona,Le.TIPO_DE_TERRENO,Le.TIPO_DE_PADRAO_DA_CONSTRUCAO);
// SELF.Fatordeprof := Ri.Fator;
SELF.Area_exc := Area(Le.Zona,Le.AREA_DO_TERRENO,Le.AREA_OCUPADA);
SELF := Le;

END;
Venal := PROJECT(Isso, cc(LEFT));
// Venal := PROJECT(Isso,Tabel,LEFT.Profundidade_Eq = RIGHT.Profundidade_Eq, cc(LEFT,RIGHT),LEFT OUTER);

EXPORT File_fats := Venal: PERSIST('~USP::IC::PERSIST::Venalfats');