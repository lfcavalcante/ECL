

IMPORT $;
myData := $.File_normalized;

IPTU1 :=$.File_TabelaFatorial.TabelaFatorial;


// atk := IPTU1(number=1)[1].mean;
 Layout := RECORD

 myData.id;
 
 DECIMAL10_9 Tamanho_dos_terrenos_e_frentes;
 DECIMAL10_9 Valor_dimensional_financeiro_do_imovel;
 DECIMAL10_9  Adensamento_urbano ;
 
 myData.ANO_DA_CONSTRUCAO_CORRIGIDO;
 
 myData.NUMERO_DO_CONTRIBUINTE;
 myData.CEP_DO_IMOVEL;



END;

 Layout cc ($.File_normalized Le) := TRANSFORM


 SELF.Tamanho_dos_terrenos_e_frentes := 
 (IPTU1(Fator='TC1')[1].zona * Le.zona) +
 (IPTU1(Fator='TC1')[1].testada_para_calculo * Le.testada_para_calculo) +
 (IPTU1(Fator='TC1')[1].terreno * Le.terreno) +
 (IPTU1(Fator='TC1')[1].quantidade_de_pavimentos * Le.quantidade_de_pavimentos) +
 (IPTU1(Fator='TC1')[1].excesso * Le.excesso) +
 (IPTU1(Fator='TC1')[1].construcao * Le.construcao) +
 (IPTU1(Fator='TC1')[1].condominio * Le.condominio) +
 (IPTU1(Fator='TC1')[1].area_ocupada * Le.area_ocupada) +
 (IPTU1(Fator='TC1')[1].area_exc * Le.area_exc) +
 (IPTU1(Fator='TC1')[1].area_do_terreno * Le.area_do_terreno) +
 (IPTU1(Fator='TC1')[1].area_construida * Le.area_construida) +
 (IPTU1(Fator='TC1')[1].ano_da_construcao_corrigido * Le.ano_da_construcao_corrigido);

 SELF.Valor_dimensional_financeiro_do_imovel := 
 (IPTU1(Fator='TC2')[1].zona * Le.zona) +
 (IPTU1(Fator='TC2')[1].testada_para_calculo * Le.testada_para_calculo) +
 (IPTU1(Fator='TC2')[1].terreno * Le.terreno) +
 (IPTU1(Fator='TC2')[1].quantidade_de_pavimentos * Le.quantidade_de_pavimentos) +
 (IPTU1(Fator='TC2')[1].excesso * Le.excesso) +
 (IPTU1(Fator='TC2')[1].construcao * Le.construcao) +
 (IPTU1(Fator='TC2')[1].condominio * Le.condominio) +
 (IPTU1(Fator='TC2')[1].area_ocupada * Le.area_ocupada) +
 (IPTU1(Fator='TC2')[1].area_exc * Le.area_exc) +
 (IPTU1(Fator='TC2')[1].area_do_terreno * Le.area_do_terreno) +
 (IPTU1(Fator='TC2')[1].area_construida * Le.area_construida) +
 (IPTU1(Fator='TC2')[1].ano_da_construcao_corrigido * Le.ano_da_construcao_corrigido);
 
  SELF.Adensamento_urbano := 
 (IPTU1(Fator='TC3')[1].zona * Le.zona) +
 (IPTU1(Fator='TC3')[1].testada_para_calculo * Le.testada_para_calculo) +
 (IPTU1(Fator='TC3')[1].terreno * Le.terreno) +
 (IPTU1(Fator='TC3')[1].quantidade_de_pavimentos * Le.quantidade_de_pavimentos) +
 (IPTU1(Fator='TC3')[1].excesso * Le.excesso) +
 (IPTU1(Fator='TC3')[1].construcao * Le.construcao) +
 (IPTU1(Fator='TC3')[1].condominio * Le.condominio) +
 (IPTU1(Fator='TC3')[1].area_ocupada * Le.area_ocupada) +
 (IPTU1(Fator='TC3')[1].area_exc * Le.area_exc) +
 (IPTU1(Fator='TC3')[1].area_do_terreno * Le.area_do_terreno) +
 (IPTU1(Fator='TC3')[1].area_construida * Le.area_construida) +
 (IPTU1(Fator='TC3')[1].ano_da_construcao_corrigido * Le.ano_da_construcao_corrigido);



 
SELF := Le;

END;

Venal := PROJECT(myData, cc(LEFT));


EXPORT File_SetFatores := Venal : PERSIST('~USP::IC::PERSIST::Dados_totais_em_fatores');
