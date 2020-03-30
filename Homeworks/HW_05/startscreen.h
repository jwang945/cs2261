
//{{BLOCK(startscreen)

//======================================================================
//
//	startscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 385 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12320 + 2048 = 14880
//
//	Time-stamp: 2020-03-18, 09:52:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCREEN_H
#define GRIT_STARTSCREEN_H

#define startscreenTilesLen 12320
extern const unsigned short startscreenTiles[6160];

#define startscreenMapLen 2048
extern const unsigned short startscreenMap[1024];

#define startscreenPalLen 512
extern const unsigned short startscreenPal[256];

#endif // GRIT_STARTSCREEN_H

//}}BLOCK(startscreen)
