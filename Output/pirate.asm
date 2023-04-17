// Line 1:struct pirate_rom
// Line 2:{
// Line 3:	name:string;
// Line 4:	seed:number;
// Line 5:}
// Line 6:
// Line 7:struct pirate_ram
// Line 8:{
// Line 9:	comment:string;
// Line 10:}
// Line 11:
// Line 12:const SKULL_MAX_SUPPLY : number = 1000;
// Line 13:
// Line 14:token GANG {
// Line 15:	import NFT;
// Line 16:	import Runtime;
// Line 17:	import Map;
// Line 18:	import Storage;
// Line 19:
// Line 20:	global _owner: address;
// Line 21:	global _supply: number;
// Line 22:	global _totalSeries: number;
// Line 23:
// Line 24:	global _seriesNames:storage_map<number, string>;
// Line 25:	global _seriesSeeds:storage_map<number, number>;
// Line 26:	global _seriesCount:storage_map<number, number>;
// Line 27:	global _seriesSupply:storage_map<number, number>;
// Line 28:
// Line 29:	property name: string = "Nachomen";
// Line 30:
// Line 31:	property isBurnable: bool = true;
// Line 32:	property isFinite: bool = true;
// Line 33:	property isFungible: bool = false;
// Line 34:
// Line 35:	property maxSupply: number {
// Line 36:		return Storage.read<number>($THIS_SYMBOL, "_supply");
// Line 37:		//return _supply;
// Line 38:	}
// Line 39:
// Line 40:	nft pirate<pirate_rom, pirate_ram> 
// Line 41:	{

// ********* getName Property ***********
@entry_getName: // 0
POP r1 // get nft tokenID from stack // 1
// reading nft data
LOAD r0 "ROM" // 3
PUSH r0 // fields // 10
PUSH r1 // tokenID // 12
LOAD r0 "GANG" // 14
PUSH r0 // symbol // 22
LOAD r0 "Runtime.ReadToken" // 24
EXTCALL r0 // 45
POP r2 // 47
UNPACK r2 r2 // 49
ALIAS r3 $_ROM // 52
LOAD r0 "ROM" // 52
GET r2 $_ROM r0 // 59
UNPACK $_ROM $_ROM // 63
// Line 42:	
// Line 43:		property name: string {
// Line 44:			return _ROM.name;
	COPY $_ROM r1 // 66
	LOAD r2 "name" // 69
	GET r1 r1 r2 // 77
	PUSH r1 // 81
	JMP @exit_getName // 83
@exit_getName: // 86
RET // 87
// Line 45:		}

// ********* getDescription Property ***********
@entry_getDescription: // 88
POP r1 // get nft tokenID from stack // 89
// Line 46:
// Line 47:		property description: string {
// Line 48:			return "Arrgg, pirate!";
	ALIAS r1 $literalexpression224 // 91
	LOAD $literalexpression224 "Arrgg, pirate!" // 91
	PUSH $literalexpression224 // 109
	JMP @exit_getDescription // 111
@exit_getDescription: // 114
RET // 115
// Line 49:		}

// ********* getImageURL Property ***********
@entry_getImageURL: // 116
POP r1 // get nft tokenID from stack // 117
// reading nft data
LOAD r0 "seriesID" // 119
PUSH r0 // fields // 131
PUSH r1 // tokenID // 133
LOAD r0 "GANG" // 135
PUSH r0 // symbol // 143
LOAD r0 "Runtime.ReadToken" // 145
EXTCALL r0 // 166
POP r2 // 168
UNPACK r2 r2 // 170
ALIAS r3 $_seriesID // 173
LOAD r0 "seriesID" // 173
GET r2 $_seriesID r0 // 185
// Line 50:
// Line 51:		property imageURL: string {
// Line 52:			return "https://gangplank.io/img/pirate_"+ _seriesID + ".png";
	ALIAS r1 $literalexpression228 // 189
	LOAD $literalexpression228 "https://gangplank.io/img/pirate_" // 189
	COPY $_seriesID r2 // 225
	CAST r2 r2 #String // 228
	ADD $literalexpression228 r2 r4 // 232
	ALIAS r1 $literalexpression232 // 236
	LOAD $literalexpression232 ".png" // 236
	ADD r4 $literalexpression232 r2 // 244
	PUSH r2 // 248
	JMP @exit_getImageURL // 250
@exit_getImageURL: // 253
RET // 254
// Line 53:		}

// ********* getInfoURL Property ***********
@entry_getInfoURL: // 255
POP r1 // get nft tokenID from stack // 256
ALIAS r2 $_tokenID // 258
COPY r1 $_tokenID // tokenID // 258
// Line 54:
// Line 55:		property infoURL: string {
// Line 56:			return "https://gangplank.io/api/pirate/"+ _tokenID;
	ALIAS r1 $literalexpression237 // 261
	LOAD $literalexpression237 "https://gangplank.io/api/pirate/" // 261
	COPY $_tokenID r3 // 297
	CAST r3 r3 #String // 300
	ADD $literalexpression237 r3 r4 // 304
	PUSH r4 // 308
	JMP @exit_getInfoURL // 310
@exit_getInfoURL: // 313
RET // 314
