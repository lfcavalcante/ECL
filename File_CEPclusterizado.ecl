﻿IMPORT $;
// IMPORT STD;
// Isso := $.File_normalized;
Isso := $.File_centroids;
Tabel := $.KMeans_parcial.Labelss;
myData := $.File_transhufid;
EXPORT File_CEPclusterizado := MODULE
EXPORT VenalLayout := RECORD
	
	Isso;
	
	UNSIGNED Clusterid;
	
	
END;

EXPORT VenalLayout2 := RECORD

$.File_transhufid;
	
UNSIGNED Clusterid;
	
	
END;

EXPORT VenalLayout cc(Isso Le,$.KMeans_parcial.Labelss Ri) := TRANSFORM

SELF.Clusterid := Ri.label;

SELF := Le;
END;

EXPORT VenalLayout2 dd($.File_transhufid Le,$.KMeans_parcial.Labelss Ri) := TRANSFORM

SELF.Clusterid := Ri.label;

SELF := Le;
END;
// Venal := PROJECT(Isso, cc(LEFT));

EXPORT Venal2 := JOIN(Isso,Tabel,LEFT.id = RIGHT.id, cc(LEFT,RIGHT)) : PERSIST('~USP::IC::PERSIST::CEPclusterizadonorm');
EXPORT Venaldois := JOIN(myData,Tabel,LEFT.id = RIGHT.id, dd(LEFT,RIGHT)) : PERSIST('~USP::IC::PERSIST::CEPclusterizado');

EXPORT Venal := SORT(Venal2,Clusterid);
EXPORT Venalll := SORT(Venaldois,Clusterid);
// EXPORT Venalk := Venal;
// EXPORT Venal : PERSIST('~USP::IC::PERSIST::CEPclusterizado');
END;
