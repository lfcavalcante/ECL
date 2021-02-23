IMPORT $;
IMPORT STD;

IPTU :=$.File_IPTU2019.File2019;
 

ds := IPTU;

 

out_rec := RECORD

                decimal5_4 FRACAO_IDEAL:= (decimal5_4)STD.Str.SubstituteIncluded(ds.FRACAO_IDEAL,',','.');

END;

 

ds_d:=TABLE(ds,out_rec);

ds_d;

 

media:=AVE(ds_d,FRACAO_IDEAL);

media;
// EXPORT genrico := 'todo';