# a simple example from the documentation

import os
from os.path import join as pjoin
from numpy.testing import assert_equal, assert_string_equal
from cylp.cy import CyClpSimplex

src_dir = os.environ['SRC_DIR']
mps_file = pjoin(src_dir, 'cylp', 'input', 'netlib', 'adlittle.mps')

s = CyClpSimplex()
fs = s.readMps(mps_file)
assert_equal(fs, 0)
st = s.initialSolve()
assert_string_equal(st, 'optimal')
assert_equal(round(s.objectiveValue, 3), 225494.963)
