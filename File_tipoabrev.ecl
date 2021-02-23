IMPORT $;
myData := $.FIle_ndatas;
VI := $.File_TabelaVI.TabelaVI;
Layout := RECORD

// UNSIGNED id;
$.File_ndatas;
STRING Tipoabrev;
END;

Layout cc ($.FIle_ndatas Le, $.File_TabelaVI.TabelaVI Ri) := TRANSFORM

SELF.Tipoabrev := Ri.Tipoabrev;

SELF := LE;

END;

Venal := JOIN(myData, VI, LEFT.TIPO_DE_PADRAO_DA_CONSTRUCAO = RIGHT.Tipop AND LEFT.VALOR_DO_M2_DE_CONSTRUCAO = RIGHT.Valor, cc(LEFT,RIGHT),LEFT OUTER);

EXPORT File_tipoabrev := Venal : PERSIST('~USP::IC::PERSIST::tipoabrev');
