// IMPORT $;
// IMPORT DBSCAN;
// IMPORT ML_Core;
// blobs := $.File_SetFatores;


EXPORT teste := MODULE

// ML_Core.ToField(blobs,recs1);
// EXPORT myAggs1 := ML_Core.FieldAggregates(recs1).Ntileranges(4);
// EXPORT S:= SORT(myAggs1, number, ntile);

// ML_Core.ToField(blobs(label=1),recs1);
// EXPORT myAggs1 := ML_Core.FieldAggregates(recs1).Medians;
// ML_Core.ToField(blobs(label=2),recs2);
// EXPORT myAggs2 := ML_Core.FieldAggregates(recs2).Medians;
// ML_Core.ToField(blobs(label=3),recs3);
// EXPORT myAggs3 := ML_Core.FieldAggregates(recs3).Medians;
// ML_Core.ToField(blobs(label=4),recs4);
// EXPORT myAggs4 := ML_Core.FieldAggregates(recs4).Medians;
// ML_Core.ToField(blobs(label=5),recs5);
// EXPORT myAggs5 := ML_Core.FieldAggregates(recs5).Medians;
// ML_Core.ToField(blobs(label=6),recs6);
// EXPORT myAggs6 := ML_Core.FieldAggregates(recs6).Medians;
// ML_Core.ToField(blobs(label=7),recs7);
// EXPORT myAggs7 := ML_Core.FieldAggregates(recs7).Medians;
// ML_Core.ToField(blobs(label=8),recs8);
// EXPORT myAggs8 := ML_Core.FieldAggregates(recs8).Medians;
// ML_Core.ToField(blobs(label=9),recs9);
// EXPORT myAggs9 := ML_Core.FieldAggregates(recs9).Medians;
// ML_Core.ToField(blobs(label=10),recs10);
// EXPORT myAggs10 := ML_Core.FieldAggregates(recs10).Medians;
// ML_Core.ToField(blobs(label=11),recs11);
// EXPORT myAggs11 := ML_Core.FieldAggregates(recs11).Medians;
// ML_Core.ToField(blobs(label=12),recs12);
// EXPORT myAggs12 := ML_Core.FieldAggregates(recs12).Medians;
// ML_Core.ToField(blobs(label=13),recs13);
// EXPORT myAggs13 := ML_Core.FieldAggregates(recs13).Medians;
// END;



IMPORT $;
IMPORT DBSCAN;
IMPORT ML_Core;
blobs := $.File_distcluster;
haf := $.File_normalized;
c := COUNT(haf);

// EXPORT teste := MODULE

// ML_Core.ToField(blobs(clusterid = 695)[0..353],recs1);
// EXPORT myAggs1 := ML_Core.FieldAggregates(recs1).Medians;
// ML_Core.ToField(blobs(clusterid = 695)[355..707],recs2);
// EXPORT myAggs2 := ML_Core.FieldAggregates(recs2).Medians;
// ML_Core.ToField(blobs(clusterid = 1132)[257..512],recs3);
// EXPORT myAggs3 := ML_Core.FieldAggregates(recs3).Medians;
// ML_Core.ToField(blobs(clusterid = 1164)[21..40],recs4);
// EXPORT myAggs4 := ML_Core.FieldAggregates(recs4).Medians;
// ML_Core.ToField(blobs(clusterid = 1288)[1..84],recs5);
// EXPORT myAggs5 := ML_Core.FieldAggregates(recs5).Medians;
// ML_Core.ToField(blobs(clusterid = 1479)[60..118],recs6);
// EXPORT myAggs6 := ML_Core.FieldAggregates(recs6).Medians;
// ML_Core.ToField(blobs(clusterid = 2050)[146..289],recs7);
// EXPORT myAggs7 := ML_Core.FieldAggregates(recs7).Medians;
// ML_Core.ToField(blobs(clusterid = 2368)[427..852],recs8);
// EXPORT myAggs8 := ML_Core.FieldAggregates(recs8).Medians;
// ML_Core.ToField(blobs(clusterid = 2877)[339..675],recs9);
// EXPORT myAggs9 := ML_Core.FieldAggregates(recs9).Medians;
// ML_Core.ToField(blobs(clusterid = 3783)[222..441],recs10);
// EXPORT myAggs10 := ML_Core.FieldAggregates(recs10).Medians;
// ML_Core.ToField(blobs(clusterid = 4049)[37..72],recs11);
// EXPORT myAggs11 := ML_Core.FieldAggregates(recs11).Medians;
// ML_Core.ToField(blobs(clusterid = 4109)[17..32],recs12);
// EXPORT myAggs12 := ML_Core.FieldAggregates(recs12).Medians;
// ML_Core.ToField(blobs(clusterid = 4134)[28..53],recs13);
// EXPORT myAggs13 := ML_Core.FieldAggregates(recs13).Medians;
// END;

ML_Core.ToField(blobs(clusterid = c+1),recs1);
// EXPORT a := ML_Core.FieldAggregates(recs1).simple(number = 17)[1].countval;
EXPORT a := ML_Core.FieldAggregates(recs1).simple;

// q1(UNSIGNED z, UNSIGNED y) := FUNCTION
 
 
 // b:= IF(y%2 = 0, y/2, (y-1)/2);
 // ML_Core.ToField(blobs(clusterid = z)[1..b],recsk);
 // c := ML_Core.FieldAggregates(recsk).medians(number = 17)[1].median;
 
 
 // RETURN c;
END;

// EXPORT x := q1(3133,a);


// ML_Core.ToField(blobs(clusterid = 3133)[1..646],recs2);
// EXPORT myAggs2 := ML_Core.FieldAggregates(recs2).medians;
// ML_Core.ToField(blobs(clusterid = 3133)[647..1292],recs3);
// EXPORT myAggs3 := ML_Core.FieldAggregates(recs3).medians;
// ML_Core.ToField(blobs(clusterid = 3133)[1..1292],recs4);
// EXPORT myAggs4 := ML_Core.FieldAggregates(recs4).Ntileranges (4);
// EXPORT S:= SORT(myAggs4, number, ntile);
// ML_Core.ToField(blobs(clusterid = 1288),recs5);
// EXPORT myAggs5 := ML_Core.FieldAggregates(recs5).simple;
// ML_Core.ToField(blobs(clusterid = 1479),recs6);
// EXPORT myAggs6 := ML_Core.FieldAggregates(recs6).simple;
// ML_Core.ToField(blobs(clusterid = 2050),recs7);
// EXPORT myAggs7 := ML_Core.FieldAggregates(recs7).simple;
// ML_Core.ToField(blobs(clusterid = 2877),recs8);
// EXPORT myAggs8 := ML_Core.FieldAggregates(recs8).simple;
// ML_Core.ToField(blobs(clusterid = 3133),recs9);
// EXPORT myAggs9 := ML_Core.FieldAggregates(recs9).simple;
// ML_Core.ToField(blobs(clusterid = 3783),recs10);
// EXPORT myAggs10 := ML_Core.FieldAggregates(recs10).Medians;
// ML_Core.ToField(blobs(clusterid = 4049),recs11);
// EXPORT myAggs11 := ML_Core.FieldAggregates(recs11).Medians;
// ML_Core.ToField(blobs(clusterid = 4109)[17..32],recs12);
// EXPORT myAggs12 := ML_Core.FieldAggregates(recs12).Medians;
// ML_Core.ToField(blobs(clusterid = 4134)[28..53],recs13);
// EXPORT myAggs13 := ML_Core.FieldAggregates(recs13).Medians;
// END;

// IMPORT $;
// r := RECORD
 // $.KMeans_parcial.Centers.id;
 // INTEGER cnt := COUNT(GROUP);
 // END;
 // a := TABLE($.KMeans_parcial.Centers.id,r,ids);
 // b := SORT (a,-cnt);
// EXPORT teste := b;


// IMPORT $;
// IMPORT DBSCAN;
// IMPORT ML_Core;
// blobs := $.File_distcluster;


// EXPORT teste:= MODULE
// EXPORT abba (UNSIGNED sec) := FUNCTION

		// k := blobs(clusterid = sec);
		// ML_Core.ToField(k,recs);
		// ola := ML_Core.FieldAggregates(recs).simple;
	// RETURN ola;

// END;
// END;



//Example using MODULE structure to return multiple values from a FUNCTION
// OperateOnNumbers(Number1, Number2) := FUNCTION
  // result := MODULE
    // EXPORT Multiplied  := Number1 * Number2;
    // EXPORT Differenced := Number1 - Number2;
    // EXPORT Summed      := Number1 + Number2;  
  // END;
  // RETURN result;
// END;

// OperateOnNumbers(23,22).Multiplied;
// OperateOnNumbers(23,22).Differenced;
// OperateOnNumbers(23,22).Summed; 
//usar isso pra média lá


// IMPORT $;
// IMPORT DBSCAN;
// IMPORT ML_Core;
// blobs := $.File_distcluster;
// EXPORT teste := MODULE

// ML_Core.ToField(blobs(clusterid = 695),recs1);
// EXPORT D := ML_Core.FieldAggregates(recs1);
// EXPORT myAggs1 := D.Ntiles(4);
// EXPORT myAggs2 := D.NtileRanges(4);
// EXPORT S:= SORT(myAggs2, number, ntile);
// END;