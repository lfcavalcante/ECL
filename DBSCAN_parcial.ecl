IMPORT $;
IMPORT DBSCAN;
IMPORT ML_Core;
blobs := $.File_normalized;

EXPORT DBSCAN_parcial := MODULE

// ML_Core.AppendSeqId(blobs, id, blobsid);
ML_Core.ToField(blobs,recs);

EXPORT Model :=  DBSCAN.DBSCAN(1, 2).Fit( recs(number < 14));
EXPORT NumClusters := DBSCAN.DBSCAN().Num_Clusters(Model);
EXPORT NumOutliers :=  DBSCAN.DBSCAN().Num_Outliers(Model);
EXPORT Outliers := Model: PERSIST('~USP::IC::PERSIST::ModeloDB');



END;