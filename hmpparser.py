import os
import re

from dataclasses import Metadata

types = {'p': 'Plain', 's': 'Simplex', 'd': 'Duplex', 'cs': 'Complex_Small', 'c': 'Complex', 't': 'Triplex'}
names = {'roman': 'Roman', 'greek': 'Greek', 'italic': 'Italic', 'script': 'Script', 'cyril': 'Cyrillic',
         'gothgr': 'Gothic_German', 'gothgb': 'Gothic_English', 'gothit': 'Gothic_Italian'}


def next_metadata():
    """Reads the .hmp files on the modsources folder and returns the metadata

    This iterator will go through each .hmp file and yield the metadata for each character therein.
    The Hershey number is derived from the ranges declared in the file.
    The ASCII value is incremented by 1 for each character represented on the file, starting with the Space character.
    The font name is derived from the .hmp filename."""

    print('\nReading .hmp files')
    folder = 'modsources'

    for filename in os.listdir(folder):
        if not re.match(r'.+\.hmp', filename):
            continue
        with open(os.path.join(folder, filename)) as file:
            font_name = _create_font_name(filename)
            print(f'\nDefined file {filename} as font {font_name}')
            for i, number in enumerate(_iterate_file(file)):
                ascii_value = i + ord(' ')
                yield Metadata(number, ascii_value, font_name)


def _create_font_name(filename: str):
    for prefix, font_name in names.items():
        for suffix, font_type in types.items():
            if filename == prefix + suffix + '.hmp':
                return f'Hershey_{font_name}_{font_type}'


def _iterate_file(file):
    for line in file:
        for token in re.findall(r'(\d+)(-(\d+))?', line):
            if token[2]:
                for i in range(int(token[0]), int(token[2]) + 1, 1):
                    yield i
            else:
                yield int(token[0])
