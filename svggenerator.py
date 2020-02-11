import os

import svgwrite
from svgwrite.shapes import Polyline

from dataclasses import Glyph, Metadata

base = 16
cap = -16
svg_size = 1024
guard = 12
line_style = {'fill': 'none', 'stroke': 'black', 'stroke-width': 0, 'stroke-linecap': 'round',
              'stroke-linejoin': 'round'}


def generate(glyph: Glyph, metadata: Metadata):
    """Uses the glyph and the metadata to create the SVGs.

    The subfolder is the font name.
    The SVG name contains the metadata necessary to import the glyph to the font.
    """
    print(f'Generating character \'{metadata.character}\' for font {metadata.font_name}')

    # Assumes font folder already exists
    font_path = os.path.join(os.getcwd(), 'svgs', metadata.font_name)

    left_side_bearing, right_side_bearing = _calculate_bearings(glyph)
    svg_filename = f'ascii{str(metadata.ascii_value)}_l{left_side_bearing}_r{right_side_bearing}.svg'
    dwg = svgwrite.Drawing(os.path.join(font_path, svg_filename), viewBox=f"0 0 {svg_size} {svg_size}")

    points = []
    for coordinate in glyph.coordinates:
        if coordinate:
            x, y = coordinate
            x = _map_to_svg(x)
            y = _map_to_svg(y)
            points.append((x, y))
        else:
            # Pen up
            # Always check if line is empty (i.e. points array is empty).
            # Empty lines can cause problems.
            if points:
                dwg.add(Polyline(points, **line_style))
            points = []

    # Finalize the drawing
    if points:
        dwg.add(Polyline(points, **line_style))

    dwg.save()


def _calculate_bearings(glyph: Glyph):
    if glyph.coordinates:
        leftmost_point = _map_to_svg(min(coordinate[0] for coordinate in glyph.coordinates if coordinate))
        rightmost_point = _map_to_svg(max(coordinate[0] for coordinate in glyph.coordinates if coordinate))
    else:
        leftmost_point = rightmost_point = _map_to_svg(0)

    left_side_bearing = leftmost_point - _map_to_svg(glyph.left)
    right_side_bearing = _map_to_svg(glyph.right) - rightmost_point
    return left_side_bearing, right_side_bearing


def _map_to_svg(x):
    # Scale proportionally (* svg_size / (base - cap))
    # Guard to avoid going out of bounds after stroking the character
    # Offset, since the SVG starts at zero (+ svg_size / 2)
    return x * (svg_size - 2 * guard) / (base - cap) + svg_size / 2
