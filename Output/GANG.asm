
// ********* getName Property ***********
@entry_getName: // 0
	ALIAS r1 $literalexpression145 // 1
	LOAD $literalexpression145 "Nachomen" // 1
	PUSH $literalexpression145 // 13
	JMP @exit_getName // 15
@exit_getName: // 18
RET // 19

// ********* isBurnable Property ***********
@entry_isBurnable: // 20
	ALIAS r1 $literalexpression149 // 21
	LOAD $literalexpression149 true // 21
	PUSH $literalexpression149 // 26
	JMP @exit_isBurnable // 28
@exit_isBurnable: // 31
RET // 32

// ********* isFinite Property ***********
@entry_isFinite: // 33
	ALIAS r1 $literalexpression153 // 34
	LOAD $literalexpression153 true // 34
	PUSH $literalexpression153 // 39
	JMP @exit_isFinite // 41
@exit_isFinite: // 44
RET // 45

// ********* isFungible Property ***********
@entry_isFungible: // 46
	ALIAS r1 $literalexpression157 // 47
	LOAD $literalexpression157 false // 47
	PUSH $literalexpression157 // 52
	JMP @exit_isFungible // 54
@exit_isFungible: // 57
RET // 58

// ********* getMaxSupply Property ***********
@entry_getMaxSupply: // 59
	LOAD r1 3 // field type // 60
	PUSH r1 // 65
	ALIAS r2 $literalexpression167 // 67
	LOAD $literalexpression167 "_supply" // 67
	PUSH $literalexpression167 // 78
	ALIAS r2 $literalexpression166 // 80
	LOAD $literalexpression166 "GANG" // 80
	PUSH $literalexpression166 // 88
	LOAD r1 "Data.Get" // 90
	EXTCALL r1 // 102
	POP r1 // 104
	PUSH r1 // 106
	JMP @exit_getMaxSupply // 108
@exit_getMaxSupply: // 111
RET // 112
// Line 57:		}
// Line 58:	}

// ********* launchSeries Method ***********
@entry_launchSeries: // 113
ALIAS r1 $dataGet // 114
LOAD $dataGet "Data.Get" // 114
ALIAS r2 $contractName // 126
LOAD $contractName "GANG" // 126
ALIAS r3 $_owner // 134
// reading global: _owner
LOAD r0 8 // 134
PUSH r0 // 139
LOAD r0 "_owner" // 141
PUSH r0 // 151
PUSH $contractName // 153
EXTCALL $dataGet // 155
POP $_owner // 157
PUSH $_owner // 159
EXTCALL "Address()" // 161
POP $_owner // 176
ALIAS r4 $_supply // 178
// reading global: _supply
LOAD r0 3 // 178
PUSH r0 // 183
LOAD r0 "_supply" // 185
PUSH r0 // 196
PUSH $contractName // 198
EXTCALL $dataGet // 200
POP $_supply // 202
ALIAS r5 $_totalSeries // 204
// reading global: _totalSeries
LOAD r0 3 // 204
PUSH r0 // 209
LOAD r0 "_totalSeries" // 211
PUSH r0 // 227
PUSH $contractName // 229
EXTCALL $dataGet // 231
POP $_totalSeries // 233
// Line 59:	
// Line 60:	// creates a new pirate series with a specific name and seed (used for visual)
// Line 61:	public launchSeries(seriesSupply:number, seriesName:string, seriesSeed: number) : number
ALIAS r1 $seriesSupply // 235
POP $seriesSupply // 235
CAST $seriesSupply $seriesSupply #Number // 237
ALIAS r2 $seriesName // 241
POP $seriesName // 241
ALIAS r6 $seriesSeed // 243
POP $seriesSeed // 243
CAST $seriesSeed $seriesSeed #Number // 245
// Line 62:	{		
// Line 63:		Runtime.expect(Runtime.isWitness(_owner), "witness failed");
	ALIAS r7 $methodcallexpression254 // 249
	COPY $_owner r8 // 249
	PUSH r8 // 252
	LOAD $methodcallexpression254 "Runtime.IsWitness" // 254
	EXTCALL $methodcallexpression254 // 275
	POP $methodcallexpression254 // 277
	JMPIF $methodcallexpression254 @expect_methodcallexpression251 // 279
	ALIAS r8 $literalexpression257 // 283
	LOAD $literalexpression257 "witness failed" // 283
	THROW $literalexpression257 // 301
	@expect_methodcallexpression251: NOP // 304
// Line 64:
// Line 65:		Runtime.expect(seriesSupply > 0, "invalid supply");
	COPY $seriesSupply r7 // 304
	ALIAS r8 $literalexpression263 // 307
	LOAD $literalexpression263 0 // 307
	GT r7 $literalexpression263 r9 // 312
	JMPIF r9 @expect_methodcallexpression259 // 316
	ALIAS r7 $literalexpression265 // 320
	LOAD $literalexpression265 "invalid supply" // 320
	THROW $literalexpression265 // 338
	@expect_methodcallexpression259: NOP // 341
// Line 66:		Runtime.expect(seriesSupply <= 1000, "supply too large");
	COPY $seriesSupply r7 // 341
	ALIAS r8 $literalexpression271 // 344
	LOAD $literalexpression271 1000 // 344
	LTE r7 $literalexpression271 r9 // 350
	JMPIF r9 @expect_methodcallexpression267 // 354
	ALIAS r7 $literalexpression273 // 358
	LOAD $literalexpression273 "supply too large" // 358
	THROW $literalexpression273 // 378
	@expect_methodcallexpression267: NOP // 381
// Line 67:		Runtime.expect(seriesSeed > 0, "invalid seed");
	COPY $seriesSeed r7 // 381
	ALIAS r8 $literalexpression279 // 384
	LOAD $literalexpression279 0 // 384
	GT r7 $literalexpression279 r9 // 389
	JMPIF r9 @expect_methodcallexpression275 // 393
	ALIAS r7 $literalexpression281 // 397
	LOAD $literalexpression281 "invalid seed" // 397
	THROW $literalexpression281 // 413
	@expect_methodcallexpression275: NOP // 416
// Line 68:		Runtime.expect(seriesName.length() > 0, "invalid name");
	COPY $seriesName r7 // 416
	SIZE r7 r7 // 419
	ALIAS r8 $literalexpression289 // 422
	LOAD $literalexpression289 0 // 422
	GT r7 $literalexpression289 r9 // 427
	JMPIF r9 @expect_methodcallexpression283 // 431
	ALIAS r7 $literalexpression291 // 435
	LOAD $literalexpression291 "invalid name" // 435
	THROW $literalexpression291 // 451
	@expect_methodcallexpression283: NOP // 454
// Line 69:
// Line 70:		_totalSeries += 1;
	COPY $_totalSeries r7 // 454
	ALIAS r8 $literalexpression293 // 457
	LOAD $literalexpression293 1 // 457
	ADD r7 $literalexpression293 r9 // 462
	COPY r9 $_totalSeries // 466
// Line 71:		local seriesID:number = _totalSeries;
	ALIAS r7 $seriesID // 469
	COPY $_totalSeries r8 // 469
	COPY r8 $seriesID // 472
// Line 72:
// Line 73:		NFT.createSeries(_owner, $THIS_SYMBOL, seriesID, seriesSupply, TokenSeries.Duplicated, pirate);
	ALIAS r8 $methodcallexpression300 // 475
	LOAD r9 0x04076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04580000000107746F6B656E4944030B676574496D61676555524C04740000000107746F6B656E4944030A676574496E666F55524C04FF0000000107746F6B656E49440300 // abi // 475
	PUSH r9 // 587
	LOAD r9 0x0004010D000403524F4D030003010D00040447414E4703000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085700000B0004010D01040E41727267672C20706972617465210301087300000B0004010D0004087365726965734944030003010D00040447414E4703000D00041152756E74696D652E52656164546F6B656E070004023202020D0004087365726965734944300203000D01042068747470733A2F2F67616E67706C616E6B2E696F2F696D672F7069726174655F0203020E020204230102040D0104042E706E6723040102030208FE00000B0004010201020D01042068747470733A2F2F67616E67706C616E6B2E696F2F6170692F7069726174652F0202030E030304230103040304083A01000B // script // 589
	PUSH r9 // 910
	ALIAS r9 $literalexpression312 // 912
	LOAD $literalexpression312 1 Enum // 912
	PUSH $literalexpression312 // 920
	COPY $seriesSupply r9 // 922
	PUSH r9 // 925
	COPY $seriesID r9 // 927
	PUSH r9 // 930
	ALIAS r9 $literalexpression309 // 932
	LOAD $literalexpression309 "GANG" // 932
	PUSH $literalexpression309 // 940
	COPY $_owner r9 // 942
	PUSH r9 // 945
	LOAD $methodcallexpression300 "Nexus.CreateTokenSeries" // 947
	EXTCALL $methodcallexpression300 // 974
// Line 74:
// Line 75:		_supply += seriesSupply;
	COPY $_supply r8 // 976
	COPY $seriesSupply r9 // 979
	ADD r8 r9 r10 // 982
	COPY r10 $_supply // 986
// Line 76:
// Line 77:		_seriesNames.set(seriesID, seriesName);
	ALIAS r8 $methodcallexpression331 // 989
	COPY $seriesName r9 // 989
	PUSH r9 // 992
	COPY $seriesID r9 // 994
	PUSH r9 // 997
	ALIAS r9 $literalexpression337 // 999
	LOAD $literalexpression337 "_seriesNames" // 999
	PUSH $literalexpression337 // 1015
	LOAD $methodcallexpression331 "Map.Set" // 1017
	EXTCALL $methodcallexpression331 // 1028
// Line 78:		_seriesSeeds.set(seriesID, seriesSeed);
	ALIAS r8 $methodcallexpression353 // 1030
	COPY $seriesSeed r9 // 1030
	PUSH r9 // 1033
	COPY $seriesID r9 // 1035
	PUSH r9 // 1038
	ALIAS r9 $literalexpression359 // 1040
	LOAD $literalexpression359 "_seriesSeeds" // 1040
	PUSH $literalexpression359 // 1056
	LOAD $methodcallexpression353 "Map.Set" // 1058
	EXTCALL $methodcallexpression353 // 1069
// Line 79:		_seriesCount.set(seriesID, 0);
	ALIAS r8 $methodcallexpression363 // 1071
	ALIAS r9 $literalexpression371 // 1071
	LOAD $literalexpression371 0 // 1071
	PUSH $literalexpression371 // 1076
	COPY $seriesID r9 // 1078
	PUSH r9 // 1081
	ALIAS r9 $literalexpression369 // 1083
	LOAD $literalexpression369 "_seriesCount" // 1083
	PUSH $literalexpression369 // 1099
	LOAD $methodcallexpression363 "Map.Set" // 1101
	EXTCALL $methodcallexpression363 // 1112
// Line 80:		_seriesSupply.set(seriesID, seriesSupply);
	ALIAS r8 $methodcallexpression373 // 1114
	COPY $seriesSupply r9 // 1114
	PUSH r9 // 1117
	COPY $seriesID r9 // 1119
	PUSH r9 // 1122
	ALIAS r9 $literalexpression379 // 1124
	LOAD $literalexpression379 "_seriesSupply" // 1124
	PUSH $literalexpression379 // 1141
	LOAD $methodcallexpression373 "Map.Set" // 1143
	EXTCALL $methodcallexpression373 // 1154
// Line 81:
// Line 82:		return seriesID;
	COPY $seriesID r8 // 1156
	PUSH r8 // 1159
	JMP @exit_launchSeries // 1161
@exit_launchSeries: // 1164
LOAD r1 "Data.Set" // 1165
// writing global: _supply
PUSH $_supply // 1177
LOAD r0 "_supply" // 1179
PUSH r0 // 1190
EXTCALL r1 // 1192
// writing global: _totalSeries
PUSH $_totalSeries // 1194
LOAD r0 "_totalSeries" // 1196
PUSH r0 // 1212
EXTCALL r1 // 1214
RET // 1216
// Line 83:	}

// ********* mintPirate Method ***********
@entry_mintPirate: // 1217
ALIAS r1 $dataGet // 1218
LOAD $dataGet "Data.Get" // 1218
ALIAS r2 $contractName // 1230
LOAD $contractName "GANG" // 1230
ALIAS r3 $_totalSeries // 1238
// reading global: _totalSeries
LOAD r0 3 // 1238
PUSH r0 // 1243
LOAD r0 "_totalSeries" // 1245
PUSH r0 // 1261
PUSH $contractName // 1263
EXTCALL $dataGet // 1265
POP $_totalSeries // 1267
// Line 84:	
// Line 85:	
// Line 86:	public mintPirate(from:address, to:address, seriesID:number, comment:string) 
ALIAS r1 $from // 1269
POP $from // 1269
PUSH $from // 1271
EXTCALL "Address()" // 1273
POP $from // 1288
ALIAS r2 $to // 1290
POP $to // 1290
PUSH $to // 1292
EXTCALL "Address()" // 1294
POP $to // 1309
ALIAS r4 $seriesID // 1311
POP $seriesID // 1311
CAST $seriesID $seriesID #Number // 1313
ALIAS r5 $comment // 1317
POP $comment // 1317
// Line 87:	{
// Line 88:		Runtime.expect(seriesID > 0, "invalid seriesID");
	COPY $seriesID r6 // 1319
	ALIAS r7 $literalexpression399 // 1322
	LOAD $literalexpression399 0 // 1322
	GT r6 $literalexpression399 r8 // 1327
	JMPIF r8 @expect_methodcallexpression395 // 1331
	ALIAS r6 $literalexpression401 // 1335
	LOAD $literalexpression401 "invalid seriesID" // 1335
	THROW $literalexpression401 // 1355
	@expect_methodcallexpression395: NOP // 1358
// Line 89:		Runtime.expect(seriesID <= _totalSeries, "seriesID not launched yet");
	COPY $seriesID r6 // 1358
	COPY $_totalSeries r7 // 1361
	LTE r6 r7 r8 // 1364
	JMPIF r8 @expect_methodcallexpression403 // 1368
	ALIAS r6 $literalexpression409 // 1372
	LOAD $literalexpression409 "seriesID not launched yet" // 1372
	THROW $literalexpression409 // 1401
	@expect_methodcallexpression403: NOP // 1404
// Line 90:
// Line 91:		local seriesSupply:number = _seriesSupply.get(seriesID);
	ALIAS r6 $seriesSupply // 1404
	LOAD r7 3 // field type // 1404
	PUSH r7 // 1409
	COPY $seriesID r8 // 1411
	PUSH r8 // 1414
	ALIAS r8 $literalexpression414 // 1416
	LOAD $literalexpression414 "_seriesSupply" // 1416
	PUSH $literalexpression414 // 1433
	LOAD $literalexpression414 "GANG" // contract name // 1435
	PUSH $literalexpression414 // 1443
	LOAD r7 "Map.Get" // 1445
	EXTCALL r7 // 1456
	POP r7 // 1458
	COPY r7 $seriesSupply // 1460
// Line 92:		Runtime.expect(seriesSupply > 0, "something went wrong");
	COPY $seriesSupply r7 // 1463
	ALIAS r8 $literalexpression423 // 1466
	LOAD $literalexpression423 0 // 1466
	GT r7 $literalexpression423 r9 // 1471
	JMPIF r9 @expect_methodcallexpression419 // 1475
	ALIAS r7 $literalexpression425 // 1479
	LOAD $literalexpression425 "something went wrong" // 1479
	THROW $literalexpression425 // 1503
	@expect_methodcallexpression419: NOP // 1506
// Line 93:		
// Line 94:		local mintedAmount:number = _seriesCount.get(seriesID);
	ALIAS r7 $mintedAmount // 1506
	LOAD r8 3 // field type // 1506
	PUSH r8 // 1511
	COPY $seriesID r9 // 1513
	PUSH r9 // 1516
	ALIAS r9 $literalexpression430 // 1518
	LOAD $literalexpression430 "_seriesCount" // 1518
	PUSH $literalexpression430 // 1534
	LOAD $literalexpression430 "GANG" // contract name // 1536
	PUSH $literalexpression430 // 1544
	LOAD r8 "Map.Get" // 1546
	EXTCALL r8 // 1557
	POP r8 // 1559
	COPY r8 $mintedAmount // 1561
// Line 95:		Runtime.expect(mintedAmount < seriesSupply, "series already fully minted");
	COPY $mintedAmount r8 // 1564
	COPY $seriesSupply r9 // 1567
	LT r8 r9 r10 // 1570
	JMPIF r10 @expect_methodcallexpression435 // 1574
	ALIAS r8 $literalexpression441 // 1578
	LOAD $literalexpression441 "series already fully minted" // 1578
	THROW $literalexpression441 // 1609
	@expect_methodcallexpression435: NOP // 1612
// Line 96:
// Line 97:		local seriesName:string = _seriesNames.get(seriesID);
	ALIAS r8 $seriesName // 1612
	LOAD r9 4 // field type // 1612
	PUSH r9 // 1617
	COPY $seriesID r10 // 1619
	PUSH r10 // 1622
	ALIAS r10 $literalexpression446 // 1624
	LOAD $literalexpression446 "_seriesNames" // 1624
	PUSH $literalexpression446 // 1640
	LOAD $literalexpression446 "GANG" // contract name // 1642
	PUSH $literalexpression446 // 1650
	LOAD r9 "Map.Get" // 1652
	EXTCALL r9 // 1663
	POP r9 // 1665
	COPY r9 $seriesName // 1667
// Line 98:		local seriesSeed:number = _seriesSeeds.get(seriesID);
	ALIAS r9 $seriesSeed // 1670
	LOAD r10 3 // field type // 1670
	PUSH r10 // 1675
	COPY $seriesID r11 // 1677
	PUSH r11 // 1680
	ALIAS r11 $literalexpression454 // 1682
	LOAD $literalexpression454 "_seriesSeeds" // 1682
	PUSH $literalexpression454 // 1698
	LOAD $literalexpression454 "GANG" // contract name // 1700
	PUSH $literalexpression454 // 1708
	LOAD r10 "Map.Get" // 1710
	EXTCALL r10 // 1721
	POP r10 // 1723
	COPY r10 $seriesSeed // 1725
// Line 99:
// Line 100:		local rom_data:pirate_rom = Struct.pirate_rom(seriesName, seriesSeed);
	ALIAS r10 $rom_data // 1728
	CLEAR r11 // 1728
	COPY $seriesName r13 // 1730
	LOAD r12 "name" // 1733
	PUT r13 r11 r12 // 1741
	COPY $seriesSeed r13 // 1745
	LOAD r12 "seed" // 1748
	PUT r13 r11 r12 // 1756
	COPY r11 $rom_data // 1760
// Line 101:		local ram_data:pirate_ram = Struct.pirate_ram(comment); // "Ahoy!"
	ALIAS r11 $ram_data // 1763
	CLEAR r12 // 1763
	COPY $comment r14 // 1765
	LOAD r13 "comment" // 1768
	PUT r14 r12 r13 // 1779
	COPY r12 $ram_data // 1783
// Line 102:
// Line 103:		NFT.mint(from, to, $THIS_SYMBOL, rom_data, ram_data, seriesID);
	ALIAS r12 $methodcallexpression471 // 1786
	COPY $seriesID r13 // 1786
	PUSH r13 // 1789
	COPY $ram_data r13 // 1791
	CAST r13 r13 #Bytes // 1794
	PUSH r13 // 1798
	COPY $rom_data r13 // 1800
	CAST r13 r13 #Bytes // 1803
	PUSH r13 // 1807
	ALIAS r13 $literalexpression481 // 1809
	LOAD $literalexpression481 "GANG" // 1809
	PUSH $literalexpression481 // 1817
	COPY $to r13 // 1819
	PUSH r13 // 1822
	COPY $from r13 // 1824
	PUSH r13 // 1827
	LOAD $methodcallexpression471 "Runtime.MintToken" // 1829
	EXTCALL $methodcallexpression471 // 1850
	POP $methodcallexpression471 // 1852
@exit_mintPirate: // 1854
RET // 1855
// Line 104:	}

// ********* Initialize Constructor ***********
@entry_constructor: // 1856
ALIAS r1 $nexus_protocol_version // 1857
// validate protocol version
LOAD r0 "Runtime.Version" // 1857
EXTCALL r0 // 1876
POP r0 // 1878
LOAD $nexus_protocol_version 14 // 1880
LT r0 $nexus_protocol_version r0 // 1885
JMPNOT r0 @protocol_version_validated // 1889
LOAD r0 "Current nexus protocol version should be 14 or more" // 1893
THROW r0 // 1948
@protocol_version_validated: NOP // 1951
ALIAS r1 $_owner // 1951
ALIAS r2 $_supply // 1951
ALIAS r3 $_totalSeries // 1951
// clearing _seriesNames storage
LOAD r0 "_seriesNames" // 1951
PUSH r0 // 1967
LOAD r0 "Map.Clear" // 1969
EXTCALL r0 // 1982
// clearing _seriesSeeds storage
LOAD r0 "_seriesSeeds" // 1984
PUSH r0 // 2000
LOAD r0 "Map.Clear" // 2002
EXTCALL r0 // 2015
// clearing _seriesCount storage
LOAD r0 "_seriesCount" // 2017
PUSH r0 // 2033
LOAD r0 "Map.Clear" // 2035
EXTCALL r0 // 2048
// clearing _seriesSupply storage
LOAD r0 "_seriesSupply" // 2050
PUSH r0 // 2067
LOAD r0 "Map.Clear" // 2069
EXTCALL r0 // 2082
// Line 105:
// Line 106:	constructor (addr:address) 
ALIAS r4 $addr // 2084
POP $addr // 2084
PUSH $addr // 2086
EXTCALL "Address()" // 2088
POP $addr // 2103
// Line 107:	{
// Line 108:		_owner = addr;
	COPY $addr r5 // 2105
	COPY r5 $_owner // 2108
// Line 109:		_totalSeries = 0;
	ALIAS r5 $literalexpression492 // 2111
	LOAD $literalexpression492 0 // 2111
	COPY $literalexpression492 $_totalSeries // 2116
// Line 110:		_supply = 0;
	ALIAS r5 $literalexpression494 // 2119
	LOAD $literalexpression494 0 // 2119
	COPY $literalexpression494 $_supply // 2124
// Line 111:		// at least one token series must exist, here we create 2 series
// Line 112:		// they don't have to be created in the constructor though, can be created later
// Line 113:		this.launchSeries(10, "Origin", 123); // TODO change this later
	ALIAS r5 $methodcallexpression496 // 2127
	ALIAS r6 $literalexpression502 // 2127
	LOAD $literalexpression502 123 // 2127
	PUSH $literalexpression502 // 2132
	ALIAS r6 $literalexpression501 // 2134
	LOAD $literalexpression501 "Origin" // 2134
	PUSH $literalexpression501 // 2144
	ALIAS r6 $literalexpression500 // 2146
	LOAD $literalexpression500 10 // 2146
	PUSH $literalexpression500 // 2151
	CALL @entry_launchSeries // 2153
	POP $methodcallexpression496 // 2157
@exit_constructor: // 2159
LOAD r4 "Data.Set" // 2160
// writing global: _owner
PUSH $_owner // 2172
LOAD r0 "_owner" // 2174
PUSH r0 // 2184
EXTCALL r4 // 2186
// writing global: _supply
PUSH $_supply // 2188
LOAD r0 "_supply" // 2190
PUSH r0 // 2201
EXTCALL r4 // 2203
// writing global: _totalSeries
PUSH $_totalSeries // 2205
LOAD r0 "_totalSeries" // 2207
PUSH r0 // 2223
EXTCALL r4 // 2225
RET // 2227
// Line 114:	}

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 2228
ALIAS r1 $dataGet // 2229
LOAD $dataGet "Data.Get" // 2229
ALIAS r2 $contractName // 2241
LOAD $contractName "GANG" // 2241
ALIAS r3 $_owner // 2249
// reading global: _owner
LOAD r0 8 // 2249
PUSH r0 // 2254
LOAD r0 "_owner" // 2256
PUSH r0 // 2266
PUSH $contractName // 2268
EXTCALL $dataGet // 2270
POP $_owner // 2272
PUSH $_owner // 2274
EXTCALL "Address()" // 2276
POP $_owner // 2291
// Line 115:
// Line 116:	// allows the token to be upgraded later, remove this trigger if you want a imutable fungible token
// Line 117:	trigger onUpgrade(from:address)
ALIAS r1 $from // 2293
POP $from // 2293
PUSH $from // 2295
EXTCALL "Address()" // 2297
POP $from // 2312
// Line 118:	{
// Line 119:		Runtime.expect(Runtime.isWitness(_owner), "witness failed");
	ALIAS r2 $methodcallexpression511 // 2314
	COPY $_owner r4 // 2314
	PUSH r4 // 2317
	LOAD $methodcallexpression511 "Runtime.IsWitness" // 2319
	EXTCALL $methodcallexpression511 // 2340
	POP $methodcallexpression511 // 2342
	JMPIF $methodcallexpression511 @expect_methodcallexpression508 // 2344
	ALIAS r4 $literalexpression514 // 2348
	LOAD $literalexpression514 "witness failed" // 2348
	THROW $literalexpression514 // 2366
	@expect_methodcallexpression508: NOP // 2369
// Line 120:		return;
	JMP @exit_onUpgrade // 2369
@exit_onUpgrade: // 2372
RET // 2373
// Line 121:	}

// ********* onMint Trigger ***********
@entry_onMint: // 2374
ALIAS r1 $dataGet // 2375
LOAD $dataGet "Data.Get" // 2375
ALIAS r2 $contractName // 2387
LOAD $contractName "GANG" // 2387
ALIAS r3 $_owner // 2395
// reading global: _owner
LOAD r0 8 // 2395
PUSH r0 // 2400
LOAD r0 "_owner" // 2402
PUSH r0 // 2412
PUSH $contractName // 2414
EXTCALL $dataGet // 2416
POP $_owner // 2418
PUSH $_owner // 2420
EXTCALL "Address()" // 2422
POP $_owner // 2437
// Line 122:
// Line 123:	// makes sure only the owner can mint
// Line 124:	trigger onMint(from:address, to:address, symbol:string, tokenID:number)
ALIAS r1 $from // 2439
POP $from // 2439
PUSH $from // 2441
EXTCALL "Address()" // 2443
POP $from // 2458
ALIAS r2 $to // 2460
POP $to // 2460
PUSH $to // 2462
EXTCALL "Address()" // 2464
POP $to // 2479
ALIAS r4 $symbol // 2481
POP $symbol // 2481
ALIAS r5 $tokenID // 2483
POP $tokenID // 2483
CAST $tokenID $tokenID #Number // 2485
// Line 125:    {
// Line 126:        // check is witness and is current owner
// Line 127:        Runtime.expect(Runtime.isWitness(_owner), "invalid witness");
	ALIAS r6 $methodcallexpression530 // 2489
	COPY $_owner r7 // 2489
	PUSH r7 // 2492
	LOAD $methodcallexpression530 "Runtime.IsWitness" // 2494
	EXTCALL $methodcallexpression530 // 2515
	POP $methodcallexpression530 // 2517
	JMPIF $methodcallexpression530 @expect_methodcallexpression527 // 2519
	ALIAS r7 $literalexpression533 // 2523
	LOAD $literalexpression533 "invalid witness" // 2523
	THROW $literalexpression533 // 2542
	@expect_methodcallexpression527: NOP // 2545
@exit_onMint: // 2545
RET // 2546
