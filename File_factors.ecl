IMPORT $;
// IMPORT STD;
Isso := $.File_fats;
Tabel := $.File_TabelaI.TabelaI;

ProfLayout := RECORD
	
	$.File_fats;
		

	
END;

ProfLayout cc($.File_fats Le,$.File_TabelaI.Layout Ri) := TRANSFORM

// SELF.Fator_terreno := Terreno(Le.Zona,Le.TIPO_DE_TERRENO,Le.TIPO_DE_PADRAO_DA_CONSTRUCAO);
SELF.Fatordeprof := IF(Le.QUANTIDADE_DE_ESQUINAS_FRENTES >=2, 1, Ri.Fator);
// SELF.Area_exc := Area(Le.Zona,Le.AREA_DO_TERRENO,Le.AREA_OCUPADA);
SELF := Le;

END;
// Venal := PROJECT(Isso, cc(LEFT));
Venal := JOIN(Isso,Tabel,LEFT.Profundidade_Eq = RIGHT.Profundidade_Eq, cc(LEFT,RIGHT),LEFT OUTER);


EXPORT File_factors := Venal: PERSIST('~USP::IC::PERSIST::Venalfactors');