EXPORT File_TabelaI := MODULE

EXPORT Layout := RECORD
 
 UNSIGNED Profundidade_Eq ;
 DECIMAL5_4 Fator;
 
 END;
 

EXPORT TabelaI := DATASET('~usp::ic::public::tabelai',Layout, CSV(HEADING(1)));



END;
