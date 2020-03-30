
//{{BLOCK(mainscreen)

//======================================================================
//
//	mainscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 54 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1728 + 2048 = 4288
//
//	Time-stamp: 2020-03-18, 10:15:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAINSCREEN_H
#define GRIT_MAINSCREEN_H

#define mainscreenTilesLen 1728
extern const unsigned short mainscreenTiles[864];

#define mainscreenMapLen 2048
extern const unsigned short mainscreenMap[1024];

#define mainscreenPalLen 512
extern const unsigned short mainscreenPal[256];

#endif // GRIT_MAINSCREEN_H

//}}BLOCK(mainscreen)
