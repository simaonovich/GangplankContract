// Line 158:	}
// Line 159:
// Line 160:	// its possible to also add more triggers, custom methods etc
// Line 161:}
// Line 162:
// Line 163:contract gangplank {
// Line 164:	import Random;
// Line 165:	import Hash;
// Line 166:	import Runtime;
// Line 167:	import Token;
// Line 168:	import Map;
// Line 169:	import Decimal;
// Line 170:	import Leaderboard;
// Line 171:
// Line 172:	const PIRATE_BOARD: string = "gangboard"; 	
// Line 173:
// Line 174:	global _owner: address;
// Line 175:	global _playerScores:storage_map<address, number>;

// ********* Initialize Constructor ***********
@entry_constructor: // 0
ALIAS r1 $nexus_protocol_version // 1
// validate protocol version
LOAD r0 "Runtime.Version" // 1
EXTCALL r0 // 20
POP r0 // 22
LOAD $nexus_protocol_version 14 // 24
LT r0 $nexus_protocol_version r0 // 29
JMPNOT r0 @protocol_version_validated // 33
LOAD r0 "Current nexus protocol version should be 14 or more" // 37
THROW r0 // 92
@protocol_version_validated: NOP // 95
ALIAS r1 $_owner // 95
// clearing _playerScores storage
LOAD r0 "_playerScores" // 95
PUSH r0 // 112
LOAD r0 "Map.Clear" // 114
EXTCALL r0 // 127
// Line 176:
// Line 177:	constructor(owner:address)
ALIAS r2 $owner // 129
POP $owner // 129
PUSH $owner // 131
EXTCALL "Address()" // 133
POP $owner // 148
// Line 178:	{
// Line 179:		_owner = owner;
	COPY $owner r3 // 150
	COPY r3 $_owner // 153
// Line 180:		Leaderboard.create(owner, PIRATE_BOARD, 10);
	ALIAS r3 $methodcallexpression785 // 156
	ALIAS r4 $literalexpression791 // 156
	LOAD $literalexpression791 10 // 156
	PUSH $literalexpression791 // 161
	ALIAS r4 $PIRATE_BOARD // 163
	LOAD $PIRATE_BOARD "gangboard" // 163
	PUSH $PIRATE_BOARD // 176
	COPY $owner r4 // 178
	PUSH r4 // 181
	LOAD $methodcallexpression785 "CreateLeaderboard" // 183
	PUSH $methodcallexpression785 // 204
	LOAD $methodcallexpression785 "ranking" // 206
	CTX $methodcallexpression785 $methodcallexpression785 // 217
	SWITCH $methodcallexpression785 // 220
@exit_constructor: // 222
LOAD r2 "Data.Set" // 223
// writing global: _owner
PUSH $_owner // 235
LOAD r0 "_owner" // 237
PUSH r0 // 247
EXTCALL r2 // 249
RET // 251
// Line 181:	}

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 252
ALIAS r1 $dataGet // 253
LOAD $dataGet "Data.Get" // 253
ALIAS r2 $contractName // 265
LOAD $contractName "gangplank" // 265
ALIAS r3 $_owner // 278
// reading global: _owner
LOAD r0 8 // 278
PUSH r0 // 283
LOAD r0 "_owner" // 285
PUSH r0 // 295
PUSH $contractName // 297
EXTCALL $dataGet // 299
POP $_owner // 301
PUSH $_owner // 303
EXTCALL "Address()" // 305
POP $_owner // 320
// Line 182:	
// Line 183:	trigger onUpgrade(from:address) 
ALIAS r1 $from // 322
POP $from // 322
PUSH $from // 324
EXTCALL "Address()" // 326
POP $from // 341
// Line 184:	{
// Line 185:		Runtime.expect(Runtime.isWitness(_owner), "witness failed");
	ALIAS r2 $methodcallexpression800 // 343
	COPY $_owner r4 // 343
	PUSH r4 // 346
	LOAD $methodcallexpression800 "Runtime.IsWitness" // 348
	EXTCALL $methodcallexpression800 // 369
	POP $methodcallexpression800 // 371
	JMPIF $methodcallexpression800 @expect_methodcallexpression797 // 373
	ALIAS r4 $literalexpression803 // 377
	LOAD $literalexpression803 "witness failed" // 377
	THROW $literalexpression803 // 395
	@expect_methodcallexpression797: NOP // 398
// Line 186:		return;
	JMP @exit_onUpgrade // 398
@exit_onUpgrade: // 401
RET // 402
// Line 187:	}

// ********* getAdmin Method ***********
@entry_getAdmin: // 403
ALIAS r1 $dataGet // 404
LOAD $dataGet "Data.Get" // 404
ALIAS r2 $contractName // 416
LOAD $contractName "gangplank" // 416
ALIAS r3 $_owner // 429
// reading global: _owner
LOAD r0 8 // 429
PUSH r0 // 434
LOAD r0 "_owner" // 436
PUSH r0 // 446
PUSH $contractName // 448
EXTCALL $dataGet // 450
POP $_owner // 452
PUSH $_owner // 454
EXTCALL "Address()" // 456
POP $_owner // 471
// Line 188:	
// Line 189:	public getAdmin(): address {
// Line 190:		return _owner;
	COPY $_owner r1 // 473
	PUSH r1 // 476
	JMP @exit_getAdmin // 478
@exit_getAdmin: // 481
RET // 482
// Line 191:	}

// ********* addWinner Method ***********
@entry_addWinner: // 483
ALIAS r1 $dataGet // 484
LOAD $dataGet "Data.Get" // 484
ALIAS r2 $contractName // 496
LOAD $contractName "gangplank" // 496
ALIAS r3 $_owner // 509
// reading global: _owner
LOAD r0 8 // 509
PUSH r0 // 514
LOAD r0 "_owner" // 516
PUSH r0 // 526
PUSH $contractName // 528
EXTCALL $dataGet // 530
POP $_owner // 532
PUSH $_owner // 534
EXTCALL "Address()" // 536
POP $_owner // 551
// Line 192:	
// Line 193:	// calculates the recommend price of a SKULL
// Line 194:	/*public getPrice() : number {
// Line 195:		return ( ) / $SKULL_MAX_SUPPLY;
// Line 196:	}*/
// Line 197:	
// Line 198:	public addWinner(from: address, winnerAddress: address) {
ALIAS r1 $from // 553
POP $from // 553
PUSH $from // 555
EXTCALL "Address()" // 557
POP $from // 572
ALIAS r2 $winnerAddress // 574
POP $winnerAddress // 574
PUSH $winnerAddress // 576
EXTCALL "Address()" // 578
POP $winnerAddress // 593
// Line 199:		Runtime.expect(Runtime.isWitness(_owner), "witness failed");
	ALIAS r4 $methodcallexpression819 // 595
	COPY $_owner r5 // 595
	PUSH r5 // 598
	LOAD $methodcallexpression819 "Runtime.IsWitness" // 600
	EXTCALL $methodcallexpression819 // 621
	POP $methodcallexpression819 // 623
	JMPIF $methodcallexpression819 @expect_methodcallexpression816 // 625
	ALIAS r5 $literalexpression822 // 629
	LOAD $literalexpression822 "witness failed" // 629
	THROW $literalexpression822 // 647
	@expect_methodcallexpression816: NOP // 650
// Line 200:		
// Line 201:		local score:number;
// Line 202:		
// Line 203:		if (_playerScores.has(winnerAddress)) 
	LOAD r4 6 // field type // 650
	PUSH r4 // 655
	COPY $winnerAddress r5 // 657
	PUSH r5 // 660
	ALIAS r5 $literalexpression841 // 662
	LOAD $literalexpression841 "_playerScores" // 662
	PUSH $literalexpression841 // 679
	LOAD $literalexpression841 "gangplank" // contract name // 681
	PUSH $literalexpression841 // 694
	LOAD r4 "Map.Has" // 696
	EXTCALL r4 // 707
	POP r4 // 709
		JMPNOT r4 @else_ifstatement824 // 711
		ALIAS r5 $score // 715
// Line 204:		{
// Line 205:			score = _playerScores.get(winnerAddress);
		LOAD r6 3 // field type // 715
		PUSH r6 // 720
		COPY $winnerAddress r7 // 722
		PUSH r7 // 725
		ALIAS r7 $literalexpression849 // 727
		LOAD $literalexpression849 "_playerScores" // 727
		PUSH $literalexpression849 // 744
		LOAD $literalexpression849 "gangplank" // contract name // 746
		PUSH $literalexpression849 // 759
		LOAD r6 "Map.Get" // 761
		EXTCALL r6 // 772
		POP r6 // 774
		COPY r6 $score // 776
		JMP @then_ifstatement824 // 779
		@else_ifstatement824: NOP // 783
// Line 206:		}
// Line 207:		else 
// Line 208:		{
// Line 209:			score = 0;
		ALIAS r6 $literalexpression853 // 783
		LOAD $literalexpression853 0 // 783
		COPY $literalexpression853 $score // 788
		@then_ifstatement824: NOP // 792
// Line 210:		}
// Line 211:		
// Line 212:		score += 1;	
	COPY $score r4 // 792
	ALIAS r6 $literalexpression855 // 795
	LOAD $literalexpression855 1 // 795
	ADD r4 $literalexpression855 r7 // 800
	COPY r7 $score // 804
// Line 213:		Leaderboard.insert(from, winnerAddress, PIRATE_BOARD, score);
	ALIAS r4 $methodcallexpression859 // 807
	COPY $score r6 // 807
	PUSH r6 // 810
	ALIAS r6 $PIRATE_BOARD // 812
	LOAD $PIRATE_BOARD "gangboard" // 812
	PUSH $PIRATE_BOARD // 825
	COPY $winnerAddress r6 // 827
	PUSH r6 // 830
	COPY $from r6 // 832
	PUSH r6 // 835
	LOAD $methodcallexpression859 "InsertScore" // 837
	PUSH $methodcallexpression859 // 852
	LOAD $methodcallexpression859 "ranking" // 854
	CTX $methodcallexpression859 $methodcallexpression859 // 865
	SWITCH $methodcallexpression859 // 868
// Line 214:		
// Line 215:		local supply: number = Token.getCurrentSupply($SKULL_SYMBOL);
	ALIAS r4 $supply // 870
	ALIAS r6 $methodcallexpression868 // 870
	ALIAS r7 $literalexpression871 // 870
	LOAD $literalexpression871 "SKULL" // 870
	PUSH $literalexpression871 // 879
	LOAD $methodcallexpression868 "Runtime.GetTokenSupply" // 881
	EXTCALL $methodcallexpression868 // 907
	POP $methodcallexpression868 // 909
	COPY $methodcallexpression868 $supply // 911
// Line 216:		
// Line 217:		if (supply < SKULL_MAX_SUPPLY) {
	COPY $supply r6 // 914
	ALIAS r7 $SKULL_MAX_SUPPLY // 917
	LOAD $SKULL_MAX_SUPPLY 1000 // 917
	LT r6 $SKULL_MAX_SUPPLY r8 // 923
		JMPNOT r8 @then_ifstatement874 // 927
// Line 218:			local amount:decimal<$SKULL_DECIMALS> = 1.0;
		ALIAS r6 $amount // 931
		ALIAS r7 $literalexpression879 // 931
		LOAD $literalexpression879 10 // 931
		COPY $literalexpression879 $amount // 936
// Line 219:			Token.mint(from, winnerAddress, $SKULL_SYMBOL, amount);
		ALIAS r7 $methodcallexpression883 // 939
		COPY $amount r9 // 939
		PUSH r9 // 942
		ALIAS r9 $literalexpression891 // 944
		LOAD $literalexpression891 "SKULL" // 944
		PUSH $literalexpression891 // 953
		COPY $winnerAddress r9 // 955
		PUSH r9 // 958
		COPY $from r9 // 960
		PUSH r9 // 963
		LOAD $methodcallexpression883 "Runtime.MintTokens" // 965
		EXTCALL $methodcallexpression883 // 987
		@then_ifstatement874: NOP // 990
@exit_addWinner: // 990
RET // 991
// Line 220:		}
// Line 221:	}

// ********* exchangeBalance Method ***********
@entry_exchangeBalance: // 992
// Line 222:
// Line 223:	// internal call
// Line 224:	private exchangeBalance(from:address, symbol:string, amount:number, available_sum:number) 
ALIAS r1 $from // 993
POP $from // 993
PUSH $from // 995
EXTCALL "Address()" // 997
POP $from // 1012
ALIAS r2 $symbol // 1014
POP $symbol // 1014
ALIAS r3 $amount // 1016
POP $amount // 1016
CAST $amount $amount #Number // 1018
ALIAS r4 $available_sum // 1022
POP $available_sum // 1022
CAST $available_sum $available_sum #Number // 1024
// Line 225:	{
// Line 226:		if (available_sum > 0) 
	COPY $available_sum r5 // 1028
	ALIAS r6 $literalexpression906 // 1031
	LOAD $literalexpression906 0 // 1031
	GT r5 $literalexpression906 r7 // 1036
		JMPNOT r7 @then_ifstatement904 // 1040
// Line 227:		{		
// Line 228:			local obtained_sum:number = (available_sum * amount) / SKULL_MAX_SUPPLY;		
		ALIAS r5 $obtained_sum // 1044
		COPY $available_sum r6 // 1044
		COPY $amount r8 // 1047
		MUL r6 r8 r9 // 1050
		ALIAS r6 $SKULL_MAX_SUPPLY // 1054
		LOAD $SKULL_MAX_SUPPLY 1000 // 1054
		DIV r9 $SKULL_MAX_SUPPLY r8 // 1060
		COPY r8 $obtained_sum // 1064
// Line 229:			Runtime.expect(obtained_sum <= available_sum, "calculation error");		
		COPY $obtained_sum r6 // 1067
		COPY $available_sum r8 // 1070
		LTE r6 r8 r9 // 1073
		JMPIF r9 @expect_methodcallexpression917 // 1077
		ALIAS r6 $literalexpression923 // 1081
		LOAD $literalexpression923 "calculation error" // 1081
		THROW $literalexpression923 // 1102
		@expect_methodcallexpression917: NOP // 1105
// Line 230:			Runtime.expect(obtained_sum > 0, "swap is too small, use more tokens");		
		COPY $obtained_sum r6 // 1105
		ALIAS r8 $literalexpression929 // 1108
		LOAD $literalexpression929 0 // 1108
		GT r6 $literalexpression929 r9 // 1113
		JMPIF r9 @expect_methodcallexpression925 // 1117
		ALIAS r6 $literalexpression931 // 1121
		LOAD $literalexpression931 "swap is too small, use more tokens" // 1121
		THROW $literalexpression931 // 1159
		@expect_methodcallexpression925: NOP // 1162
// Line 231:			Token.transfer($THIS_ADDRESS, from, symbol, obtained_sum);		
		ALIAS r6 $methodcallexpression933 // 1162
		COPY $obtained_sum r8 // 1162
		PUSH r8 // 1165
		COPY $symbol r8 // 1167
		PUSH r8 // 1170
		COPY $from r8 // 1172
		PUSH r8 // 1175
		ALIAS r8 $literalexpression939 // 1177
		LOAD $literalexpression939 0x020022FCE00B1ABEF8FCB3577C0ED081E33B0787551A3673886D6211781798DD9CD3 // 1177
		PUSH $literalexpression939 // 1215
		EXTCALL "Address()" // 1217
		POP $literalexpression939 // 1232
		PUSH $literalexpression939 // 1234
		LOAD $methodcallexpression933 "Runtime.TransferTokens" // 1236
		EXTCALL $methodcallexpression933 // 1262
		@then_ifstatement904: NOP // 1265
@exit_exchangeBalance: // 1265
RET // 1266
// Line 232:		}
// Line 233:	}		

// ********* swapToken Method ***********
@entry_swapToken: // 1267
// Line 234:
// Line 235:	// lets someone swap SKULLs for a percent of the contract balances
// Line 236:	public swapToken(from:address, amount:number)
ALIAS r1 $from // 1268
POP $from // 1268
PUSH $from // 1270
EXTCALL "Address()" // 1272
POP $from // 1287
ALIAS r2 $amount // 1289
POP $amount // 1289
CAST $amount $amount #Number // 1291
// Line 237:	{	
// Line 238:		Runtime.expect(amount > 0, "invalid amount");
	COPY $amount r3 // 1295
	ALIAS r4 $literalexpression954 // 1298
	LOAD $literalexpression954 0 // 1298
	GT r3 $literalexpression954 r5 // 1303
	JMPIF r5 @expect_methodcallexpression950 // 1307
	ALIAS r3 $literalexpression956 // 1311
	LOAD $literalexpression956 "invalid amount" // 1311
	THROW $literalexpression956 // 1329
	@expect_methodcallexpression950: NOP // 1332
// Line 239:		Runtime.expect(amount <= SKULL_MAX_SUPPLY, "invalid amount");
	COPY $amount r3 // 1332
	ALIAS r4 $SKULL_MAX_SUPPLY // 1335
	LOAD $SKULL_MAX_SUPPLY 1000 // 1335
	LTE r3 $SKULL_MAX_SUPPLY r5 // 1341
	JMPIF r5 @expect_methodcallexpression958 // 1345
	ALIAS r3 $literalexpression964 // 1349
	LOAD $literalexpression964 "invalid amount" // 1349
	THROW $literalexpression964 // 1367
	@expect_methodcallexpression958: NOP // 1370
// Line 240:		
// Line 241:		local availableBalance:number = Token.getBalance(from, $SKULL_SYMBOL);
	ALIAS r3 $availableBalance // 1370
	ALIAS r4 $methodcallexpression965 // 1370
	ALIAS r5 $literalexpression970 // 1370
	LOAD $literalexpression970 "SKULL" // 1370
	PUSH $literalexpression970 // 1379
	COPY $from r5 // 1381
	PUSH r5 // 1384
	LOAD $methodcallexpression965 "Runtime.GetBalance" // 1386
	EXTCALL $methodcallexpression965 // 1408
	POP $methodcallexpression965 // 1410
	COPY $methodcallexpression965 $availableBalance // 1412
// Line 242:		Runtime.expect(amount <= availableBalance, "not enough balance");
	COPY $amount r4 // 1415
	COPY $availableBalance r5 // 1418
	LTE r4 r5 r6 // 1421
	JMPIF r6 @expect_methodcallexpression974 // 1425
	ALIAS r4 $literalexpression980 // 1429
	LOAD $literalexpression980 "not enough balance" // 1429
	THROW $literalexpression980 // 1451
	@expect_methodcallexpression974: NOP // 1454
// Line 243:		
// Line 244:		local available_SOUL:number = Token.getBalance($THIS_ADDRESS, "SOUL");
	ALIAS r4 $available_SOUL // 1454
	ALIAS r5 $methodcallexpression981 // 1454
	ALIAS r6 $literalexpression986 // 1454
	LOAD $literalexpression986 "SOUL" // 1454
	PUSH $literalexpression986 // 1462
	ALIAS r6 $literalexpression985 // 1464
	LOAD $literalexpression985 0x020022FCE00B1ABEF8FCB3577C0ED081E33B0787551A3673886D6211781798DD9CD3 // 1464
	PUSH $literalexpression985 // 1502
	EXTCALL "Address()" // 1504
	POP $literalexpression985 // 1519
	PUSH $literalexpression985 // 1521
	LOAD $methodcallexpression981 "Runtime.GetBalance" // 1523
	EXTCALL $methodcallexpression981 // 1545
	POP $methodcallexpression981 // 1547
	COPY $methodcallexpression981 $available_SOUL // 1549
// Line 245:		local available_KCAL:number = Token.getBalance($THIS_ADDRESS, "KCAL");
	ALIAS r5 $available_KCAL // 1552
	ALIAS r6 $methodcallexpression989 // 1552
	ALIAS r7 $literalexpression994 // 1552
	LOAD $literalexpression994 "KCAL" // 1552
	PUSH $literalexpression994 // 1560
	ALIAS r7 $literalexpression993 // 1562
	LOAD $literalexpression993 0x020022FCE00B1ABEF8FCB3577C0ED081E33B0787551A3673886D6211781798DD9CD3 // 1562
	PUSH $literalexpression993 // 1600
	EXTCALL "Address()" // 1602
	POP $literalexpression993 // 1617
	PUSH $literalexpression993 // 1619
	LOAD $methodcallexpression989 "Runtime.GetBalance" // 1621
	EXTCALL $methodcallexpression989 // 1643
	POP $methodcallexpression989 // 1645
	COPY $methodcallexpression989 $available_KCAL // 1647
// Line 246:		
// Line 247:		local available_sum: number = available_KCAL + available_SOUL;
	ALIAS r6 $available_sum // 1650
	COPY $available_KCAL r7 // 1650
	COPY $available_SOUL r8 // 1653
	ADD r7 r8 r9 // 1656
	COPY r9 $available_sum // 1660
// Line 248:		Runtime.expect(available_sum > 0, "pot is empty");		
	COPY $available_sum r7 // 1663
	ALIAS r8 $literalexpression1007 // 1666
	LOAD $literalexpression1007 0 // 1666
	GT r7 $literalexpression1007 r9 // 1671
	JMPIF r9 @expect_methodcallexpression1003 // 1675
	ALIAS r7 $literalexpression1009 // 1679
	LOAD $literalexpression1009 "pot is empty" // 1679
	THROW $literalexpression1009 // 1695
	@expect_methodcallexpression1003: NOP // 1698
// Line 249:		
// Line 250:		this.exchangeBalance(from, "SOUL", amount, available_SOUL);
	ALIAS r7 $methodcallexpression1011 // 1698
	COPY $available_SOUL r8 // 1698
	PUSH r8 // 1701
	COPY $amount r8 // 1703
	PUSH r8 // 1706
	ALIAS r8 $literalexpression1017 // 1708
	LOAD $literalexpression1017 "SOUL" // 1708
	PUSH $literalexpression1017 // 1716
	COPY $from r8 // 1718
	PUSH r8 // 1721
	CALL @entry_exchangeBalance // 1723
// Line 251:		this.exchangeBalance(from, "KCAL", amount, available_KCAL);
	ALIAS r7 $methodcallexpression1021 // 1727
	COPY $available_KCAL r8 // 1727
	PUSH r8 // 1730
	COPY $amount r8 // 1732
	PUSH r8 // 1735
	ALIAS r8 $literalexpression1027 // 1737
	LOAD $literalexpression1027 "KCAL" // 1737
	PUSH $literalexpression1027 // 1745
	COPY $from r8 // 1747
	PUSH r8 // 1750
	CALL @entry_exchangeBalance // 1752
// Line 252:		
// Line 253:		Token.burn(from, $SKULL_SYMBOL, amount);
	ALIAS r7 $methodcallexpression1031 // 1756
	COPY $amount r8 // 1756
	PUSH r8 // 1759
	ALIAS r8 $literalexpression1037 // 1761
	LOAD $literalexpression1037 "SKULL" // 1761
	PUSH $literalexpression1037 // 1770
	COPY $from r8 // 1772
	PUSH r8 // 1775
	LOAD $methodcallexpression1031 "Runtime.BurnTokens" // 1777
	EXTCALL $methodcallexpression1031 // 1799
@exit_swapToken: // 1801
RET // 1802
