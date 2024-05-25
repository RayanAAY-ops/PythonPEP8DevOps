import sys
import pprint
import pytest
import unittest
from package import square

pprint.pprint(sys.path)


@pytest.mark.parametrize(("input_n", "expected"), ((5, 25), (3.0, 9.0)))
def test_square(input_n, expected, d=0):
    assert square(input_n) == expected


# Class based
class TestLegacy(unittest.TestCase):
    def test(self):
        self.assertEqual(square(3), 9)
