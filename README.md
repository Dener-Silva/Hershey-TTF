# Hershey-TTF
Script to map A. V. Hershey's vector fonts to TrueType

## About the fonts
These fonts were originally created by Dr. A. V. Hershey in the 60s, while working at the U. S. National Bureau of Standards. They were designed to be used in vector-based computer displays and printers.
They are very advanced for the time, with thousands of glyphs that include special characters, mathematical symbols, musical symbols and more.
Not only that, they are beautiful and have per-character side bearings. There's even a script font with ligatures!

The original files are available here:
http://cd.textfiles.com/sourcecode/usenet/compsrcs/unix/volume04/hershey/

## Scope of the project
This is a script that directly converts the original data from the Usenet Font Consortium into almost-usable TrueType fonts.
Mapping all original glyphs to Unicode is out of scope.
Creating diacritics is out of scope.

## Running the Script
Run *main.py* with the appropriate arguments to generate the SVGs and the TTFs.
You need FontForge installed in your machine to build the TTFs. You can get it here: https://fontforge.org

### Arguments:
* **svg** - Generates the SVG files.
* **ttf** - Generates the TTF files. It is necessary to generate the SVGs first.
* **svg ttf** - Generate the SVG and TTF files all at once.
* **single-process** - Deactivates parallel font generation. Can be useful for debugging.

## ASCII mapping
The script uses the *.hmp* files to map the glyphs to ASCII. Unfortunately, since the *.hmp* files long predate the creation of Unicode, they don't quite map correctly to Unicode. Some manual adjustments are needed to get the TTFs to an usable state.
All the glyphs that are not covered by the *.hmp* files are grouped in the *Unknown_X.ttf* files.

## Additional notes
The original files from Usenet are included in the *modsources* folder. Consider reading the README file.
