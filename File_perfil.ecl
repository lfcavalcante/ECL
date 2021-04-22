IMPORT $;
IMPORT Std.DataPatterns;

ds := $.File_normalized;
profileResults := DataPatterns.Profile(ds);
OUTPUT(profileResults, ALL, NAMED('profileResults'));
// EXPORT File_perfil := a;
#WORKUNIT('name','USP_IC_profile');