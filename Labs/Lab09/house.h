
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

#ifndef GRIT_HOUSE_H
#define GRIT_HOUSE_H

#define houseTilesLen 1792
extern const unsigned short houseTiles[896];

#define houseMapLen 2048
extern const unsigned short houseMap[1024];

#define housePalLen 512
extern const unsigned short housePal[256];

#endif // GRIT_HOUSE_H

//}}BLOCK(house)
