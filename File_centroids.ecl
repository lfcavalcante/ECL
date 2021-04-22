IMPORT $;
IMPORT ML_Core;
myData := $.File_SetFatores;
myData1 := $.File_SetFatoresParcial;
C := COUNT(myData);
ML_Core.ToField(myData,recs1);
myAggs1 := ML_Core.FieldAggregates(recs1).Ntileranges(4);
S:= SORT(myAggs1, number, ntile);

A1 := S(number=1)[1].max;
A3 := S(number=1)[4].min;
B1 := S(number=2)[1].max;
B3 := S(number=2)[4].min;
C1 := S(number=3)[1].max;
C3 := S(number=3)[4].min;
D1 := S(number=4)[1].max;
D3 := S(number=4)[4].min;



inputRec := {myData.id, myData.Tamanho_dos_terrenos_e_frentes, myData.Valor_dimensional_financeiro_do_imovel, myData.Adensamento_urbano, myData.ANO_DA_CONSTRUCAO_CORRIGIDO, myData.NUMERO_DO_CONTRIBUINTE, myData.CEP_DO_IMOVEL};
inPeople := DATASET([{C + 1,A1,B1,C1,D1,0,0},
{C + 2,A1,B1,C1,D3,0,0},
{C + 3,A1,B1,C3,D1,0,0},
{C + 4,A1,B1,C3,D3,0,0},
{C + 5,A1,B3,C1,D1,0,0},
{C + 6,A1,B3,C1,D3,0,0},
{C + 7,A1,B3,C3,D1,0,0},
{C + 8,A1,B3,C3,D3,0,0},
{C + 9,A3,B1,C1,D1,0,0},
{C + 10,A3,B1,C1,D3,0,0},
{C + 11,A3,B1,C3,D1,0,0},
{C + 12,A3,B1,C3,D3,0,0},
{C + 13,A3,B3,C1,D1,0,0},
{C + 14,A3,B3,C1,D3,0,0},
{C + 15,A3,B3,C3,D1,0,0},
{C + 16,A3,B3,C3,D3,0,0}],inputRec);


Set_comcentroid := myData1 + inPeople;
EXPORT File_centroids := Set_comcentroid;