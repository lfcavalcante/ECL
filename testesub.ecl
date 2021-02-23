IMPORT STD;
A := (UNSIGNED) STD.Str.FindReplace('02378-000', '-','');
B := INTFORMAT (A,8,1);
   //A contains 'AXYDEAXYDE'
EXPORT testesub := A;