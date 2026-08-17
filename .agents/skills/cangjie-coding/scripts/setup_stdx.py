#!/usr/bin/env python3
"""Install the stdx release matching the active Cangjie toolchain."""

from __future__ import annotations

import sys
from pathlib import Path

sys.dont_write_bytecode = True

SCRIPT_ROOT = Path(__file__).resolve().parent
if str(SCRIPT_ROOT) not in sys.path:
    sys.path.insert(0, str(SCRIPT_ROOT))

from stdx_setup.archive import (
    download,
    extract_archive,
    installation_complete,
    locate_binary_root,
    validate_zip,
)
from stdx_setup.cli import main
from stdx_setup.errors import SetupError
from stdx_setup.manifest import configure_manifest, merge_manifest_text
from stdx_setup.policy import (
    asset_name,
    asset_url,
    parse_cjc_output,
    platform_for_target,
    release_for_cjc,
)
from stdx_setup.system import sha256_file

__all__ = [
    "SetupError",
    "asset_name",
    "asset_url",
    "configure_manifest",
    "download",
    "extract_archive",
    "installation_complete",
    "locate_binary_root",
    "main",
    "merge_manifest_text",
    "parse_cjc_output",
    "platform_for_target",
    "release_for_cjc",
    "sha256_file",
    "validate_zip",
]


if __name__ == "__main__":
    raise SystemExit(main())
