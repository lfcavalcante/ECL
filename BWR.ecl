// #OPTION('maxCsvRowSizeMb',30);
#OPTION('outputLimit',1000);
IMPORT ICTest;
// IPTU :=ICTest.File_IPTU2019.File2019;
// IPTU :=ICTest.File_factors;

// IPTU :=ICTest.File_Venal;
// IPTU :=ICTest.File_Venal_V2;
// IPTU :=ICTest.Construcao_venal;
// IPTU :=ICTest.File_TabelaI;
// IPTU :=ICTest.File_TabelaVI;
// IPTU :=ICTest.File_TabelaFatorial.TabelaFatorial;
// IPTU :=ICTest.File_SetFatores;
// IPTU :=ICTest.File_SetFatoresParcial;
// IPTU :=ICTest.teste.Model;
// IPTU :=ICTest.File_CEPcount;
// IPTU :=ICTest.testesub;
// IPTU :=ICTest.File_Vencomp;
// IPTU :=ICTest.File_ndatanum;
// IPTU :=ICTest.File_ndatas;
// IPTU :=ICTest.File_nuntrans;
// IPTU :=ICTest.File_transhuf;
// IPTU :=ICTest.File_transhufid;
// IPTU :=ICTest.File_tipoabrev;
// IPTU :=ICTest.File_tipocount;
// IPTU :=ICTest.File_normalized;
// IPTU :=ICTest.File_CEPclusterizado;
// IPTU :=ICTest.File_CEPclusterizado.Venal2;
// IPTU1 :=ICTest.File_CEPclusterizado.Venaldois;
// IPTU :=ICTest.File_distcluster;
// IPTU :=ICTest.File_centroidmean;
// IPTU :=ICTest.File_Kmtabelado;
// IPTU :=ICTest.File_centroids (id > 3337280);
// IPTU :=ICTest.File_centroids ;
// IPTU :=ICTest.KMeans_parcial.Centers;
// IPTU1 :=ICTest.KMeans_parcial.Outliers;
// IPTU1 :=ICTest.KMeans_parcial.Labelss;
// IPTU1 :=ICTest.KMeans_parcial;
// IPTU :=ICTest.DBSCAN_parcial.NumClusters;
// IPTU1 :=ICTest.DBSCAN_parcial.NumOutliers;
// IPTU2 :=ICTest.DBSCAN_parcial.Outliers;
// IPTU1 :=ICTest.teste.NumClusters;
// IPTU2 :=ICTest.teste.NumOutliers;
IPTU :=ICTest.File_numEout;
// IPTU :=ICTest.File_boxplot;
// IPTU :=ICTest.File_outliers.Outliers(1479);
// IPTU :=ICTest.File_Set_sem_outliers.DStotal;
// IPTU := ICTest.File_perfil;
// IPTU1 := IPTU (zona = -1.187980353228977);
// IPTU1:= IPTU (zona = 0.1014192424324489);
// IPTU1 := IPTU (zona = 1.390818838093875);
// IPTU :=ICTest.DBSCAN_parcial_2.NumClusters;
// IPTU1 :=ICTest.DBSCAN_parcial_2.NumOutliers;
// IPTU2 :=ICTest.DBSCAN_parcial_2.Outliers;
// IPTU3 :=ICTest.teste.Outliers;
// IPTU3 :=ICTest.teste.abba(645);
// IPTU3 :=ICTest.teste.s(number=1)[4].min;
// IPTU3 :=ICTest.teste;
// IPTU3 :=ICTest.testess;

// IPTU1 :=ICTest.File_parametros;

// atk := IPTU1(number=1)[1].mean;
// atk := IPTU1(number=1);
// ak := atk[1].mean;
// virg := ICTest.Mudarvirg;
// OUTPUT(IPTU(Condominio != 1.60 AND Condominio != 1));
// OUTPUT(IPTU,,'~USP::IC::LF::IPTeste');
// OUTPUT(IPTU(TIPO_DE_TERRENO = 'De esquina' AND TIPO_DE_PADRAO_DA_CONSTRUCAO[1..22] = 'Residencial horizontal' AND QUANTIDADE_DE_ESQUINAS_FRENTES = 1));
// OUTPUT(IPTU(zona != '1SZU'));
OUTPUT(IPTU);
// OUTPUT(IPTU(AREA_CONSTRUIDA=0));
// OUTPUT(IPTU1);
// AllRecs   := CHOOSEN(IPTU1(clusterid = 128),ALL);
// OUTPUT(AllRecs );
// OUTPUT(IPTU1(clusterid = 1288));
// COUNT(IPTU1(clusterid = 695));
// COUNT(IPTU1(clusterid = 695 and area_exc != 172));


// OUTPUT(IPTU2);
// OUTPUT(IPTU3);
// OUTPUT(atk);
// OUTPUT(IPTU2 (label = 2));

// COUNT(IPTU2 (label = 2));

// COUNT (IPTU);
// COUNT (IPTU1);
// COUNT (IPTU.DStotal);
// OUTPUT(IPTU(NOME_DE_LOGRADOURO_DO_IMOVEL = 'R S CAETANO' and NUMERO_DO_IMOVEL = 13));
// OUTPUT (ICTest.Files);
//Count (ICTest.Files);

// IPTUs := ICTest.IPTUterd;
// COUNT (IPTU((LENGTH(NOME_DO_CONTRIBUINTE_1)>1000000)OR(LENGTH(COMPLEMENTO_DO_IMOVEL)>1000000)));
// OUTPUT (IPTU((LENGTH(NOME_DO_CONTRIBUINTE_1)>1000000)OR(LENGTH(COMPLEMENTO_DO_IMOVEL)>1000000)),{NUMERO_DO_CONTRIBUINTE});
// OUTPUT (IPTU((LENGTH(COMPLEMENTO_DO_IMOVEL)>1000000)));

//pr := ICTest.File_pregao_encerrado_2019.File;
//pr;
//COUNT (pr);

//poc := ICTest.File_pregao_encerrado_2019_OC.File;
//poc;

//ite := ICTest.File_Test_Item.File;
//ite;
// #WORKUNIT('name','USP_IC_DBscan');
#WORKUNIT('name','USP_IC_KMeans');
// #WORKUNIT('name','USP_IC_BWR');
// #WORKUNIT('name','USP_IC_profile');
// #WORKUNIT('protect',true);