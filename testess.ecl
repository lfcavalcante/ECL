AkaRec := {STRING20 forename,STRING20 surname};
outputRec := RECORD
  UNSIGNED id;
  DATASET(AkaRec) kids;
END;
inputRec := {UNSIGNED id,STRING20 forename,STRING20 surname};
inPeople := DATASET([{1,'Kevin','Halligan'},{2,'Kevin','Hall'},
                     {3,'Eliza','Hall'},{4,'Beth','Took'}],inputRec);
outputRec makeFatRecord(inputRec L) := TRANSFORM
  SELF.id := l.id;
  SELF.kids := DATASET([{ L.forename, L.surname }],AkaRec);
END;
fatIn := PROJECT(inPeople, makeFatRecord(LEFT));
outputRec makeChildren(outputRec L, outputRec R) := TRANSFORM
  SELF.id := L.id;
  SELF.kids := L.kids + ROW({R.kids[1].forename,R.kids[1].surname},AkaRec);
END;
// r := ROLLUP(fatIn, id, makeChildren(LEFT, RIGHT));
EXPORT testess := fatin;