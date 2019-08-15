#!/usr/bin/env python
"""Generate output times table."""
from pathlib import Path

import numpy as np
import pandas as pd

ROOT = Path(__file__).parents[1]
FFMT = '%.6f'


if __name__ == '__main__':
    # Load data
    z = np.loadtxt(ROOT / 'ref/workspace/output_z.txt')

    # Clean data
    z = np.flip(np.sort(np.unique(np.clip(z, 0, np.inf))))

    # Convert data
    a = 1 / (1 + z)
    np.savetxt(ROOT / 'prep/output_times.txt', a, fmt=FFMT)

    # Generate a human reference table
    df = pd.DataFrame()
    df['a'] = a
    df['z'] = z
    df.to_csv(ROOT / 'prep/output_times.csv',
              float_format=FFMT, index_label='snap_id')
