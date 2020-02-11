#!/bin/sh
# This is a shell archive, meaning:
# 1. Remove everything above the #!/bin/sh line.
# 2. Save the resulting text in a file.
# 3. Execute the file with /bin/sh (not csh) to create the files:
#	README
#	hershey.doc
#	hershey.f77
#	hershey.c
#	cyrilc.hmp
#	gothgbt.hmp
#	gothgrt.hmp
#	gothitt.hmp
#	greekc.hmp
#	greekcs.hmp
#	greekp.hmp
#	greeks.hmp
#	italicc.hmp
#	italiccs.hmp
#	italict.hmp
#	romanc.hmp
#	romancs.hmp
#	romand.hmp
#	romanp.hmp
#	romans.hmp
#	romant.hmp
#	scriptc.hmp
#	scripts.hmp
# This archive created: Thu Mar 27 17:50:24 1986
export PATH; PATH=/bin:$PATH
if test -f 'README'
then
	echo shar: over-writing existing file "'README'"
fi
cat << \SHAR_EOF > 'README'
This distribution is made possible through the collective encouragement
of the Usenet Font Consortium, a mailing list that sprang to life to get
this accomplished and that will now most likely disappear into the mists
of time... Thanks are especially due to Jim Hurt, who provided the packed
font data for the distribution, along with a lot of other help.

This file describes the Hershey Fonts in general, along with a description of
the other files in this distribution and a simple re-distribution restriction.

USE RESTRICTION:
	This distribution of the Hershey Fonts may be used by anyone for
	any purpose, commercial or otherwise, providing that:
		1. The following acknowledgements must be distributed with
			the font data:
			- The Hershey Fonts were originally created by Dr.
				A. V. Hershey while working at the U. S.
				National Bureau of Standards.
			- The format of the Font data in this distribution
				was originally created by
					James Hurt
					Cognition, Inc.
					900 Technology Park Drive
					Billerica, MA 01821
					(mit-eddie!ci-dandelion!hurt)
		2. The font data in this distribution may be converted into
			any other format *EXCEPT* the format distributed by
			the U.S. NTIS (which organization holds the rights
			to the distribution and use of the font data in that
			particular format). Not that anybody would really
			*want* to use their format... each point is described
			in eight bytes as "xxx yyy:", where xxx and yyy are
			the coordinate values as ASCII numbers.

*PLEASE* be reassured: The legal implications of NTIS' attempt to control
a particular form of the Hershey Fonts *are* troubling. HOWEVER: We have
been endlessly and repeatedly assured by NTIS that they do not care what
we do with our version of the font data, they do not want to know about it,
they understand that we are distributing this information all over the world,
etc etc etc... but because it isn't in their *exact* distribution format, they
just don't care!!! So go ahead and use the data with a clear conscience! (If
you feel bad about it, take a smaller deduction for something on your taxes
next week...)

The Hershey Fonts:
	- are a set of more than 2000 glyph (symbol) descriptions in vector 
		( <x,y> point-to-point ) format
	- can be grouped as almost 20 'occidental' (english, greek,
		cyrillic) fonts, 3 or more 'oriental' (Kanji, Hiragana,
		and Katakana) fonts, and a few hundred miscellaneous
		symbols (mathematical, musical, cartographic, etc etc)
	- are suitable for typographic quality output on a vector device
		(such as a plotter) when used at an appropriate scale.
	- were digitized by Dr. A. V. Hershey while working for the U.S.
		Government National Bureau of Standards (NBS).
	- are in the public domain, with a few caveats:
		- They are available from NTIS (National Technical Info.
			Service) in a computer-readable from which is *not*
			in the public domain. This format is described in
			a hardcopy publication "Tables of Coordinates for
			Hershey's Repertory of Occidental Type Fonts and
			Graphic Symbols" available from NTIS for less than
			$20 US (phone number +1 703 487 4763).
		- NTIS does not care about and doesn't want to know about
			what happens to Hershey Font data that is not
			distributed in their exact format.
		- This distribution is not in the NTIS format, and thus is
			only subject to the simple restriction described
			at the top of this file.

Hard Copy samples of the Hershey Fonts are best obtained by purchasing the
book described above from NTIS. It contains a sample of all of the Occidental
symbols (but none of the Oriental symbols).

This distribution:
	- contains
		* a complete copy of the Font data using the original
			glyph-numbering sequence
		* a set of translation tables that could be used to generate
			ASCII-sequence fonts in various typestyles
		* a couple of sample programs in C and Fortran that are
			capable of parsing the font data and displaying it
			on a graphic device (we recommend that if you
			wish to write programs using the fonts, you should
			hack up one of these until it works on your system)
			
	- consists of the following files...
		hershey.doc - details of the font data format, typestyles and
				symbols included, etc.
		hersh.oc[1-4] - The Occidental font data (these files can
					be catenated into one large database)
		hersh.or[1-4] - The Oriental font data (likewise here)
		*.hmp - Occidental font map files. Each file is a translation
				table from Hershey glyph numbers to ASCII
				sequence for a particular typestyle.
		hershey.f77 - A fortran program that reads and displays all
				of the glyphs in a Hershey font file.
		hershey.c   - The same, in C, using GKS, for MS-DOS and the
				PC-Color Graphics Adaptor.

Additional Work To Be Done (volunteers welcome!):

	- Integrate this complete set of data with the hershey font typesetting
		program recently distributed to mod.sources
	- Come up with an integrated data structure and supporting routines
		that make use of the ASCII translation tables
	- Digitize additional characters for the few places where non-ideal
		symbol substitutions were made in the ASCII translation tables.
	- Make a version of the demo program (hershey.c or hershey.f77) that
		uses the standard Un*x plot routines.
	- Write a banner-style program using Hershey Fonts for input and
		non-graphic terminals or printers for output.
	- Anything else you'd like!
SHAR_EOF
if test -f 'hershey.doc'
then
	echo shar: over-writing existing file "'hershey.doc'"
fi
cat << \SHAR_EOF > 'hershey.doc'
This file provides a brief description of the contents of the Occidental
Hershey Font Files. For a complete listing of the fonts in hard copy, order
NBS Special Publication 424, "A contribution to computer typesetting 
techniques: Tables of Coordinates for Hershey's Repertory of Occidental
Type Fonts and Graphic Symbols". You can get it from NTIS (phone number is
+1 703 487 4763) for less than twenty dollars US.

Basic Glyph (symbol) data:

        hersh.oc1       - numbers 1 to 1199
        hersh.oc2       - numbers 1200 to 2499
        hersh.oc3       - numbers 2500 to 3199
        hersh.oc4       - numbers 3200 to 3999

        These four files contain approximately 19 different fonts in
the A-Z alphabet plus greek and cyrillic, along with hundreds of special
symbols, described generically below.

        There are also four files of Oriental fonts (hersh.or[1-4]). These
files contain symbols from three Japanese alphabets (Kanji, Hiragana, and
Katakana). It is unknown what other symbols may be contained therein, nor
is it known what order the symbols are in (I don't know Japanese!).

        Back to the Occidental files:

Fonts:
        Roman: Plain, Simplex, Duplex, Complex Small, Complex, Triplex
        Italic: Complex Small, Complex, Triplex
        Script: Simplex, Complex
        Gothic: German, English, Italian
        Greek: Plain, Simplex, Complex Small, Complex
        Cyrillic: Complex

Symbols:
        Mathematical (227-229,232,727-779,732,737-740,1227-1270,2227-2270,
                        1294-1412,2294-2295,2401-2412)
        Daggers (for footnotes, etc) (1276-1279, 2276-2279)
        Astronomical (1281-1293,2281-2293)
        Astrological (2301-2312)
        Musical (2317-2382)
        Typesetting (ffl,fl,fi sorts of things) (miscellaneous places)
        Miscellaneous (mostly in 741-909, but also elsewhere):
                - Playing card suits
                - Meteorology
                - Graphics (lines, curves)
                - Electrical
                - Geometric (shapes)
                - Cartographic
                - Naval
                - Agricultural
                - Highways
                - Etc...


ASCII sequence translation files:

        The Hershey glyphs, while in a particular order, are not in an
        ASCII sequence. I have provided translation files that give the
        sequence of glyph numbers that will most closely approximate the
        ASCII printing sequence (from space through ~, with the degree
        circle tacked on at the end) for each of the above fonts:

        File names are made up of fffffftt.hmp,

                where ffffff is the font style, one of:
                        roman   Roman
                        greek   Greek
                        italic  Italic
                        script  Script
                        cyril   Cyrillic (some characters not placed in
                                           the ASCII sequence)
                        gothgr  Gothic German
                        gothgb  Gothic English
                        gothit  Gothic Italian

                and tt is the font type, one of:
                    p       Plain (very small, no lower case)
                    s       Simplex (plain, normal size, no serifs)
                    d       Duplex (normal size, no serifs, doubled lines)
                    c       Complex (normal size, serifs, doubled lines)
                    t       Triplex (normal size, serifs, tripled lines)
                    cs      Complex Small (Complex, smaller than normal size)

The three sizes are coded with particular base line (bottom of a capital
        letter) and cap line (top of a capital letter) values for 'y':

        Size            Base Line       Cap Line

        Very Small         -5              +4 
        Small              -6              +7
        Normal             -9              +12

        (Note: some glyphs in the 'Very Small' fonts are actually 'Small')

The top line and bottom line, which are normally used to define vertical
        spacing, are not given. Maybe somebody can determine appropriate
        values for these!

The left line and right line, which are used to define horizontal spacing,
        are provided with each character in the database.
SHAR_EOF
if test -f 'hershey.f77'
then
	echo shar: over-writing existing file "'hershey.f77'"
fi
cat << \SHAR_EOF > 'hershey.f77'
c     .. display all of the Hershey font data
c
c     .. By James Hurt when with
c     ..    Deere and Company
c     ..    John Deere Road
c     ..    Moline, IL 61265
c
c     .. Author now with Cognition, Inc.
c     ..                 900 Technology Park Drive
c     ..                 Billerica, MA 01821
c
c     .. graphics subroutines
c     .. identy - initialize graphics
c     .. vwport - set where to display image on screen
c     ..        - full screen is 0.0 to 100.0 in vertical (y) direction
c     ..        -                0.0 to ???.? in horizontal (x) direction
c     ..        - origin is lower left corner of screen
c     .. window - set window limits in world coordinates
c     .. newpag - if action left to be take on existing screen, take it
c     ..        - then take actions to start with a blank screen
c     .. jnumbr - display an integer (code included)
c     .. move   - set current cursor position to (x,y)
c     .. draw   - draw from current cursor position to (x,y)
c     ..        - then set current cursor position to (x,y)
c     ..        - The point (x,y) is always in world coordinates
c     .. skip   - Make the next draw really be a move
c     .. waitcr - finish all graphics actions then let the user look at
c     ..        - the image.  User signals (usually by pressing RETURN)
c     ..        - when it is safe to continue.
c     .. grstop - finish all graphics routines (no more graphics to follow)
c
      external identy,vwport,window,newpag,jnumbr,move ,draw ,skip,
     x         waitcr,grstop
c     .. local variables
      real deltac, deltar, colmax
      parameter (deltac = 6.25, deltar = 6.25, colmax = 100.0)
c     .. font data file name
      character*80 name
c     .. font data
      character*1 line(2,256)
c     .. co-ordinates
      real x,y,col,row
c     .. which data point and which character
      integer ipnt,ich,nch,i
      intrinsic ichar
cexecutable code begins
c     .. file unit number
      kfile=1
c     .. get hershey file name
      write(*,'(a)') ' packed hershey font file name'
      read(*,'(a)') name
      open(unit=kfile,file=name,status='old')
c     .. initialize graphics
      call identy
c     .. want square picture for each character
c     .. Note: most but not all Hershey font characters fit inside this window
      call window(-15.0, 15.0,-15.0, 15.0)
c     .. loop per screen
5     continue
c     .. start with a clean sheet
      call newpag
c     .. where to display this character
      col = 0.0
      row = 100.0
c     .. loop per character
10    continue
c     .. read character number and data
      read(unit=kfile,'(i5,i3,64a1/(72a1))',end=90) ich,nch,
     x     (line(1,i),line(2,i),i=1,nch)
c     .. select view port (place character on screen)
      call vwport(col,col+deltac,row-deltar,row)
c     .. identify character
      call jnumbr(ich,4,-15.0,9.0,5.0)
c     .. draw character limits
c     .. Note: this data can be used for proportional spacing
      x=ichar(line(1,1))-ichar('R')
      y=ichar(line(2,1))-ichar('R')
      call move(x,-10.0)
      call draw(x,10.0)
      call move(y,-10.0)
      call draw(y,10.0)
c     .. first data point is a move
      call skip
c     .. loop per line of data
      do 20 ipnt = 2, nch
c     .. process vector number ipnt
      if(line(1,ipnt).eq.' ') then
c        .. next data point is a move
         call skip
      else
c        .. draw (or move) to this data point
         x=ichar(line(1,ipnt))-ichar('R')
         y=ichar(line(2,ipnt))-ichar('R')
c        .. Note that Hershey Font data is in TV coordinate system
         call draw(x,-y)
      endif
20    continue
c     .. end of this character
      col = col + deltac
      if( col .lt. colmax ) go to 10
      col = 0.0
      row = row - deltar
      if( row .ge. deltar ) go to 10
      call waitcr
      go to 5
90    continue
      call waitcr
c     .. all done
      call grstop
      end
      subroutine jnumbr( number, iwidth, x0, y0, height )
      integer number, iwidth
      real x0, y0, height
c     .. draw one of the decimal digits
c     .. number = the integer to be displayed
c     .. iwidth = the number of characters
c     .. (x0, y0) = the lower left corner
c     .. height = height of the characters
c
c
c     .. By James Hurt when with
c     ..    Deere and Company
c     ..    John Deere Road
c     ..    Moline, IL 61265
c
c     .. Author now with Cognition, Inc.
c     ..                 900 Technology Park Drive
c     ..                 Billerica, MA 01821
c
c     .. graphics (graphics) routines called
      external skip,draw
c     .. local variables used
      integer ipnt, ipos, ival, idigit
      real x, y, scale
      real xleft, ylower
c     .. character data for the ten decimal digit characters
c     .. data extracted from one of the Hershey fonts
      integer start(0:10), power(0:9)
      character*1 line(2,104)
      data power/ 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000,
     x 100000000, 1000000000 /
      data start/0,11,14,22,36,42,55,68,73,91,104/
c 0:poly(4 9,2 8,1 6,1 3,2 1,4 0,6 1,7 3,7 6,6 8,4 9)
c 1:poly(2 7,4 9,4 0)
c 2:poly(1 8,3 9,5 9,7 8,7 6,6 4,1 0,7 0)
c 3:poly(1 8,3 9,5 9,7 8,7 6,5 5)
c   poly(4 5,5 5,7 4,7 1,5 0,3 0,1 1)
c 4:poly(5 9,5 0)
c   poly(5 9,0 3,8 3)
c 5:poly(2 9,1 5,3 6,4 6,6 5,7 3,6 1,4 0,3 0,1 1)
c   poly(2 9,6 9)
c 6:poly(6 9,4 9,2 8,1 6,1 3,2 1,4 0,6 1,7 3,6 5,4 6,2 5,1 3)
c 7:poly(7 9,3 0)
c   poly(1 9,7 9)
c 8:poly(3 9,1 8,1 6,3 5,5 5,7 6,7 8,5 9,3 9)
c   poly(3 5,1 4,1 1,3 0,5 0,7 1,7 4,5 5)
c 9:poly(7 6,6 4,4 3,2 4,1 6,2 8,4 9,6 8,7 6,7 3,6 1,4 0,2 0)
c
      data line/'R','M','P','N','O','P','O','S','P','U','R','V','T','U',
     A'U','S','U','P','T','N','R','M','P','O','R','M','R
     B','V','O','N','Q','M','S','M','U','N','U','P','T','R','O',
     C'V','U','V','O','N','Q','M','S','M','U','N','U','P','S','Q
     D',' ','R','R','Q','S','Q','U','R','U','U','S','V','Q','V','O','U',
     E'S','M','S','V',' ','R','S','M','N','S','V','S','P
     F','M','O','Q','Q','P','R','P','T','Q','U','S','T','U','R','V','Q',
     G'V','O','U',' ','R','P','M','T','M','T','M','R','M','P','N
     H','O','P','O','S','P','U','R','V','T','U','U','S','T','Q','R','P',
     I'P','Q','O','S','U','M','Q','V',' ','R','O','M','U','M',
     J'Q','M','O','N','O','P','Q','Q','S','Q','U','P','U','N','S',
     K'M','Q','M',' ','R','Q','Q','O','R','O','U','Q','V','S','V','U','U
     L','U','R','S','Q','U','P','T','R','R','S','P','R','O','P',
     M'P','N','R','M','T','N','U','P','U','S','T','U','R','V','P','V'/
c     .. compute scale factor and lower left of first digit
      scale = height/10.0
      xleft = x0
      ylower = y0
      ival = number
c     .. loop for each position
      do 30 ipos = iwidth,1,-1
         idigit = mod( ival/power(ipos-1), 10 )
c        .. first data point is a move
         call skip
c        .. loop over data for this digit
         do 20 ipnt=start(idigit)+1,start(idigit+1)
            if(line(1,ipnt).eq.' ') then
c              .. next data point is a move
               call skip
            else
c              .. draw (or move) to this data point
               x=ichar(line(1,ipnt))-ichar('N')
               y=ichar(line(2,ipnt))-ichar('V')
               call draw(xleft+scale*x,ylower-scale*y)
            endif
20       continue
c        .. move for next digit
         xleft = xleft + height
30    continue
      end

SHAR_EOF
if test -f 'hershey.c'
then
	echo shar: over-writing existing file "'hershey.c'"
fi
cat << \SHAR_EOF > 'hershey.c'
#include "cgksincl.h"
#include <stdio.h>

#ifndef TRUE
#define TRUE 1
#define FALSE 0
#endif

/*
 * hershey.c   Display all of the Hershey font data in a font file
 *
 * This sample program is intended more so the user can see how the
 * font data is read and used in an (admittedly minimal) application,
 * than as a useable program.
 *
 * Its function is to display all of the hershey font characters on-screen,
 * in a format 8 characters across and 8 vertical.
 *
 * usage:
 *    hershey <device> <fontfile>
 *
 *       where <device> is a supported device ('c' for pc-cga is all
 *                      in this version)
 *             <fontfile> is the name of a hershey font file, e.g.
 *                      hersh.oc1
 *
 * Translated from Fortran to C and GKS (that's why it looks wierd!)
 *    (PRIOR Data Sciences non-ANSI GKS binding used here. Sorry!
 *     Somebody else is welcome to translate to the ANSI binding)
 *
 */

/*
     Translated by Pete Holzmann
         Octopus Enterprises
         19611 La Mar Court
         Cupertino, CA 95014

      Original...  
     .. By James Hurt when with
     ..    Deere and Company
     ..    John Deere Road
     ..    Moline, IL 61265

     .. now with Cognition, Inc.
     ..          900 Technology Park Drive
     ..          Billerica, MA 01821
*/

/* local variables */
   /* the next variables set the percent-of-screen used for each
      character. 'colmax' should be left at 100. */

      float deltac = 12.5, deltar = 12.5, colmax = 100.0;

   	FILE	*INfile,*OUTfile,*fopen(); /* some files */

      /* some variables to record the largest bounding rectangle of
         the displayed characters. Printed when all finished. */

      int minx = 999,miny = 999,maxx=-999,maxy=-999;

/*    .. font data file name */
      char name[80];

/* a forward referenced function */
      void jnumbr();

   float aspect = 1.2;  /* PC graphics screen aspect ratio */

/* GKS local variables */

   int cga();           /* device initializer function */
	int	(*wsinitf)();  /* pointer to the initializer function */
	Ws_id   wss_xxxx;    /* workstation id (an int) */
	Int 	wstyp;         /* ws type, and some vars */
	Drect	maxsurf;       /* max device surface rectangle */
	Int	rastunit[2];   /* device surface in raster units */

	Wc	p1[2];            /* two world coordinates */

/* world coordinate windows */
	Wrect	wrect  = {-17,-17,17,17};
/* NDC coordinate viewport and windows */
	Nrect	nrect = {0.0, 0.0, 1.0, 1.0};
/* DC coordinate viewport */
	Drect	drect = {0.0, 0.0, 319.0, 199.0}; /* work area */


/*
 * scanint: a function to scan an integer, using n characters of
 *          the input file, ignoring newlines. (scanf won't work
 *          because it also ignores blanks)
 */
int scanint(file,n)
FILE *file;
int n;
{
char buf[20];
int i,c;

   for (i=0;i<n;i++){
      while ((c = fgetc(file)) == '\n') ; /* discard spare newlines */
      if (c == EOF) return(-1);
       buf[i] = c;
   }
   
   buf[i] = 0;
   return(atoi(buf));
}

/*
 * Convert desired viewport in percentages into Normalized Device Coords
 * (NDC) for GKS
 */

setview(minx,miny,maxx,maxy)
float minx,miny,maxx,maxy;
{
   Nrect newview;

   newview.n_ll.n_x = minx*nrect.n_ur.n_x/100.0;
   newview.n_ll.n_y = miny*nrect.n_ur.n_y/100.0;
   newview.n_ur.n_x = maxx*nrect.n_ur.n_x/100.0;
   newview.n_ur.n_y = maxy*nrect.n_ur.n_y/100.0;
   /* use normalization transformation number 1 */
   s_viewport(1,&newview);
}

/*
 * GKS uses a polyline function instead of skip, draw and move
 *    functions. The following routines translate from skip/draw/move
 *    to polyline:
 */

int skipflag = 1; /* 1 if next draw is 'pen up' */
int oldx,oldy;

static void
skip()
{
skipflag = TRUE;
}

static void
draw(newx,newy)
int newx,newy;
{
   if (!skipflag) {
      p1[0].w_x = oldx;
      p1[0].w_y = oldy;
      p1[1].w_x = newx;
      p1[1].w_y = newy;
      polyline(2,p1);
   }
   skipflag = FALSE;
   oldx = newx;
   oldy = newy;
}

/*
 * The main program...
 */

main(argc,argv)
int argc;
char **argv;
{
/*    .. file unit number */
      FILE *kfile,*f1,*f2;
/*    .. font data   */
      char line[2][256];
      int x,y;
      float col,row;
/*    .. which data point and which character */
      int     ipnt,ich,nch,i,ichar;

    	if (argc != 3) {
         printf("usage: hershey [c,<other devices?>] file\n");
         exit(1);
      }

    	switch (*argv[1]) {
         case 'c':  wsinitf = cga; break;
     		default:
                    printf("usage: hershey [c,<other devices?>] file\n");
                    exit(1);
    	}

   /* get GKS started */

	open_gks((Ercode (*)())NULL,(Erarea *)NULL,(Size)NULL,(String) "");
	      OUTfile=stdout;
         INfile = NULL;

	wss_xxxx = open_ws(INfile, OUTfile, wsinitf);

	activate(wss_xxxx);

   nrect.n_ur.n_y /= aspect;  /* correct NDC square for pixel aspect ratio */

	/* adjust drect to be the biggest square possible, and adjust for
      aspect ratio */

   drect.d_ur.d_x = drect.d_ur.d_y * aspect;

/* set up the normalization transformation (number 1) from WC to NDC */
	s_window  (1, &wrect);
	s_viewport(1, &nrect);
   s_clip(FALSE);
	sel_cntran(1);
/* set up the workstation transformation from NDC to DC */
	s_w_wind(wss_xxxx, &nrect);
	s_w_view(wss_xxxx, &drect);
	update(wss_xxxx,1);

/*
 * GKS is all set up now, so let's get started...
 */

/*    .. get hershey file name */
      if (!(kfile = fopen(argv[2],"r"))) {
         fprintf(stderr,"Can't open font file '%s'\n",argv[1]);
         exit(1);
         }

/*    .. loop per screen */
label5:
/*		     .. start with a clean sheet */
      clear(wss_xxxx);

/*    .. where to display this character */
      col = 0.0;
      row = 100.0;

/*		     .. loop per character */
      while (TRUE) {

/*		     .. read character number and data */
      if ((ich = scanint(kfile,5)) < 1) {
	         deactivate(wss_xxxx);
            getchar();
         	close_ws(wss_xxxx);
         	close_gks();
            printf("\nDone\n");
            printf("min,max = (%d,%d) (%d,%d)\n",minx,miny,maxx,maxy);
            exit(0);
      }
      nch = scanint(kfile,3);

      for (i=0; i<nch;i++) {
         if ((i==32) ||(i==68) ||(i==104) ||(i==140)) fgetc(kfile); /* skip newlines */
         line[0][i] = fgetc(kfile);
         line[1][i] = fgetc(kfile);
      }
      fgetc(kfile);

/*		     .. select view port (place character on screen) */
      setview(col,row-deltar,col+deltac,row);

/*		     .. identify character */

		jnumbr(ich,4,-15.0,-16.0,6.0);

/*		     .. draw left and right lines */
/*		     .. Note: this data can be used for proportional spacing */

      x=(int)line[0][0] - (int)'R';
      y=(int)line[1][0] - (int)'R';

      skip();
      draw(x,-10);draw(x,10);
      skip();
      draw(y,-10);draw(y,10);


/*		     .. first data point is a move */
      skip();
/*		     .. loop per line of data */
    for (ipnt=1;ipnt<nch;ipnt++) {

/*		     .. process vector number ipnt */
      if (line[0][ipnt] == ' ') {
/*		        .. next data point is a move */
         skip();
      } else {
/*		        .. draw (or move) to this data point */
         x=(int)line[0][ipnt] -(int) 'R';
         y=(int)line[1][ipnt] -(int) 'R';
         if (x < minx) minx = x;
         if (x >maxx) maxx = x;
         if (-y < miny) miny = -y;
         if (-y >maxy) maxy = -y;
/*		        .. Note that Hershey Font data is in TV coordinate system */
		   draw(x,-y);
      }
    } /* for loop */
/*		     .. end of this character */

      if( (col += deltac) < colmax )
         continue;
      col = 0.0;
      if( (row -= deltar) >= deltar ) 
         continue;

      getchar();     /* wait for user to hit a newline */
      goto label5;
   } /* while true */
/*		     .. all done */
      exit();
}


      long power[] ={ 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000,
          100000000, 1000000000 };
      int  start[] ={0,11,14,22,36,42,55,68,73,91,104};
/*		 0:poly(4 9,2 8,1 6,1 3,2 1,4 0,6 1,7 3,7 6,6 8,4 9) */
/*		 1:poly(2 7,4 9,4 0) */
/*		 2:poly(1 8,3 9,5 9,7 8,7 6,6 4,1 0,7 0) */
/*		 3:poly(1 8,3 9,5 9,7 8,7 6,5 5) */
/*		   poly(4 5,5 5,7 4,7 1,5 0,3 0,1 1) */
/*		 4:poly(5 9,5 0) */
/*		   poly(5 9,0 3,8 3) */
/*		 5:poly(2 9,1 5,3 6,4 6,6 5,7 3,6 1,4 0,3 0,1 1) */
/*		   poly(2 9,6 9) */
/*		 6:poly(6 9,4 9,2 8,1 6,1 3,2 1,4 0,6 1,7 3,6 5,4 6,2 5,1 3) */
/*		 7:poly(7 9,3 0) */
/*		   poly(1 9,7 9) */
/*		 8:poly(3 9,1 8,1 6,3 5,5 5,7 6,7 8,5 9,3 9) */
/*		   poly(3 5,1 4,1 1,3 0,5 0,7 1,7 4,5 5) */
/*		 9:poly(7 6,6 4,4 3,2 4,1 6,2 8,4 9,6 8,7 6,7 3,6 1,4 0,2 0) */
/*		 */
    char linedat[]={'R','M','P','N','O','P','O','S','P','U','R','V','T','U',
      'U','S','U','P','T','N','R','M','P','O','R','M','R',
        'V','O','N','Q','M','S','M','U','N','U','P','T','R','O',
      'V','U','V','O','N','Q','M','S','M','U','N','U','P','S','Q',
        ' ','R','R','Q','S','Q','U','R','U','U','S','V','Q','V','O','U',
      'S','M','S','V',' ','R','S','M','N','S','V','S','P',
        'M','O','Q','Q','P','R','P','T','Q','U','S','T','U','R','V','Q',
      'V','O','U',' ','R','P','M','T','M','T','M','R','M','P','N',
        'O','P','O','S','P','U','R','V','T','U','U','S','T','Q','R','P',
      'P','Q','O','S','U','M','Q','V',' ','R','O','M','U','M',
      'Q','M','O','N','O','P','Q','Q','S','Q','U','P','U','N','S',
      'M','Q','M',' ','R','Q','Q','O','R','O','U','Q','V','S','V','U','U',
        'U','R','S','Q','U','P','T','R','R','S','P','R','O','P',
      'P','N','R','M','T','N','U','P','U','S','T','U','R','V','P','V'};
 
#define line(a,b) linedat[(b*2+a)]
void
jnumbr( number, iwidth, x0, y0, height )
      int number, iwidth;
      float x0, y0, height;

{
/*		     .. draw one of the decimal digits */
/*		     .. number = the integer to be displayed */
/*		     .. iwidth = the number of characters */
/*		     .. (x0, y0) = the lower left corner */
/*		     .. height = height of the characters */
/*		 */
/*		 */
/*		     .. By James Hurt when with */
/*		     ..    Deere and Company */
/*		     ..    John Deere Road */
/*		     ..    Moline, IL 61265 */
/*		 */
/*		     .. Author now with Cognition, Inc. */
/*		     ..                 900 Technology Park Drive */
/*		     ..                 Billerica, MA 01821 */
/*		 */

/*		     .. local variables used */
      int ipnt, ipos, ival, idigit;
      float x, y, scale;
      float xleft, ylower;

/*		     .. character data for the ten decimal digit characters */
/*		     .. data extracted from one of the Hershey fonts */

/*	        .. compute scale factor and lower left of first digit */
      scale = height/10.0;
      xleft = x0;
      ylower = y0;
      ival = number;

/*		     .. loop for each character */

      for (ipos = iwidth;ipos>=1;ipos--) {
         idigit = (ival/power[ipos-1])% 10;

/*		        .. first data point is a move */
         skip();

/*		        .. loop over data for this digit */
         for ( ipnt=start[idigit]; ipnt < start[idigit+1];ipnt++) {
            if(((char)line(0,ipnt)) == ' ') {
               skip();   /* next data point is a move */
            } else {
/*		              .. draw (or move) to this data point */
               x=(int)line(0,ipnt) -(int) 'N';
               y=(int)line(1,ipnt) -(int) 'V';

         		draw((int)(xleft+scale*x),(int)(ylower-scale*y));
            }
          } /* data for this digit */
/*		        .. move for next digit */
         xleft += height;
       } /* whole string */
}
SHAR_EOF
if test -f 'cyrilc.hmp'
then
	echo shar: over-writing existing file "'cyrilc.hmp'"
fi
cat << \SHAR_EOF > 'cyrilc.hmp'
2199    2214    2213    2275    2274    2271    2272    2251
2221    2222    2219    2232    2211    2231    2210    2220
2200-2209
2212    2213    2241    2238    2242    2215    2273
2801-2826
2223    804     2224    2262    999     2252
2901-2926
2225    2229    2226    2246    2218
SHAR_EOF
if test -f 'gothgbt.hmp'
then
	echo shar: over-writing existing file "'gothgbt.hmp'"
fi
cat << \SHAR_EOF > 'gothgbt.hmp'
3699    3714    3728    2275    3719    2271    3718    3717
3721    3722    3723    3725    3711    3724    3710    3720
3700-3709
3712    3713    2241    3726    2242    3715    2273
3501-3526
2223    804     2224    2262    999     3716
3601-3626
2225    2229    2226    2246    3729
SHAR_EOF
if test -f 'gothgrt.hmp'
then
	echo shar: over-writing existing file "'gothgrt.hmp'"
fi
cat << \SHAR_EOF > 'gothgrt.hmp'
3699    3714    3728    2275    3719    2271    3718    3717
3721    3722    3723    3725    3711    3724    3710    3720
3700-3709
3712    3713    2241    3726    2242    3715    2273
3301-3326
2223    804     2224    2262    999     3716
3401-3426
2225    2229    2226    2246    3729
SHAR_EOF
if test -f 'gothitt.hmp'
then
	echo shar: over-writing existing file "'gothitt.hmp'"
fi
cat << \SHAR_EOF > 'gothitt.hmp'
3699    3714    3728    2275    3719    2271    3718    3717
3721    3722    3723    3725    3711    3724    3710    3720
3700-3709
3712    3713    2241    3726    2242    3715    2273
3801-3826
2223    804     2224    2262    999     3716
3901-3926
2225    2229    2226    2246    3729
SHAR_EOF
if test -f 'greekc.hmp'
then
	echo shar: over-writing existing file "'greekc.hmp'"
fi
cat << \SHAR_EOF > 'greekc.hmp'
2199    2214    2213    2275    2274    2271    2272    2251
2221    2222    2219    2232    2211    2231    2210    2220
2200-2209
2212    2213    2241    2238    2242    2215    2273
2027-2050       2199    2199
2223    804     2224    2262    999     2252
2127-2150       2199    2199
2225    2229    2226    2246    2218
SHAR_EOF
if test -f 'greekcs.hmp'
then
	echo shar: over-writing existing file "'greekcs.hmp'"
fi
cat << \SHAR_EOF > 'greekcs.hmp'
1199    1214    1213    1275    1274    1271    1272    1251
1221    1222    1219    1232    1211    1231    1210    1220
1200-1209
1212    1213    1241    1238    1242    1215    1273
1027-1050       1199    1199
1223    804     1224    1262    998     1252
1127-1150       1199    1199
1225    1229    1226    1246    1218
SHAR_EOF
if test -f 'greekp.hmp'
then
	echo shar: over-writing existing file "'greekp.hmp'"
fi
cat << \SHAR_EOF > 'greekp.hmp'
199     214     217     233     219     1271    234     231
221     222     1219    225     211     224     210     220
200-209
212     213     1241    226     1242    215     1273
27-50   199     199
1223    809     1224    1262    997     230
27-50   199     199
1225    223     1226    1246    218

SHAR_EOF
if test -f 'greeks.hmp'
then
	echo shar: over-writing existing file "'greeks.hmp'"
fi
cat << \SHAR_EOF > 'greeks.hmp'
699     714     717     733     719     2271    734     731
721     722     2219    725     711     724     710     720
700-709
712     713     2241    726     2242    715     2273
527-550 699     699
2223    804     2224    2262    999     730
627-650 699     699
2225    723     2226    2246    718

SHAR_EOF
if test -f 'italicc.hmp'
then
	echo shar: over-writing existing file "'italicc.hmp'"
fi
cat << \SHAR_EOF > 'italicc.hmp'
2749    2764    2778    2275    2769    2271    2768    2767
2771    2772    2773    2775    2761    2774    2760    2770
2750-2759
2762    2763    2241    2776    2242    2765    2273
2051-2076
2223    804     2224    2262    999     2766
2151-2176
2225    2229    2226    2246    2779
SHAR_EOF
if test -f 'italiccs.hmp'
then
	echo shar: over-writing existing file "'italiccs.hmp'"
fi
cat << \SHAR_EOF > 'italiccs.hmp'
1199    1214    1213    1275    1274    1271    1272    1251
1221    1222    1219    1232    1211    1231    1210    802
1200-1209
1212    1213    1241    1238    1242    1215    1273
1051-1076
1223    804     1224    1262    998     1252
1151-1176
1225    1229    1226    1246    1218
SHAR_EOF
if test -f 'italict.hmp'
then
	echo shar: over-writing existing file "'italict.hmp'"
fi
cat << \SHAR_EOF > 'italict.hmp'
3249    3264    3278    2275    3269    2271    3268    3267
3271    3272    3273    3275    3261    3274    3260    3270
3250-3259
3262    3263    2241    3276    2242    3265    2273
3051-3076
2223    804     2224    2262    999     3266
3151-3176
2225    2229    2226    2246    3279
SHAR_EOF
if test -f 'romanc.hmp'
then
	echo shar: over-writing existing file "'romanc.hmp'"
fi
cat << \SHAR_EOF > 'romanc.hmp'
2199    2214    2213    2275    2274    2271    2272    2251
2221    2222    2219    2232    2211    2231    2210    2220
2200-2209
2212    2213    2241    2238    2242    2215    2273
2001-2026
2223    804     2224    2262    999     2252
2101-2126
2225    2229    2226    2246    2218
SHAR_EOF
if test -f 'romancs.hmp'
then
	echo shar: over-writing existing file "'romancs.hmp'"
fi
cat << \SHAR_EOF > 'romancs.hmp'
1199    1214    1213    1275    1274    1271    1272    1251
1221    1222    1219    1232    1211    1231    1210    1220
1200-1209
1212    1213    1241    1238    1242    1215    1273
1001-1026
1223    804     1224    1262    998     1252
1101-1126
1225    1229    1226    1246    1218
SHAR_EOF
if test -f 'romand.hmp'
then
	echo shar: over-writing existing file "'romand.hmp'"
fi
cat << \SHAR_EOF > 'romand.hmp'
2699    2714    2728    2275    2719    2271    2718    2717
2721    2722    2723    2725    2711    2724    2710    2720
2700-2709
2712    2713    2241    2726    2242    2715    2273
2501-2526
2223    804     2224    2262    999     2716
2601-2626
2225    2229    2226    2246    2729
SHAR_EOF
if test -f 'romanp.hmp'
then
	echo shar: over-writing existing file "'romanp.hmp'"
fi
cat << \SHAR_EOF > 'romanp.hmp'
199     214     217     233     219     1271    234     231
221     222     1219    225     211     224     210     220
200-209
212     213     1241    226     1242    215     1273
1-26
1223    809     1224    1262    997     230
1-26
1225    223     1226    1246    218

SHAR_EOF
if test -f 'romans.hmp'
then
	echo shar: over-writing existing file "'romans.hmp'"
fi
cat << \SHAR_EOF > 'romans.hmp'
699     714     717     733     719     2271    734     731
721     722     2219    725     711     724     710     720
700-709
712     713     2241    726     2242    715     2273
501-526
2223    804     2224    2262    999     730
601-626
2225    723     2226    2246    718

SHAR_EOF
if test -f 'romant.hmp'
then
	echo shar: over-writing existing file "'romant.hmp'"
fi
cat << \SHAR_EOF > 'romant.hmp'
3199    3214    3228    2275    3219    2271    3218    3217
3221    3222    3223    3225    3211    3224    3210    3220
3200-3209
3212    3213    2241    3226    2242    3215    2273
3001-3026
2223    804     2224    2262    999     3216
3101-3126
2225    2229    2226    2246    3229
SHAR_EOF
if test -f 'scriptc.hmp'
then
	echo shar: over-writing existing file "'scriptc.hmp'"
fi
cat << \SHAR_EOF > 'scriptc.hmp'
2749    2764    2778    2275    2769    2271    2768    2767
2771    2772    2773    2775    2761    2774    2760    2770
2750-2759
2762    2763    2241    2776    2242    2765    2273
2551-2576
2223    804     2224    2262    999     2766
2651-2676
2225    2229    2226    2246    2779
SHAR_EOF
if test -f 'scripts.hmp'
then
	echo shar: over-writing existing file "'scripts.hmp'"
fi
cat << \SHAR_EOF > 'scripts.hmp'
699     2764    2778    733     2769    2271    2768    2767
2771    2772    2773    725     2761    724     710     2770
2750-2759
2762    2763    2241    726     2242    2765    2273
551-576
2223    804     2224    2262    999     2766
651-676
2225    723     2226    2246    718

SHAR_EOF
#	End of shell archive
exit 0

