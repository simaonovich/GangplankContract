// Line 128:    }
// Line 129:}
// Line 130:
// Line 131:token SKULL { // this defines the token symbol as SKULL
// Line 132:	import Runtime;

// ********* getName Property ***********
@entry_getName: // 0
// Line 133:
// Line 134:	property name:string = "Pirate Skull";
	ALIAS r1 $literalexpression589 // 1
	LOAD $literalexpression589 "Pirate Skull" // 1
	PUSH $literalexpression589 // 17
	JMP @exit_getName // 19
@exit_getName: // 22
RET // 23

// ********* getDecimals Property ***********
@entry_getDecimals: // 24
// Line 135:	property decimals:number = 8; // required only if isDivisible is true
	ALIAS r1 $literalexpression593 // 25
	LOAD $literalexpression593 8 // 25
	PUSH $literalexpression593 // 30
	JMP @exit_getDecimals // 32
@exit_getDecimals: // 35
RET // 36

// ********* isFungible Property ***********
@entry_isFungible: // 37
// Line 136:
// Line 137:	property isFungible: bool = true;
	ALIAS r1 $literalexpression597 // 38
	LOAD $literalexpression597 true // 38
	PUSH $literalexpression597 // 43
	JMP @exit_isFungible // 45
@exit_isFungible: // 48
RET // 49

// ********* isDivisible Property ***********
@entry_isDivisible: // 50
// Line 138:
// Line 139:	property isDivisible: bool = true;
	ALIAS r1 $literalexpression601 // 51
	LOAD $literalexpression601 true // 51
	PUSH $literalexpression601 // 56
	JMP @exit_isDivisible // 58
@exit_isDivisible: // 61
RET // 62

// ********* isTransferable Property ***********
@entry_isTransferable: // 63
// Line 140:
// Line 141:	property isTransferable: bool = true;
	ALIAS r1 $literalexpression605 // 64
	LOAD $literalexpression605 true // 64
	PUSH $literalexpression605 // 69
	JMP @exit_isTransferable // 71
@exit_isTransferable: // 74
RET // 75

// ********* isBurnable Property ***********
@entry_isBurnable: // 76
// Line 142:	property isBurnable: bool = true;
	ALIAS r1 $literalexpression609 // 77
	LOAD $literalexpression609 true // 77
	PUSH $literalexpression609 // 82
	JMP @exit_isBurnable // 84
@exit_isBurnable: // 87
RET // 88

// ********* isFinite Property ***********
@entry_isFinite: // 89
// Line 143:
// Line 144:	property isFinite: bool = true;
	ALIAS r1 $literalexpression613 // 90
	LOAD $literalexpression613 true // 90
	PUSH $literalexpression613 // 95
	JMP @exit_isFinite // 97
@exit_isFinite: // 100
RET // 101

// ********* getMaxSupply Property ***********
@entry_getMaxSupply: // 102
// Line 145:	property maxSupply: number = SKULL_MAX_SUPPLY;
	ALIAS r1 $SKULL_MAX_SUPPLY // 103
	LOAD $SKULL_MAX_SUPPLY 1000 // 103
	PUSH $SKULL_MAX_SUPPLY // 109
	JMP @exit_getMaxSupply // 111
@exit_getMaxSupply: // 114
RET // 115
// Line 146:
// Line 147:	global _admin: address;

// ********* Initialize Constructor ***********
@entry_constructor: // 116
ALIAS r1 $nexus_protocol_version // 117
// validate protocol version
LOAD r0 "Runtime.Version" // 117
EXTCALL r0 // 136
POP r0 // 138
LOAD $nexus_protocol_version 14 // 140
LT r0 $nexus_protocol_version r0 // 145
JMPNOT r0 @protocol_version_validated // 149
LOAD r0 "Current nexus protocol version should be 14 or more" // 153
THROW r0 // 208
@protocol_version_validated: NOP // 211
ALIAS r1 $_admin // 211
// Line 148:
// Line 149:	constructor(owner:address)	{
ALIAS r2 $owner // 211
POP $owner // 211
PUSH $owner // 213
EXTCALL "Address()" // 215
POP $owner // 230
// Line 150:		_admin = owner;
	COPY $owner r3 // 232
	COPY r3 $_admin // 235
@exit_constructor: // 238
LOAD r2 "Data.Set" // 239
// writing global: _admin
PUSH $_admin // 251
LOAD r0 "_admin" // 253
PUSH r0 // 263
EXTCALL r2 // 265
RET // 267
// Line 151:	}

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 268
ALIAS r1 $dataGet // 269
LOAD $dataGet "Data.Get" // 269
ALIAS r2 $contractName // 281
LOAD $contractName "SKULL" // 281
ALIAS r3 $_admin // 290
// reading global: _admin
LOAD r0 8 // 290
PUSH r0 // 295
LOAD r0 "_admin" // 297
PUSH r0 // 307
PUSH $contractName // 309
EXTCALL $dataGet // 311
POP $_admin // 313
PUSH $_admin // 315
EXTCALL "Address()" // 317
POP $_admin // 332
// Line 152:
// Line 153:	// allows the token to be upgraded later, remove this trigger if you want a imutable fungible token
// Line 154:	trigger onUpgrade(from:address)
ALIAS r1 $from // 334
POP $from // 334
PUSH $from // 336
EXTCALL "Address()" // 338
POP $from // 353
// Line 155:	{
// Line 156:		Runtime.expect(Runtime.isWitness(_admin), "witness failed");
	ALIAS r2 $methodcallexpression635 // 355
	COPY $_admin r4 // 355
	PUSH r4 // 358
	LOAD $methodcallexpression635 "Runtime.IsWitness" // 360
	EXTCALL $methodcallexpression635 // 381
	POP $methodcallexpression635 // 383
	JMPIF $methodcallexpression635 @expect_methodcallexpression632 // 385
	ALIAS r4 $literalexpression638 // 389
	LOAD $literalexpression638 "witness failed" // 389
	THROW $literalexpression638 // 407
	@expect_methodcallexpression632: NOP // 410
// Line 157:		return;
	JMP @exit_onUpgrade // 410
@exit_onUpgrade: // 413
RET // 414
