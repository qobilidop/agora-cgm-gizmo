#!/usr/bin/env python
"""Generate output times table."""
from pathlib import Path


import numpy as np
import pandas as pd

ROOT = Path(__file__).parents[1]
FFMT = '%.6f'


if __name__ == '__main__':
    # Load raw z table
    z = np.loadtxt(ROOT / 'prep/ref/output_z.txt')

    # Fix negatives, remove duplicates, and ensure right order
    z = np.flip(np.unique(np.abs(z)))
    # np.savetxt('output-z.txt', z, fmt=FFMT)

    # Get a from z and store results
    a = 1 / (1 + z)
    np.savetxt(ROOT / 'run/template/output_times.txt', a, fmt=FFMT)

    # Generate a lookup table
    df = pd.DataFrame()
    df['a'] = a
    df['z'] = z
    df.to_csv(ROOT / 'prep/output_times.csv', float_format=FFMT, index_label='snap_id')
