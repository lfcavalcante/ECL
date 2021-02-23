EXPORT File_TabelaVI := MODULE

EXPORT Layout := RECORD
 STRING	Tipop;
 
 UNSIGNED Valor;
 STRING Zona;
 STRING Tipoabrev;
 END;
 

EXPORT TabelaVI := DATASET('~usp::ic::public::tabelavicorrigida',Layout, CSV(HEADING(1)));



END;
