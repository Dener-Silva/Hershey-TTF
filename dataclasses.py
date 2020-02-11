from typing import Tuple, Iterable, Optional


class Metadata:

    def __init__(self, number: int, ascii_value: int, font_name: str) -> None:
        self.number = number
        self.ascii_value = ascii_value
        self.font_name = font_name
        # Store the character represented by the metadata for debugging purposes
        self.character = chr(ascii_value)

    def __str__(self) -> str:
        return 'Metadata:{number: ' + str(self.number) \
               + ', ascii_value: ' + str(self.ascii_value) \
               + ', font_name: ' + self.font_name \
               + ', character: ' + self.character + '}'


class Glyph:

    def __init__(self, number: int, left: int, right: int, coordinates: Iterable[Optional[Tuple[int, int]]]):
        self.number = number
        self.left = left
        self.right = right
        self.coordinates = coordinates

    def __str__(self) -> str:
        return 'Glyph:{number: ' + str(self.number) \
               + ', left: ' + str(self.left) \
               + ', right: ' + str(self.right) \
               + ', coordinates: ' + str(self.coordinates) + '}'
