#!/usr/bin/env python
"""Generate output times table."""
from argparse import ArgumentParser

import numpy as np
import pandas as pd

FFMT = '%.6f'


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('raw')
    args = parser.parse_args()

    # Load raw z table
    z = np.loadtxt(args.raw)

    # Fix negatives, remove duplicates, and ensure right order
    z = np.flip(np.unique(np.abs(z)))
    np.savetxt('output-z.txt', z, fmt=FFMT)

    # Get a from z and store results
    a = 1 / (1 + z)
    np.savetxt('output-a.txt', a, fmt=FFMT)

    # Generate a lookup table
    df = pd.DataFrame()
    df['a'] = a
    df['z'] = z
    df.to_csv('output-times.csv', float_format=FFMT, index_label='snap_id')
