#!/usr/bin/env python
from collections import OrderedDict
from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import pandas as pd
import yt

from util import repo_dir


matplotlib.use('Agg')
yt.mylog.setLevel(40)

sims = OrderedDict([
    ('isolated-common-old', 'Old Common Feedback'),
    ('isolated-common', 'Common Feedback'),
    ('isolated-favorite', 'Favorite Feedback')
])

sfh = {}
for name in sims.keys():
    sfh_file = repo_dir / f'data/sfh/{name}.hdf5'
    if not sfh_file.exists():   
        # Make SFH table
        output_dir = repo_dir / f'data/sim/{name}/output'
        rows = []
        for snap in sorted(Path(output_dir).glob('*.hdf5')):
            ds = yt.load(str(snap), bounding_box=[[-1e3, 1e3]]*3)
            ad = ds.all_data()
            row = pd.Series()
            row['t'] = float(ds.current_time.to('Gyr'))
            try:
                row['m_star'] = float(
                    ad['PartType4', 'particle_mass'].sum().to('Msun')
                )
            except:
                row['m_star'] = 0
            rows.append(row)
        df = pd.DataFrame(rows)
        sfh_file.parent.mkdir(parents=True, exist_ok=True)
        df.to_hdf(sfh_file, 'data')
    # Read SFH table
    sfh[name] = pd.read_hdf(sfh_file)
    print(name)
    print(sfh[name])

# Make plot
fig, ax = plt.subplots()
ax.axhline(1e9, color='grey')
for name, label in sims.items():
    df = sfh[name]
    ax.plot(df.t, df.m_star, label=label)
ax.legend()
ax.set_xlabel('Time [$Gyr$]')
ax.set_ylabel('Stellar Mass [$M_\odot$]')
fig.savefig(repo_dir / 'data/sfh/isolated.pdf', dpi=200)
fig.savefig(repo_dir / 'data/sfh/isolated.png', dpi=200)
