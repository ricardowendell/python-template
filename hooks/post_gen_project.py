#!/usr/bin/env python
from __future__ import annotations

import os
import subprocess


def init_git():
    try:
        subprocess.run(["git", "init"], check=True)
        print("Git repository initialized.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to initialize git: {e}")


PROJECT_DIRECTORY = os.path.realpath(os.path.curdir)


def remove_file(filepath: str) -> None:
    os.remove(os.path.join(PROJECT_DIRECTORY, filepath))


if __name__ == "__main__":
    init_git()

    if "{{cookiecutter.open_source_license}}" == "Not open source":
        remove_file("LICENSE")
