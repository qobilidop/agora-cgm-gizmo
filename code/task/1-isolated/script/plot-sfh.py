#!/usr/bin/env python
from collections import OrderedDict
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd
import yt

from src.env import repo_dir


yt.mylog.setLevel(40)

sims = OrderedDict([
    ('tfb', 'Thermal Feedback'),
    ('tfb-dc', 'Thermal Feedback with Delayed Cooling'),
    ('mfb', 'Mechanical Feedback')
])

sfh = {}
for name in sims.keys():
    sfh_file = repo_dir / f'data/sfh/iso-{name}.hdf5'
    if not sfh_file.exists():   
        # Make SFH table
        output_dir = repo_dir / f'data/sim/iso-{name}/output'
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
fig.savefig(repo_dir / 'data/sfh/iso.pdf', dpi=200)
fig.savefig(repo_dir / 'data/sfh/iso.png', dpi=200)
