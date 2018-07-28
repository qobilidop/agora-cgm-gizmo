#!/usr/bin/env python
import numpy as np

a = np.linspace(0, 1, 201)
z = np.array([6, 3, 2, 1, 0.5, 0.2, 0.0])
z = np.concatenate([z, z + 0.05, z - 0.05])
a = np.concatenate([a, 1 / (1 + z)])
a = np.sort(np.unique(a))
np.savetxt('output-times.txt', a)
