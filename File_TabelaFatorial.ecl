

EXPORT File_TabelaFatorial := MODULE

EXPORT Layout := RECORD
 STRING Fator; 
 DECIMAL10_9	ano_da_construcao_corrigido;
 DECIMAL10_9	area_construida;
 DECIMAL10_9	area_do_terreno;
 DECIMAL10_9	area_exc;
 DECIMAL10_9	area_ocupada;
 DECIMAL10_9	condominio;
 DECIMAL10_9	construcao;
 DECIMAL10_9	excesso;
 DECIMAL10_9	quantidade_de_pavimentos;
 DECIMAL10_9	terreno;
 DECIMAL10_9	testada_para_calculo;
 DECIMAL10_9	zona;
 

 END;
 

EXPORT TabelaFatorial := DATASET('~usp::ic::public::TabelaFatorial',Layout, CSV(HEADING(1)));



END;