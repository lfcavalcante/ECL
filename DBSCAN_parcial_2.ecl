IMPORT $;
IMPORT DBSCAN;
IMPORT ML_Core;
// Ct := 100000;

// CHOOSEN($.STD_Persons.File,Recs);
// CHOOSEN($.STD_Persons.File,Recs,Recs + 1);
// CHOOSEN($.STD_Persons.File,Recs,(Recs * 2) + 1);
// CHOOSEN($.STD_Persons.File,Recs,(Recs * 3) + 1);
// CHOOSEN($.STD_Persons.File,Recs,(Recs * 4) + 1);
blobs := $.File_Set_sem_outliers.DStotal;
// Divblobs   := CHOOSEN(blobs,Ct);

EXPORT DBSCAN_parcial_2 := MODULE

// ML_Core.AppendSeqId(blobs, id, blobsid);
ML_Core.ToField(blobs ,recs);
EXPORT Model :=  DBSCAN.DBSCAN(2, 2).Fit( recs(number < 14));
EXPORT NumClusters := DBSCAN.DBSCAN().Num_Clusters(Model);
EXPORT NumOutliers :=  DBSCAN.DBSCAN().Num_Outliers(Model);
EXPORT Outliers := Model: PERSIST('~USP::IC::PERSIST::ModeloDBv2');




END;

