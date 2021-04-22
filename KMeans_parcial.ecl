IMPORT $;
IMPORT KMeans;
IMPORT ML_Core;
blobs := $.File_centroids;
// myData1 := $.File_SetFatoresParcial;
a := $.File_normalized;
c := COUNT(a);

EXPORT KMeans_parcial := MODULE

// ML_Core.AppendSeqId(blobs, id, blobsid);
ML_Core.ToField(blobs,recs);
//Initialization
Centroids := recs(id IN [c+1,c+2,c+3,c+4,c+5,c+6,c+7,c+8,c+9,c+10,c+11,c+12,c+13,c+14,c+15,c+16]);
Max_iterations := 10;
Tolerance := 0;
//Train K-Means Model
//Setup the model
Pre_Model := KMeans.KMeans(Max_iterations, Tolerance);
//Train the model
EXPORT Model := Pre_Model.Fit( recs(number < 5), Centroids(number < 5));
//Coordinates of cluster centers
EXPORT Centers := KMeans.KMeans().Centers(Model);
EXPORT Labelss := KMeans.KMeans().Labels(Model);



END;

