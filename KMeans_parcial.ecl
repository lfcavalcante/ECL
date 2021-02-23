IMPORT $;
IMPORT KMeans;
IMPORT ML_Core;
blobs := $.File_normalized;

EXPORT KMeans_parcial := MODULE

// ML_Core.AppendSeqId(blobs, id, blobsid);
ML_Core.ToField(blobs,recs);
//Initialization
Centroids := recs(id IN [644,695,1132,1164,1288,2961,2050]);
Max_iterations := 10;
Tolerance := 0;
//Train K-Means Model
//Setup the model
Pre_Model := KMeans.KMeans(Max_iterations, Tolerance);
//Train the model
EXPORT Model := Pre_Model.Fit( recs(number < 14), Centroids(number < 14));
//Coordinates of cluster centers
EXPORT Centers := KMeans.KMeans().Centers(Model);
EXPORT Labelss := KMeans.KMeans().Labels(Model);



END;

