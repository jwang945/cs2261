
//{{BLOCK(house)

//======================================================================
//
//	house, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 56 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1792 + 2048 = 4352
//
//	Time-stamp: 2017-11-16, 14:41:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

const unsigned short houseTiles[896] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x2222,0x2222,0x2222,0x2222,0x1122,0x2121,0x1122,0x2111,
	0x2122,0x2111,0x1122,0x2111,0x2222,0x2211,0x2222,0x2222,
	0x3311,0x1333,0x3331,0x3333,0x3331,0x3333,0x3331,0x3333,
	0x3331,0x3333,0x3331,0x3333,0x3311,0x1331,0x1111,0x1111,
	0x6699,0x9666,0x6669,0x6666,0x6669,0x6666,0x6669,0x6666,
	0x6669,0x6666,0x6669,0x6666,0x6699,0x9669,0x9999,0x9999,

	0xAA22,0xAAAA,0xEAA2,0xEEEE,0xEEA2,0x2222,0x22EA,0x2222,
	0xEEEA,0x2EE2,0x2EAA,0x2EE2,0x22EA,0x22E2,0x2EEA,0x2222,
	0xAAEA,0xAE2E,0xEEAE,0xEAAA,0xEEEE,0xEEEE,0xE2E2,0x22EE,
	0x2222,0x222E,0xEE22,0x2222,0xEE23,0x2222,0x2222,0x2222,
	0xEEEA,0x2222,0xEAEA,0x2222,0x2EAA,0x2222,0x2EEA,0xEEE2,
	0x2EEA,0xEEEE,0xEEAA,0xEEEE,0xEAAA,0xEAAE,0xAAAA,0xAAAA,
	0x2222,0x2222,0x22EE,0x2232,0x22EE,0x2222,0xE222,0xE222,
	0xE22E,0xEE2E,0xEEEE,0xEEEE,0xAEEE,0xEEEE,0xAAEA,0xAEEA,

	0x2222,0x2222,0xE222,0x322E,0xE222,0x222E,0x2222,0x2222,
	0x222E,0x2222,0x2EEE,0x2EE2,0x2EEE,0x2EE2,0xEEEA,0x2222,
	0x2EE2,0xAEEE,0x2EE2,0xAEE2,0x222E,0xAAE2,0xE22E,0xAAEE,
	0x2222,0xAAEE,0x2322,0xAAE2,0x2222,0xAEEE,0xE222,0xAEEE,
	0xAAAA,0xAAAA,0x1A2A,0x2AA2,0x2A2A,0x1A22,0x2AAA,0x2AAA,
	0xA22A,0xA211,0xA2AE,0xA222,0xEAE2,0xEAAA,0x2E22,0x2EEE,
	0xAAAA,0xAAAA,0x1A21,0x2AA2,0x2A22,0x1A22,0x2AA2,0x2AAA,
	0xA22A,0xA211,0xA2A2,0xA222,0xEAEA,0xEAAA,0x2E2E,0x2EEE,

	0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x2222,0x2AAA,0xA222,0xA222,0xA222,0xA222,0xAAA2,0xA22A,
	0x222A,0x2AA2,0x222A,0x2A22,0x22AA,0x2A22,0xAAA2,0x2AAA,
	0xA222,0xAAAA,0xCA22,0xCCCC,0xCCA2,0xAABB,0xBCAA,0x55AB,
	0xBBCA,0x555A,0xABCA,0x5555,0xABCA,0x5555,0xABCA,0x5555,
	0xAAAA,0xAAAA,0xCCBB,0xBBBC,0xBB4A,0xAA4B,0xAAA5,0x55AA,
	0x7777,0x7777,0x5555,0x7555,0x5555,0x5555,0x5555,0x5555,

	0xAAAA,0xAAAA,0xCCBB,0xBBBC,0xBB4A,0xAA4B,0xAAA5,0x55AA,
	0x7777,0x7777,0xCC77,0xCCCC,0xCCC7,0x7777,0x7CC7,0x7777,
	0xAAAA,0xAAAA,0xCCBB,0xBBBC,0xBB4A,0xAA4B,0xAAA5,0x55AA,
	0x7777,0x7777,0xCCCC,0xCCCC,0x7777,0x7777,0x7777,0x7777,
	0x22AA,0xAA22,0x222A,0x2AA2,0x222A,0x22AA,0xAAAA,0x22AA,
	0x2AA2,0x22A2,0x2A22,0x2AA2,0xAA22,0xAAAA,0x2222,0xA222,
	0xBBCA,0x555A,0xBBCA,0x55AC,0xBCCA,0x55AB,0xBCCA,0x55AB,
	0xBCCA,0x55AB,0xBBCA,0x55AC,0xBBCA,0x555A,0xBBCA,0x555A,

	0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,
	0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,
	0x7CC7,0x7777,0x7CC7,0x7777,0x7CC7,0x7777,0x7CC7,0x7777,
	0x7CC7,0x7777,0x7CC7,0x7777,0x7CC7,0x7777,0x7CC7,0x7777,
	0xAA77,0x77AA,0xC4A7,0x7A4C,0x4C4A,0xA4C4,0x4C4A,0xA4C4,
	0xCB4A,0xA4BC,0xBC4A,0xA4CB,0x44A7,0x7A44,0xAA77,0x77AA,
	0x7777,0x7777,0x7777,0x7777,0x7777,0x7777,0x7777,0x7777,
	0x7777,0x7777,0x7777,0x7777,0x7777,0x7777,0x7777,0x7777,

	0x2222,0x2222,0x2288,0x2222,0x2288,0x2222,0x8888,0x2228,
	0x8888,0x2288,0x8888,0x2288,0x8888,0x8888,0x8888,0x8888,
	0x8888,0x8888,0x8888,0x8888,0x8888,0x8888,0x8888,0x8888,
	0x8888,0x8888,0x8888,0x2888,0x8888,0x2888,0x8888,0x2888,
	0x5555,0x5555,0x5555,0x7555,0x5555,0x7755,0x5555,0x7755,
	0x5555,0x7775,0x5555,0x7775,0x5555,0x7777,0x5555,0x5777,
	0xCCC7,0x7777,0xCCC7,0x777C,0xCC77,0xCCCC,0xC777,0xCCCC,
	0x7777,0x7777,0x7777,0x7777,0x5555,0x5555,0x5555,0x5555,

	0x7777,0x7777,0x7777,0x7777,0xCCCC,0xCCCC,0xCCCC,0xCCCC,
	0x7777,0x7777,0x7777,0x7777,0x5555,0x5555,0x5555,0x5555,
	0x7555,0x5577,0x7555,0x5577,0x7755,0x5557,0x7755,0x5555,
	0x7775,0x5555,0x5775,0x5555,0x5777,0x5555,0x5577,0x5555,
	0xBCCA,0x755A,0xBCCA,0x75AC,0xBCCA,0x75AB,0xBCCA,0x77AB,
	0xBCCA,0x77AB,0xBCCA,0x57AC,0xBCCA,0x55AC,0xBCCA,0x5ACB,
	0x5577,0x5555,0x5557,0x5555,0x5557,0x5555,0x5555,0x5555,
	0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,

	0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,
	0x5555,0x5555,0x5555,0xAAA5,0x5555,0xCCAA,0xA555,0xBCC4,
	0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,0x5555,
	0x5555,0x5555,0xAAAA,0xAAAA,0xCCCC,0xCCCC,0xBBBB,0xBBCC,
	0xCC4A,0xACBB,0xC44A,0xCBBC,0x44AA,0xBBCC,0x4AAA,0xBCC4,
	0xAA4A,0xCC44,0xA4CA,0x444A,0x4CCA,0xAAAA,0xCCCA,0xAA44,
	0x5AAA,0xAAA5,0xACBB,0xBBCA,0xCBBB,0xBBBC,0xBBBC,0xCCBB,
	0xCCCC,0xCCCC,0x4444,0x4444,0xAAAA,0xAAAA,0xAAAA,0xAAAA,

	0x4AAA,0xBBBC,0xC4AA,0xBBCB,0xBC4A,0xBBCB,0xBBCA,0x66CB,
	0xBBCA,0xCCC6,0x6BCA,0xCC4C,0xC6CA,0xC4CC,0xCBCA,0x4CCC,
	0xCBBB,0xBBBB,0xBCBB,0xCCBB,0xBBCB,0xBBCB,0x66C6,0x66C6,
	0xC44C,0x44CC,0x44CC,0xCCCC,0x444C,0x4444,0xAAAA,0xAAAA,
	0xBBCA,0x4CCB,0xBB4A,0x6BBB,0xB44A,0x6BBB,0xB44A,0x6BBB,
	0x4C4A,0x6BBB,0xCC4A,0x6BB4,0xCC4A,0x6BB4,0xCC4A,0xBB4C,
	0xA444,0xBCBC,0xABBB,0xCBBC,0xA666,0x666C,0xA6CC,0xAAAA,
	0x66CC,0xAAAA,0x6666,0x444A,0x6666,0x4CCA,0xCCC6,0x4CCA,

	0xCBCB,0xBCBC,0xBCBB,0xBBCB,0x666B,0xB666,0xAAAA,0xAAAA,
	0x4A4A,0xA4A4,0xA4AA,0xAA4A,0xA4AA,0xAA4A,0x4A4A,0xA4A4,
	0xCC4A,0xACCC,0xC44A,0xA4CC,0x444A,0xA4CC,0x4C4A,0xA444,
	0xCC4A,0xA444,0xCC4A,0xA4CC,0xC44A,0xA4CC,0x44A4,0xA4CC,
	0xAAAA,0xFFFF,0xF4AA,0xF33F,0xFC4A,0x3FF3,0xFCC4,0x3FF3,
	0xFCC4,0x3FFF,0x4CC4,0xF3FC,0x4CC4,0xF3FF,0xDCC4,0xFF3F,
	0xFFFA,0xAFFF,0x33FF,0xAF33,0xFFFF,0xAF3F,0xCCCF,0xDF3F,
	0xFAAF,0xDF3F,0xFAAF,0x4FF3,0xF9AA,0x4CF3,0xFFBA,0x4CF3,

	0xC444,0xACCC,0xCCCC,0xA4CC,0xCCCC,0xA44C,0xCCCC,0xA44C,
	0xCCCC,0xA444,0x4CCC,0xA444,0x4CCC,0xA444,0x444C,0xA444,
	0xCCCA,0x44CC,0xC4BA,0xBCCC,0x4B4A,0xBCCC,0xB4A2,0xBCC4,
	0x4A22,0xCC4B,0xA222,0x44B4,0x2222,0xBB4A,0x2222,0xAAA2,
	0xBBBC,0x4CCA,0xBBBB,0x444A,0xBBBB,0x666A,0xBBBC,0x444A,
	0xCCCC,0xAAAA,0x4444,0x4444,0xBBBB,0xBBBB,0xAAAA,0xAAAA,
	0xAAAA,0xAAAA,0xBBBB,0xBBBB,0x6666,0x6666,0x4444,0x4444,
	0xAAAA,0xAAAA,0x4444,0x4444,0xBBBB,0xBBBB,0xAAAA,0xAAAA,

	0x4AA4,0xA444,0xAAA4,0xA444,0xACAA,0xA4CC,0xAC4A,0xA4CC,
	0xAC4A,0xA4CC,0xAC4A,0xA444,0xAC4A,0xA444,0xCA4A,0xA4CC,
	0xFCC4,0x9F3F,0xFCC4,0xDFF3,0xFCCA,0xFFF3,0xFCCA,0x3333,
	0xFCCA,0xFFFF,0x4CCA,0xDCCC,0x444A,0x4444,0xAAAA,0xAAAA,
	0x3FCB,0x4CFF,0x3FC4,0x44AF,0x3FCF,0xA4CF,0x3FCF,0xA4AF,
	0xFFCF,0xA4AF,0xAAC4,0xA4AA,0x4444,0xA444,0xAAAA,0xAAAA,
	0x4444,0xAA44,0x4444,0xACA4,0x4444,0xA4CA,0xA444,0xAA4C,
	0xCA44,0xAAA4,0x4CAA,0xAAAA,0xA4CC,0xAAAA,0xAAAA,0xAAAA,

	0x444A,0xA444,0x444A,0xA444,0x444A,0xA444,0xAAA2,0x2AAA,
	0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,0x2222,
	0x2222,0x2222,0x2222,0x2222,0x1222,0x1111,0x1122,0x2112,
	0x1122,0x1122,0x1122,0x1111,0x1222,0x2112,0x2222,0x2222,
	0xAA22,0x22AA,0x99A2,0x2A99,0xC99A,0xA99C,0x9C9A,0xA9C9,
	0x9C9A,0xA9C9,0xC99A,0xA99C,0x99CA,0xAC99,0xCCAA,0xAACC,
	0xAADA,0xADAA,0xCCDA,0xADDD,0xCCDA,0xADDD,0xCCDA,0xADCD,
	0xCDDA,0xADCD,0xCDAA,0xAACD,0xAAA2,0x2AAA,0x2222,0x2222,
};

const unsigned short houseMap[1024] __attribute__((aligned(4)))=
{
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
	0x0001,0x0001,0x0002,0x0802,0x0003,0x0803,0x0002,0x0802,
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
	0x0001,0x0001,0x0002,0x0802,0x0003,0x0803,0x0002,0x0802,
	0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,
	0x0402,0x0C02,0x0402,0x0C02,0x0403,0x0C03,0x0402,0x0C02,
	0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,
	0x0402,0x0C02,0x0402,0x0C02,0x0403,0x0C03,0x0402,0x0C02,

	0x0003,0x0803,0x0003,0x0803,0x0003,0x0803,0x0003,0x0803,
	0x0003,0x0803,0x0003,0x0803,0x0003,0x0803,0x0003,0x0803,
	0x0003,0x0803,0x0003,0x0803,0x0003,0x0803,0x0003,0x0803,
	0x0003,0x0803,0x0003,0x0803,0x0003,0x0803,0x0002,0x0802,
	0x0403,0x0C03,0x0403,0x0C03,0x0403,0x0C03,0x0403,0x0C03,
	0x0403,0x0C03,0x0403,0x0C03,0x0403,0x0C03,0x0403,0x0C03,
	0x0403,0x0C03,0x0403,0x0C03,0x0403,0x0C03,0x0403,0x0C03,
	0x0403,0x0C03,0x0403,0x0C03,0x0403,0x0C03,0x0402,0x0C02,

	0x0002,0x0802,0x0003,0x0803,0x0002,0x0802,0x0002,0x0802,
	0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0402,0x0C02,0x0403,0x0C03,0x0402,0x0C02,0x0004,0x0005,
	0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,
	0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,
	0x0005,0x0404,0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x0006,0x0007,
	0x0007,0x0007,0x0007,0x0007,0x0007,0x0007,0x0007,0x0007,
	0x0007,0x0007,0x0007,0x0007,0x0007,0x0007,0x0007,0x0007,
	0x0008,0x0009,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x000A,0x000B,
	0x000B,0x000B,0x000B,0x000B,0x000B,0x000B,0x000B,0x000B,
	0x000B,0x000B,0x000B,0x000B,0x000B,0x000B,0x000B,0x000B,
	0x0409,0x0009,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x000C,0x000C,
	0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,
	0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,
	0x0409,0x0009,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x000C,0x000C,
	0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,
	0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,
	0x0409,0x0009,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x000D,0x040D,
	0x000D,0x040D,0x000E,0x000F,0x0010,0x0011,0x0011,0x0011,
	0x0011,0x0011,0x0011,0x0410,0x040F,0x040E,0x000C,0x000C,
	0x0409,0x0009,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x0012,0x0412,
	0x0012,0x0412,0x0013,0x0014,0x0015,0x0016,0x0017,0x0017,
	0x0017,0x0017,0x0016,0x0415,0x0014,0x0413,0x0018,0x000C,
	0x0409,0x0009,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x000D,0x040D,
	0x000D,0x040D,0x0013,0x0014,0x0015,0x0017,0x0017,0x0017,
	0x0017,0x0017,0x0017,0x0415,0x0014,0x0413,0x0019,0x000C,
	0x0409,0x0009,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x0012,0x0412,
	0x0012,0x0412,0x0013,0x0014,0x0015,0x0016,0x0017,0x0017,
	0x0017,0x0017,0x0016,0x0415,0x0014,0x0413,0x0019,0x000C,
	0x0409,0x0009,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x000D,0x040D,
	0x000D,0x040D,0x0013,0x001A,0x001B,0x001C,0x001C,0x001C,
	0x001C,0x001C,0x001C,0x041B,0x041A,0x0413,0x0019,0x000C,
	0x0409,0x0009,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x0012,0x0412,
	0x0012,0x0412,0x0013,0x001D,0x0014,0x0014,0x0014,0x0014,
	0x0014,0x0014,0x0014,0x0014,0x041D,0x0413,0x0019,0x000C,
	0x0409,0x0009,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x000D,0x040D,
	0x000D,0x040D,0x001E,0x001F,0x0014,0x0014,0x0020,0x0021,
	0x0421,0x0420,0x0014,0x0014,0x041F,0x041E,0x0019,0x000C,
	0x0409,0x0009,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x0012,0x0412,
	0x0012,0x0412,0x0022,0x0023,0x0023,0x0023,0x0024,0x0025,
	0x0425,0x0424,0x0023,0x0023,0x0023,0x0422,0x0019,0x000C,
	0x0409,0x0009,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x000D,0x040D,
	0x000D,0x040D,0x0026,0x0027,0x0028,0x0427,0x0029,0x002A,
	0x002B,0x0429,0x0027,0x0028,0x0427,0x002C,0x0019,0x000C,
	0x0409,0x0009,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x0012,0x0412,
	0x0012,0x0412,0x002D,0x002E,0x002F,0x042E,0x0030,0x0031,
	0x0032,0x0430,0x002E,0x002F,0x042E,0x0033,0x0818,0x000C,
	0x0409,0x0009,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x000C,0x000C,
	0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x0034,0x0035,
	0x0435,0x0034,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,
	0x0409,0x0009,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x000C,0x000C,
	0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x0035,0x0435,
	0x0035,0x0435,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,
	0x0409,0x0009,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x000C,0x000C,
	0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,
	0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,0x000C,
	0x0409,0x0009,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x0004,0x0005,
	0x0005,0x0005,0x0005,0x0404,0x000C,0x000C,0x000C,0x000C,
	0x000C,0x000C,0x000C,0x000C,0x0004,0x0005,0x0005,0x0005,
	0x0808,0x0009,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0001,0x0006,0x0007,
	0x0007,0x0007,0x0007,0x0406,0x0036,0x0036,0x000C,0x000C,
	0x000C,0x000C,0x0036,0x0036,0x0006,0x0007,0x0007,0x0007,
	0x0007,0x0406,0x0001,0x0802,0x0002,0x0802,0x0002,0x0001,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0001,0x000A,0x000B,
	0x000B,0x000B,0x000B,0x040A,0x0037,0x0037,0x000C,0x000C,
	0x000C,0x000C,0x0037,0x0037,0x000A,0x000B,0x000B,0x000B,
	0x000B,0x040A,0x0001,0x0C02,0x0402,0x0C02,0x0402,0x0001,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0802,0x0001,0x0001,
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
	0x0001,0x0001,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0C02,0x0402,0x0C02,
	0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,
	0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,
	0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0802,0x0002,0x0802,
	0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0C02,0x0402,0x0C02,
	0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,
	0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,
	0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,0x0402,0x0C02,

	0x0001,0x0802,0x0003,0x0803,0x0002,0x0802,0x0002,0x0802,
	0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,0x0002,0x0802,
	0x0001,0x0C02,0x0403,0x0C03,0x0402,0x0C02,0x0004,0x0005,
	0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0404,
	0x0001,0x0001,0x0001,0x0001,0x0004,0x0005,0x0005,0x0005,
	0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,
};

const unsigned short housePal[256] __attribute__((aligned(4)))=
{
	0x7C1F,0x4ACE,0x2648,0x5794,0x1D8F,0x3125,0x46B6,0x45A8,
	0x1565,0x3633,0x14A4,0x3677,0x25D2,0x152C,0x19C6,0x6000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

//}}BLOCK(house)