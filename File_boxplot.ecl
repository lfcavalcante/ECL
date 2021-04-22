IMPORT $;
IMPORT ML_Core;
blobs := $.File_distcluster;

s := RECORD
 $.File_kmtabelado.id;

 
 END;
 a := TABLE($.File_kmtabelado,s,id);
 
 r := RECORD
 a.id;
 DECIMAL minimo;
 DECIMAL q1;
 DECIMAL q2;
 DECIMAL q3;
 DECIMAL maximo;
 
 END;
 
 minimo(UNSIGNED z) := FUNCTION
 ML_Core.ToField(blobs(clusterid = z),recs1);
 myAggs1 := ML_Core.FieldAggregates(recs1).simple(number = 8)[1].minval;
 
 RETURN myAggs1;
END;
 
 maximo(UNSIGNED z) := FUNCTION
 ML_Core.ToField(blobs(clusterid = z),recs1);
 myAggs1 := ML_Core.FieldAggregates(recs1).simple(number = 8)[1].maxval;
 
 RETURN myAggs1;
END;

q2(UNSIGNED z) := FUNCTION
 ML_Core.ToField(blobs(clusterid = z),recs1);
 myAggs1 := ML_Core.FieldAggregates(recs1).medians(number = 8)[1].median;
 
 RETURN myAggs1;
END;



q1(UNSIGNED z) := FUNCTION
 
 ML_Core.ToField(blobs(clusterid = z),recs1);
 b := ML_Core.FieldAggregates(recs1).simple(number = 8)[1].countval;
 c:= IF(b%2 = 0, b/2, (b-1)/2);
 ML_Core.ToField(blobs(clusterid = z)[1..c],recsk);
 d := ML_Core.FieldAggregates(recsk).medians(number = 8)[1].median;
 
 
 RETURN d;
END;

q3(UNSIGNED z) := FUNCTION
 
 ML_Core.ToField(blobs(clusterid = z),recs1);
 b := ML_Core.FieldAggregates(recs1).simple(number = 8)[1].countval;
 c:= IF(b%2 = 0, (b/2)+1, ((b-1)/2)+2);
 ML_Core.ToField(blobs(clusterid = z)[c..b],recsk);
 d := ML_Core.FieldAggregates(recsk).medians(number = 8)[1].median;
 
 
 RETURN d;
END;



 r BuildIt(a Le) := TRANSFORM
	
 SELF.minimo := minimo(Le.id);
 SELF.q1 := q1(Le.id);
 SELF.q2 := q2(Le.id);
 SELF.q3 := q3(Le.id);
 SELF.maximo := maximo(Le.id);


  SELF := Le;
	
  END;


Col_Out := PROJECT(a,BuildIt(LEFT));

t := RECORD
 Col_out.id;
 DECIMAL liminferior;
 Col_out.q1;
 Col_out.q2;
 Col_out.q3;
 DECIMAL limsuperior;
 
 END;
t ArrumaIT(Col_out Le) := TRANSFORM
	
 SELF.liminferior := MAX(Le.minimo, Le.q1 - 1.5*(Le.q3 - Le.q1));

 SELF.limsuperior := MIN(Le.maximo, Le.q3 + 1.5*(Le.q3 - Le.q1));


  SELF := Le;
	
  END;
	
Jol_Out := PROJECT(Col_out,ArrumaIt(LEFT));

EXPORT File_boxplot := Jol_out;