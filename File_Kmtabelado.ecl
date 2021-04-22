/* id    name       value
   ------------------------------
   0     timezone   Europe/London
   0     language   en
   0     country    45
   0     something  x
   1     timezone   Europe/Paris
   1     language   fr
   1     country    46
   
   convert to:
   
   id    timezone       language    country  something
   ---------------------------------------------------
   0     Europe/London  en          45       x
   1     Europe/Paris   fr          46
*/
IMPORT $;
d := $.KMeans_parcial.Centers;


// out_rec := RECORD
// UNSIGNED id := 0;
// DECIMAL QUANTIDADE_DE_ESQUINAS_FRENTES := -1000000;
// DECIMAL AREA_DO_TERRENO := -1000000;

// DECIMAL AREA_CONSTRUIDA := -1000000;
// DECIMAL AREA_OCUPADA := -1000000;
// DECIMAL ANO_DA_CONSTRUCAO_CORRIGIDO := -1000000;
// DECIMAL QUANTIDADE_DE_PAVIMENTOS := -1000000;
// DECIMAL TESTADA_PARA_CALCULO := -1000000;
// DECIMAL zona := -1000000;
 
// DECIMAL condominio := -1000000;
 
// DECIMAL area_exc := -1000000;
// DECIMAL construcao := -1000000;
// DECIMAL terreno := -1000000;
// DECIMAL excesso := -1000000;

// END;

out_rec := RECORD
 UNSIGNED id := 0;
 
 DECIMAL Tamanho_dos_terrenos_e_frentes := -1000000;
 DECIMAL Valor_dimensional_financeiro_do_imovel := -1000000;
 DECIMAL Adensamento_urbano := -1000000;
 
 DECIMAL ANO_DA_CONSTRUCAO_CORRIGIDO := -1000000;
 


END;
                     
id_list := DEDUP(PROJECT(d,out_rec));
// id_list;

// out_rec BuildIt(out_rec L,$.KMeans_parcial.Centers R) := TRANSFORM
	
	// SELF.QUANTIDADE_DE_ESQUINAS_FRENTES := IF (R.number = 1,R.Value,L.QUANTIDADE_DE_ESQUINAS_FRENTES);
	// SELF.AREA_DO_TERRENO := IF (R.number = 2,R.Value,L.AREA_DO_TERRENO);

	// SELF.AREA_CONSTRUIDA := IF (R.number = 3,R.Value,L.AREA_CONSTRUIDA);
	// SELF.AREA_OCUPADA := IF (R.number = 4,R.Value,L.AREA_OCUPADA);
	// SELF.ANO_DA_CONSTRUCAO_CORRIGIDO := IF (R.number = 5,R.Value,L.ANO_DA_CONSTRUCAO_CORRIGIDO);
	// SELF.QUANTIDADE_DE_PAVIMENTOS := IF (R.number = 6,R.Value,L.QUANTIDADE_DE_PAVIMENTOS);
	// SELF.TESTADA_PARA_CALCULO := IF (R.number = 7,R.Value,L.TESTADA_PARA_CALCULO);
	// SELF.zona := IF (R.number = 8,R.Value,L.zona);
	 
	// SELF.condominio := IF (R.number = 9,R.Value,L.condominio);
	 
	// SELF.area_exc := IF (R.number = 10,R.Value,L.area_exc);
	// SELF.construcao := IF (R.number = 11,R.Value,L.construcao);
  // SELF.terreno := IF (R.number = 12,R.Value,L.terreno);
	// SELF.excesso := IF (R.number = 13,R.Value,L.excesso);
  // SELF := L;
	
  // END;
	out_rec BuildIt(out_rec L,$.KMeans_parcial.Centers R) := TRANSFORM
	
	SELF.Tamanho_dos_terrenos_e_frentes := IF (R.number = 1,R.Value,L.Tamanho_dos_terrenos_e_frentes);
	SELF.Valor_dimensional_financeiro_do_imovel := IF (R.number = 2,R.Value,L.Valor_dimensional_financeiro_do_imovel);
	SELF.Adensamento_urbano := IF (R.number = 3,R.Value,L.Adensamento_urbano);
	SELF.ANO_DA_CONSTRUCAO_CORRIGIDO := IF (R.number = 4,R.Value,L.ANO_DA_CONSTRUCAO_CORRIGIDO);
	
  SELF := L;
	
  END;


Col_Out := JOIN(id_list,d,LEFT.id = RIGHT.ID,BuildIt(LEFT,RIGHT));                              

// col_out Rollem(col_out L,col_out R) := TRANSFORM
  // SELF.QUANTIDADE_DE_ESQUINAS_FRENTES := IF (R.QUANTIDADE_DE_ESQUINAS_FRENTES <> -1000000,R.QUANTIDADE_DE_ESQUINAS_FRENTES,L.QUANTIDADE_DE_ESQUINAS_FRENTES);
	// SELF.AREA_DO_TERRENO := IF (R.AREA_DO_TERRENO <> -1000000,R.AREA_DO_TERRENO,L.AREA_DO_TERRENO);

	// SELF.AREA_CONSTRUIDA := IF (R.AREA_CONSTRUIDA <> -1000000,R.AREA_CONSTRUIDA,L.AREA_CONSTRUIDA);
	// SELF.AREA_OCUPADA := IF (R.AREA_OCUPADA <> -1000000,R.AREA_OCUPADA,L.AREA_OCUPADA);
	// SELF.ANO_DA_CONSTRUCAO_CORRIGIDO := IF (R.ANO_DA_CONSTRUCAO_CORRIGIDO <> -1000000,R.ANO_DA_CONSTRUCAO_CORRIGIDO,L.ANO_DA_CONSTRUCAO_CORRIGIDO);
	// SELF.QUANTIDADE_DE_PAVIMENTOS := IF (R.QUANTIDADE_DE_PAVIMENTOS <> -1000000,R.QUANTIDADE_DE_PAVIMENTOS,L.QUANTIDADE_DE_PAVIMENTOS);
	// SELF.TESTADA_PARA_CALCULO := IF (R.TESTADA_PARA_CALCULO <> -1000000,R.TESTADA_PARA_CALCULO,L.TESTADA_PARA_CALCULO);
	// SELF.zona := IF (R.zona <> -1000000,R.zona,L.zona);
	 
	// SELF.condominio := IF (R.condominio <> -1000000,R.condominio,L.condominio);
	 
	// SELF.area_exc := IF (R.area_exc <> -1000000,R.area_exc,L.area_exc);
	// SELF.construcao := IF (R.construcao <> -1000000,R.construcao,L.construcao);
	// SELF.terreno  := IF (R.terreno  <> -1000000,R.terreno ,L.terreno);
	// SELF.excesso := IF (R.excesso  <> -1000000,R.excesso ,L.excesso );
  
  // SELF := L;
  // END;
col_out Rollem(col_out L,col_out R) := TRANSFORM
  SELF.Tamanho_dos_terrenos_e_frentes := IF (R.Tamanho_dos_terrenos_e_frentes <> -1000000,R.Tamanho_dos_terrenos_e_frentes,L.Tamanho_dos_terrenos_e_frentes);
	SELF.Valor_dimensional_financeiro_do_imovel := IF (R.Valor_dimensional_financeiro_do_imovel <> -1000000,R.Valor_dimensional_financeiro_do_imovel,L.Valor_dimensional_financeiro_do_imovel);

	SELF.Adensamento_urbano := IF (R.Adensamento_urbano <> -1000000,R.Adensamento_urbano,L.Adensamento_urbano);
	SELF.ANO_DA_CONSTRUCAO_CORRIGIDO := IF (R.ANO_DA_CONSTRUCAO_CORRIGIDO <> -1000000,R.ANO_DA_CONSTRUCAO_CORRIGIDO,L.ANO_DA_CONSTRUCAO_CORRIGIDO);
	
  
  SELF := L;
  END;

Final_out := ROLLUP(col_out,LEFT.id = RIGHT.ID,Rollem(LEFT,RIGHT));
// Final_out;

EXPORT File_Kmtabelado := Final_out;