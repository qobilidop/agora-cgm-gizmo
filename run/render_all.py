#!/usr/bin/env python
"""Render all run configs into run directories."""
from pathlib import Path
import os
import shutil

from jinja2 import Environment
import toml


THIS_DIR = Path(__file__).parent.resolve()
TMPL_DIR = THIS_DIR / 'tmpl'
RUN_DIR = THIS_DIR.parent


def main():
    # Render each config file into a run directory
    for config_file in THIS_DIR.glob('*.toml'):
        run_dir = THIS_DIR / 'prod' / config_file.stem
        render_run(config_file, run_dir)


def render_run(config_file, run_dir):
    # Load parameters
    params = toml.load(config_file)
    params['job']['name'] = config_file.stem

    # Render template files
    for file_name in [
        'job/run.sh',
        '.gitignore',
        'gizmo_config.sh',
        'gizmo_params.txt',
        'Makefile'
    ]:
        render_file(TMPL_DIR / file_name, run_dir / file_name, params)

    # Copy data files
    files_to_copy = {}
    if params['cosmological']:
        files_to_copy['ic/snapshot.dat'] = THIS_DIR / 'prep/ic/1e12q_lv12/snapshot.dat'
        files_to_copy['output_times.txt'] = THIS_DIR / 'prep/output_times.txt'
    else:
        files_to_copy['ic/snapshot.dat'] = THIS_DIR / 'ref/alessandro/low.dat'
    for dst, src in files_to_copy.items():
        dst = run_dir / dst
        if src.exists():
            os.makedirs(dst.parent, exist_ok=True)
            shutil.copy(src, dst)


def render_file(src, dst, params):
    print('Rendering', src, 'to', dst)
    env = Environment(
        keep_trailing_newline=True,
        trim_blocks=True,
        lstrip_blocks=True
    )
    template = env.from_string(src.read_text())
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(template.render(**params))


if __name__ == '__main__':
    main()
