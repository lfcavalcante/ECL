#OPTION('maxCsvRowSizeMb',30);
IMPORT $;
IMPORT STD.DataPatterns;
// LENGTH
// filePath := '~usp::ic::lf::iptu_2014';

// ds := DATASET(filePath, RECORDOF(filePath, LOOKUP), CSV);
ds := $.File_IPTU2019.File2019;
profileResults := DataPatterns.Profile(ds);

OUTPUT(profileResults, ALL, NAMED('profileResults'));

// EXPORT AnIPTU15 := 'todo';