#!/usr/bin/env python
import os

import numpy as np

from path import project_root


os.chdir(project_root / 'data/ot')
z = np.loadtxt('z.txt')
a = 1 / (1 + z)
np.savetxt('a.txt', a, fmt='%.6f')
