IMPORT $;
r := RECORD
 $.File_tipoabrev.tipoabrev;
 INTEGER cnt := COUNT(GROUP);
 END;
 a := TABLE($.File_tipoabrev,r,tipoabrev);
 b := SORT (a,-cnt);
EXPORT File_tipocount := b;
