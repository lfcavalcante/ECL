IMPORT $;


EXPORT File_outliers := MODULE

EXPORT Outliers (UNSIGNED z) := FUNCTION

	a := $.File_distcluster(clusterid = z AND distancia > $.File_boxplot(id = z)[1].limsuperior);
	b := $.File_distcluster(clusterid = z AND distancia < $.File_boxplot(id = z)[1].liminferior);
	c := a+b;
	RETURN c;
END;
END;