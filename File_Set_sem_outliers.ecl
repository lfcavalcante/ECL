IMPORT $;
IPTU := $.File_normalized;
IPTU1 := IPTU (zona = -1.187980353228977);
IPTU2 := IPTU (zona = 0.1014192424324489);
IPTU3 := IPTU (zona = 1.390818838093875);
Ct := COUNT (IPTU);
Ct1 := COUNT(IPTU1);
Ct2 := COUNT(IPTU2);
Ct3 := COUNT(IPTU3);
fm := Ct/Ct;
// Half_0 := $.DBSCAN_parcial.Outliers;
// Half_1 := $.DBSCAN_parcial.Outliers1;
// Half_2 := $.DBSCAN_parcial.Outliers2;
// Half_3 := $.DBSCAN_parcial.Outliers3;
// Half_4 := $.DBSCAN_parcial.Outliers4;
// Half_5 := $.DBSCAN_parcial.Outliers5;
// Half_6 := $.DBSCAN_parcial.Outliers6;
// Half_7 := $.DBSCAN_parcial.Outliers7;
// Half_8 := $.DBSCAN_parcial.Outliers8;
// Half_9 := $.DBSCAN_parcial.Outliers9;
// Half_10 := $.DBSCAN_parcial.Outliers10;

Divblobs1   := CHOOSEN(IPTU1,fm*Ct1);
Divblobs2   := CHOOSEN(IPTU2,fm*Ct2);
Divblobs3  := CHOOSEN(IPTU3,fm*Ct3);

EXPORT File_Set_sem_outliers := MODULE

Layout := RECORD

$.File_normalized

END;

EXPORT Layout cc ($.File_normalized Le ) := TRANSFORM

// SELF.id := Ri.id;

SELF := Le;

END;

// EXPORT DS := JOIN(IPTU,Half_0,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS1 := JOIN(IPTU,Half_1,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS2 := JOIN(IPTU,Half_2,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS3 := JOIN(IPTU,Half_3,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS4 := JOIN(IPTU,Half_4,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS5 := JOIN(IPTU,Half_5,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS6 := JOIN(IPTU,Half_6,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS7 := JOIN(IPTU,Half_7,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS8 := JOIN(IPTU,Half_8,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS9 := JOIN(IPTU,Half_9,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));
// EXPORT DS10 := JOIN(IPTU,Half_10,LEFT.id = RIGHT.id AND RIGHT.label != 0, cc(LEFT));

EXPORT DS := Divblobs1;
EXPORT DS1 := Divblobs2;
EXPORT DS2 := Divblobs3;

// EXPORT DStotal := DS+DS1+DS2+DS3+DS4+DS5+DS6+DS7+DS8+DS9+DS10 : PERSIST('~USP::IC::PERSIST::DStot_sem_outliers');
EXPORT DStotal := DS+DS1+DS2 : PERSIST('~USP::IC::PERSIST::DStot');

END;