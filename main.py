import os
import shutil
import subprocess
from multiprocessing.pool import Pool
from sys import argv

import hmpparser
import ocxparser
import svggenerator
from dataclasses import Metadata

path = os.getcwd()
svgs_folder = os.path.join(os.getcwd(), 'svgs')
font_forge_path = 'C:\\Program Files (x86)\\FontForgeBuilds\\bin'


def generate_ttf(font_name):
    if os.path.isdir(os.path.join(svgs_folder, font_name)):
        # Remember that the command must be single-line.
        # That is why we use semicolons instead of line breaks.
        os.chdir(font_forge_path)
        subprocess.run(['fontforge', '-c',
                        f'import os;os.chdir(r"{path}");import ffimport;ffimport.run(r"{path}", "{font_name}")'])


if __name__ == '__main__':
    print('Script started in directory ' + os.getcwd())

    if 'svg' in argv:
        print('\nGenerating SVGs')
        glyphs = ocxparser.generate_glyphs()

        if os.path.exists(svgs_folder):
            shutil.rmtree(svgs_folder)
        os.makedirs(svgs_folder)

        generated = set()
        created_folders = set()
        for metadata in hmpparser.next_metadata():
            if metadata.number in glyphs:

                # Create font folder if necessary
                if metadata.font_name not in created_folders:
                    os.makedirs(os.path.join(svgs_folder, metadata.font_name))
                    created_folders.add(metadata.font_name)

                glyph = glyphs[metadata.number]
                svggenerator.generate(glyph, metadata)
                generated.add(metadata.number)

        # Create fake ascii numbers for unknown characters, just so we can generate a ttf
        fake_ascii = ord(' ')
        unknown_fonts_count = 1
        os.makedirs(os.path.join(svgs_folder, 'Unknown_1'))
        for not_generated in generated.symmetric_difference(glyphs):

            glyph = glyphs[not_generated]
            metadata = Metadata(glyph.number, fake_ascii, f'Unknown_{unknown_fonts_count}')
            svggenerator.generate(glyph, metadata)

            fake_ascii += 1
            if fake_ascii > ord('~'):
                fake_ascii = ord(' ')
                unknown_fonts_count += 1
                os.makedirs(os.path.join(svgs_folder, f'Unknown_{unknown_fonts_count}'))

    if 'ttf' in argv:
        print('\nGenerating TTFs')

        ttf_folder = os.path.join(path, 'ttf')
        if not os.path.exists(ttf_folder):
            os.makedirs(ttf_folder)

        if 'single-process' in argv:
            for folder in os.listdir(svgs_folder):
                generate_ttf(folder)
        else:
            with Pool(os.cpu_count()) as pool:
                pool.map(generate_ttf, os.listdir(svgs_folder))
