import os
import re

# noinspection PyUnresolvedReferences
import fontforge


stroke_size = 24


def run(path, font_name):
    svg_folder = os.path.join(path, 'svgs')
    print(f'\nGenerating font {font_name}.ttf')

    font = fontforge.font()
    font.em = 1024
    # noinspection SpellCheckingInspection
    font.fontname = font_name
    # noinspection SpellCheckingInspection
    font.familyname = 'Hershey'
    for svg in os.listdir(os.path.join(svg_folder, font_name)):
        if svg[-4:] == '.svg':
            match = re.match(r'ascii(\d+)_l(-?[\d.]+)_r(-?[\d.]+).svg', svg)
            character = chr(int(match.group(1)))
            print(f'Importing character {character} for font {font_name}')

            glyph = font.createMappedChar(character)
            # Import the outlines *before* setting the bearings. Otherwise, everything will be reset.
            glyph.importOutlines(os.path.join(svg_folder, font_name, svg))
            glyph.stroke('circular', stroke_size, 'round', 'round')
            # glyph.correctDirection()
            glyph.removeOverlap()
            glyph.simplify()
            glyph.left_side_bearing = float(match.group(2))
            # Compensate for the stroke with on the right side bearing
            glyph.right_side_bearing = float(match.group(3)) - stroke_size

        else:
            print(f'Not a SVG file: {os.path.join(svg_folder, font_name, svg)}')

    # Assumes ttf folder exists
    ttf_folder = os.path.join(path, 'ttf')
    font.generate(os.path.join(ttf_folder, font_name + '.ttf'))
