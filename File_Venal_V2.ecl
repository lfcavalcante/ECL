IMPORT $;
// IMPORT STD;
Isso := $.File_correccond;
// Tabel := $.File_TabelaI.TabelaI;

ProfLayout := RECORD
	
	$.File_correccond;
	

	
END;

Terreno(UNSIGNED areater,UNSIGNED areaexc,UNSIGNED valorm2, DECIMAL fatprof, DECIMAL fatter, DECIMAL fatcond, DECIMAL fatfrac, UNSIGNED qtd) := FUNCTION
 Terfundo := fatter = 0.6;
 Temesquina0 := qtd = 0;
 Temesquina1 := qtd = 1 AND (areater - areaexc) > 900;
 Temesquina1_0 := qtd = 1 AND (areater - areaexc) <= 900; 
 Temesquina2 := qtd = 2 AND (areater - areaexc) > 2700;
 Temesquina2_0 := qtd = 2 AND (areater - areaexc) <= 2700;
 Temesquina3 := qtd >= 3 AND (areater - areaexc) > 3600;
 Temesquina3_0 := qtd >= 3 AND (areater - areaexc) <= 3600; 
 RETURN MAP(Terfundo => (areater - areaexc) * valorm2 * fatter * fatcond * fatfrac,
 Temesquina0 => (areater - areaexc) * valorm2 * fatprof * fatter * fatcond * fatfrac,
 Temesquina1 => (900 * valorm2 * fatprof * fatter * fatcond * fatfrac) + ((areater - areaexc - 900) *  valorm2 * fatprof * fatcond * fatfrac),
 Temesquina1_0 => (areater - areaexc) * valorm2 * fatprof * fatter * fatcond * fatfrac,
 Temesquina2 => (2700 * valorm2 * fatprof * fatter * fatcond * fatfrac) + ((areater - areaexc - 2700) *  valorm2 * fatprof * fatcond * fatfrac),
 Temesquina2_0 => (areater - areaexc) * valorm2 * fatprof * fatter * fatcond * fatfrac,
 Temesquina3 => (3600 * valorm2 * fatprof * fatter * fatcond * fatfrac) + ((areater - areaexc - 3600) *  valorm2 * fatprof * fatcond * fatfrac),
 Temesquina3_0 => (areater - areaexc) * valorm2 * fatprof * fatter * fatcond * fatfrac,
 0.00);
END;

Excesso(UNSIGNED areaexc,UNSIGNED valorm2, DECIMAL fatprof, DECIMAL fatter, DECIMAL fatcond, DECIMAL fatfrac, UNSIGNED qtd) := FUNCTION
 Terfundo := fatter = 0.6;
 Temesquina0 := qtd = 0;
 Temesquina1 := qtd = 1 AND areaexc > 900;
 Temesquina1_0 := qtd = 1 AND areaexc <= 900; 
 Temesquina2 := qtd = 2 AND areaexc > 2700;
 Temesquina2_0 := qtd = 2 AND areaexc <= 2700;
 Temesquina3 := qtd >= 3 AND areaexc > 3600;
 Temesquina3_0 := qtd >= 3 AND areaexc <= 3600; 
 RETURN MAP(Terfundo => areaexc * valorm2 * fatter * fatcond * fatfrac,
 Temesquina0 => areaexc * valorm2 * fatprof * fatter * fatcond * fatfrac,
 Temesquina1 => (900 * valorm2 * fatprof * fatter * fatcond * fatfrac) + ((areaexc - 900) *  valorm2 * fatprof * fatcond * fatfrac),
 Temesquina1_0 => areaexc * valorm2 * fatprof * fatter * fatcond * fatfrac,
 Temesquina2 => (2700 * valorm2 * fatprof * fatter * fatcond * fatfrac) + ((areaexc - 2700) *  valorm2 * fatprof * fatcond * fatfrac),
 Temesquina2_0 => areaexc * valorm2 * fatprof * fatter * fatcond * fatfrac,
 Temesquina3 => (3600 * valorm2 * fatprof * fatter * fatcond * fatfrac) + ((areaexc - 3600) *  valorm2 * fatprof * fatcond * fatfrac),
 Temesquina3_0 => areaexc * valorm2 * fatprof * fatter * fatcond * fatfrac,
 0.00);
END;
ProfLayout cc($.File_correccond Le) := TRANSFORM


SELF.Construcao := Le.AREA_CONSTRUIDA*Le.VALOR_DO_M2_DE_CONSTRUCAO*Le.FATOR_DE_OBSOLESCENCIA;
SELF.Terreno := Terreno(Le.AREA_DO_TERRENO,Le.Area_exc,Le.VALOR_DO_M2_DO_TERRENO,Le.Fatordeprof,Le.Fator_terreno,Le.Condominio,Le.FRACAO_IDEAL,Le.QUANTIDADE_DE_ESQUINAS_FRENTES);
SELF.Excesso := Excesso(Le.Area_exc,Le.VALOR_DO_M2_DO_TERRENO,Le.Fatordeprof,Le.Fator_terreno,Le.Condominio,Le.FRACAO_IDEAL,Le.QUANTIDADE_DE_ESQUINAS_FRENTES);

SELF := Le;

END;


Venal := PROJECT(Isso, cc(LEFT));
// Venal := JOIN(Isso,Tabel,LEFT.Profundidade_Eq = RIGHT.Profundidade_Eq, cc(LEFT,RIGHT),LEFT OUTER);



EXPORT File_Venal_V2 := Venal: PERSIST('~USP::IC::PERSIST::Venaiscalculados_v2');