#!/usr/bin/env python
import numpy as np


z = np.loadtxt('output-z.txt')
a = 1 / (1 + z)
np.savetxt('output-a.txt', a, fmt='%.6f')
