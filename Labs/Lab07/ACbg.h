
//{{BLOCK(ACbg)

//======================================================================
//
//	ACbg, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 399 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 12768 + 8192 = 21472
//
//	Time-stamp: 2020-03-02, 11:58:22
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ACBG_H
#define GRIT_ACBG_H

#define ACbgTilesLen 12768
extern const unsigned short ACbgTiles[6384];

#define ACbgMapLen 8192
extern const unsigned short ACbgMap[4096];

#define ACbgPalLen 512
extern const unsigned short ACbgPal[256];

#endif // GRIT_ACBG_H

//}}BLOCK(ACbg)
