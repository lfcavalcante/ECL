IMPORT $;
r := RECORD
 $.File_Vencomp.CEP_DO_IMOVEL;
 INTEGER cnt := COUNT(GROUP);
 END;
 a := TABLE($.File_Vencomp,r,CEP_DO_IMOVEL);
 b := SORT (a,-cnt);
EXPORT File_CEPcount := b;

