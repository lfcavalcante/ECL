IMPORT $;
// IMPORT STD;
Isso := $.File_venal;
// Tabel := $.File_TabelaI.TabelaI;

ProfLayout := RECORD
	
	$.File_venal;
		
	
		
	
END;


Condominio(DECIMAL cond,DECIMAL constr,DECIMAL ter,DECIMAL exc) := FUNCTION
 CONDa := ((ter+exc)/constr) < 0.20;
 CONDb := ((ter+exc)/constr) > 2.01 AND ((ter+exc)/constr) < 7.00;
 CONDc := ((ter+exc)/constr) > 7.00;
 
 
 RETURN MAP(CONDa => 2.20 - (3*((ter+exc)/constr)),
 CONDb => 1.80 - ((1/10)*((ter+exc)/constr)),
 CONDc => 1.10, 
 1.60);
END;


// ProfLayout cc($.Construcao_venal Le,$.File_TabelaI.Layout Ri) := TRANSFORM
ProfLayout cc($.File_venal Le) := TRANSFORM

SELF.Condominio:= IF(Le.Condominio = 1.60, Condominio(Le.Condominio,Le.Construcao,Le.Terreno,Le.Excesso), 1.00);

// SELF.Fatordeprof := Ri.Fator;

SELF := Le;

END;
Venal := PROJECT(Isso, cc(LEFT));
// Venal := PROJECT(Isso,Tabel,LEFT.Profundidade_Eq = RIGHT.Profundidade_Eq, cc(LEFT,RIGHT),LEFT OUTER);

EXPORT File_correccond := Venal: PERSIST('~USP::IC::PERSIST::Correccond');
