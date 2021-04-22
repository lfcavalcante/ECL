IMPORT $;
myData := $.File_transhuf;

Layout := RECORD

UNSIGNED id;
$.File_transhuf

END;

Layout cc ($.File_nuntrans Le, INTEGER cnt) := TRANSFORM

SELF.id := cnt;

SELF := LE;

END;

Venal := PROJECT(myData, cc(LEFT, COUNTER));

EXPORT File_transhufid := Venal : PERSIST('~USP::IC::PERSIST::CEPnumID');