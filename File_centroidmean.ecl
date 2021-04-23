IMPORT $;
IMPORT ML_Core;
d := $.KMeans_parcial.Centers;
blobs := $.File_CEPclusterizado.Venal2;

out_rec := RECORD
 UNSIGNED id := 0;
 
 DECIMAL MF1 := -1000000;
 DECIMAL MF2 := -1000000;
 DECIMAL MF3 := -1000000;
 
 DECIMAL MF4 := -1000000;
 


END;
                     
id_list := DEDUP(PROJECT(d,out_rec));

abba (UNSIGNED sec) := FUNCTION

		k := blobs(clusterid = sec);
		ML_Core.ToField(k,recs);
		ola := ML_Core.FieldAggregates(recs).simple;
	RETURN ola;

END;


dist (UNSIGNED dec, UNSIGNED p) := FUNCTION

		result := abba(dec)(number=p)[1].mean;
		
		
		
	
		
		
	RETURN result; 

END;


out_rec cc (id_list Ri ) := TRANSFORM

SELF.MF1 := dist(Ri.id, 1) ;
SELF.MF2 := dist(Ri.id, 2);
SELF.MF3 := dist(Ri.id, 3);
SELF.MF4 := dist(Ri.id, 4);
SELF := Ri;

END;

Venal := PROJECT(id_list, cc(LEFT));

EXPORT File_centroidmean := Venal : PERSIST('~USP::IC::PERSIST::Centroidmeans');