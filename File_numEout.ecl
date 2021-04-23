IMPORT $;
IMPORT ML_Core;

r := RECORD
 $.File_CEPclusterizado.venal2.clusterid;
 INTEGER cnt := COUNT(GROUP);
 END;
 a := TABLE($.File_CEPclusterizado.venal2,r,clusterid);
 
Layout := RECORD
 $.File_Kmtabelado;
 UNSIGNED qtd_no_cluster;
 UNSIGNED qtd_outliers;
 END;
 
 Layout BuildIt($.File_Kmtabelado Le,a Ri) := TRANSFORM
	
	SELF.qtd_no_cluster := Ri.cnt;
	SELF.qtd_outliers := 0;


  SELF := Le;
	
  END;


Col_Out := JOIN($.File_Kmtabelado,a,LEFT.id = RIGHT.clusterid,BuildIt(LEFT,RIGHT));
 
Layout BuildIt1(Col_out Le,$.File_boxplot Ri) := TRANSFORM
	
	
	SELF.qtd_outliers := COUNT($.File_distcluster(clusterid = Le.id AND distancia > Ri.limsuperior)) + COUNT($.File_distcluster(clusterid = Le.id AND distancia < Ri.liminferior));


  SELF := Le;
	
  END;
	
Jol_Out := JOIN(Col_out,$.File_boxplot,LEFT.id = RIGHT.id,BuildIt1(LEFT,RIGHT));

EXPORT File_numEout := Jol_out : PERSIST('~USP::IC::PERSIST::Kmeans_completo');