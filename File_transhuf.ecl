IMPORT $;
myData := $.File_nuntrans;

MyFormatExt := RECORD

  UNSIGNED rnd; // A random number
	$.File_nuntrans;

END;

MyFormat := RECORD
	
	$.File_nuntrans;
	
END;
	

// Assign a random number to each record
// MyFormatExt cc ($.File_nuntrans Le) := TRANSFORM

// SELF.rnd := RANDOM();

// SELF := Le;

// END;

// myDataE := PROJECT(myData, cc(LEFT));

// Shuffle your data by sorting on the random field

// myDataES := SORT(myDataE, rnd);

myTrainData := PROJECT(myData, MyFormat);
EXPORT File_transhuf := myTrainData;