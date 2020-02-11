import os
import re

from dataclasses import Glyph

offset = ord('R')


def generate_glyphs():
    """Translates the .ocX files to a dictionary containing every glyph's information.

    The file extension begins with .oc1 and goes up to .oc4.
    Returns a dictionary where the key is the Hershey number and the value is the glyph information.
    """

    print('\nReading .ocX files')
    folder = 'modsources'
    result = {}

    for filename in os.listdir(folder):
        if not (re.match(r'.+\.oc\d', filename)):
            continue
        with open(os.path.join(folder, filename)) as file:
            print(f'Reading {filename}')
            for line in _iterate_file(file):
                glyph = _generate_glyph(line)
                result[glyph.number] = glyph
    return result


def _iterate_file(file):
    # Some glyphs use more than one line.
    # Buffer the lines until the next glyph begins
    glyph = []
    for line in file:
        # Each glyph begins with a number left padded with spaces
        if re.match(r'^[ \d]{5}', line) and glyph:
            # Last glyph finished. Yield it.
            yield _remove_line_breaks(''.join(glyph))
            glyph = []
        glyph.append(line)


def _remove_line_breaks(string):
    return string.replace('\n', '').replace('\r', '')


def _generate_glyph(line):
    number = int(line[0:5].strip())
    start = ord(line[8]) - offset
    end = ord(line[9]) - offset

    coordinates = []
    for x, y in zip(line[10::2], line[11::2]):
        if x == ' ' and y == 'R':
            # Space + R is a pen up operation
            coordinates.append(None)
        else:
            coordinates.append((ord(x) - offset, ord(y) - offset))

    return Glyph(number, start, end, coordinates)
