IMPORT $;
IMPORT DBSCAN;
IMPORT ML_Core;
blobs := $.File_transhufid;

EXPORT File_parametros := MODULE

// ML_Core.AppendSeqId(blobs, id, blobsid);
ML_Core.ToField(blobs,recs);
EXPORT myAggs := ML_Core.FieldAggregates(recs).simple;
END;
