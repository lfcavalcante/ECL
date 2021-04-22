IMPORT $;
IMPORT DBSCAN;
IMPORT ML_Core;
Ct := 100000;

// CHOOSEN($.STD_Persons.File,Recs);
// CHOOSEN($.STD_Persons.File,Recs,Recs + 1);
// CHOOSEN($.STD_Persons.File,Recs,(Recs * 2) + 1);
// CHOOSEN($.STD_Persons.File,Recs,(Recs * 3) + 1);
// CHOOSEN($.STD_Persons.File,Recs,(Recs * 4) + 1);
blobs := $.File_normalized;
Divblobs   := CHOOSEN(blobs,Ct);
Divblobs1   := CHOOSEN(blobs,Ct,Ct+1);
Divblobs2  := CHOOSEN(blobs,Ct,(Ct * 2) + 1);
Divblobs3   := CHOOSEN(blobs,Ct,(Ct * 3) + 1);
Divblobs4   := CHOOSEN(blobs,Ct,(Ct * 4) + 1);
Divblobs5   := CHOOSEN(blobs,Ct,(Ct * 5) + 1);
Divblobs6   := CHOOSEN(blobs,Ct,(Ct * 6) + 1);
Divblobs7   := CHOOSEN(blobs,Ct,(Ct * 7) + 1);
Divblobs8   := CHOOSEN(blobs,Ct,(Ct * 8) + 1);
Divblobs9   := CHOOSEN(blobs,Ct,(Ct * 9) + 1);
Divblobs10   := CHOOSEN(blobs,ALL,(Ct * 10) + 1);

EXPORT DBSCAN_parcial := MODULE

// ML_Core.AppendSeqId(blobs, id, blobsid);
ML_Core.ToField(blobs ,recs);
EXPORT Model :=  DBSCAN.DBSCAN(0.1, 2).Fit( recs(number < 14));
EXPORT NumClusters := DBSCAN.DBSCAN().Num_Clusters(Model);
EXPORT NumOutliers :=  DBSCAN.DBSCAN().Num_Outliers(Model);
EXPORT Outliers := Model: PERSIST('~USP::IC::PERSIST::ModeloDB');

// ML_Core.ToField(Divblobs1 ,recs1);
// EXPORT Model1 :=  DBSCAN.DBSCAN(0, 2).Fit( recs1(number < 14));
// EXPORT Outliers1 := Model1: PERSIST('~USP::IC::PERSIST::ModeloDB_1');

// ML_Core.ToField(Divblobs2 ,recs2);
// EXPORT Model2 :=  DBSCAN.DBSCAN(0, 2).Fit( recs2(number < 14));
// EXPORT Outliers2 := Model2: PERSIST('~USP::IC::PERSIST::ModeloDB_2');

// ML_Core.ToField(Divblobs3 ,recs3);
// EXPORT Model3 :=  DBSCAN.DBSCAN(0, 2).Fit( recs3(number < 14));
// EXPORT Outliers3 := Model3: PERSIST('~USP::IC::PERSIST::ModeloDB_3');

// ML_Core.ToField(Divblobs4 ,recs4);
// EXPORT Model4 :=  DBSCAN.DBSCAN(0, 2).Fit( recs4(number < 14));
// EXPORT Outliers4 := Model4: PERSIST('~USP::IC::PERSIST::ModeloDB_4');

// ML_Core.ToField(Divblobs5 ,recs5);
// EXPORT Model5 :=  DBSCAN.DBSCAN(0, 2).Fit( recs5(number < 14));
// EXPORT Outliers5 := Model5: PERSIST('~USP::IC::PERSIST::ModeloDB_5');

// ML_Core.ToField(Divblobs6 ,recs6);
// EXPORT Model6 :=  DBSCAN.DBSCAN(0, 2).Fit( recs6(number < 14));
// EXPORT Outliers6 := Model6: PERSIST('~USP::IC::PERSIST::ModeloDB_6');

// ML_Core.ToField(Divblobs7 ,recs7);
// EXPORT Model7 :=  DBSCAN.DBSCAN(0, 2).Fit( recs7(number < 14));
// EXPORT Outliers7 := Model7: PERSIST('~USP::IC::PERSIST::ModeloDB_7');

// ML_Core.ToField(Divblobs8 ,recs8);
// EXPORT Model8 :=  DBSCAN.DBSCAN(0, 2).Fit( recs8(number < 14));
// EXPORT Outliers8 := Model8: PERSIST('~USP::IC::PERSIST::ModeloDB_8');

// ML_Core.ToField(Divblobs9 ,recs9);
// EXPORT Model9 :=  DBSCAN.DBSCAN(0, 2).Fit( recs9(number < 14));
// EXPORT Outliers9 := Model9: PERSIST('~USP::IC::PERSIST::ModeloDB_9');

// ML_Core.ToField(Divblobs10 ,recs10);
// EXPORT Model10 :=  DBSCAN.DBSCAN(0, 2).Fit( recs10(number < 14));
// EXPORT Outliers10 := Model10: PERSIST('~USP::IC::PERSIST::ModeloDB_10');


END;