from datetime import datetime
from pathlib import Path

CURRENT_COURSE_SYMLINK = Path('~/xournall/current-course').expanduser()
CURRENT_COURSE_ROOT = CURRENT_COURSE_SYMLINK.resolve()
CURRENT_COURSE_WATCH_FILE = Path('/tmp/current-course').resolve()
ROOT = Path('~/xournall').expanduser()
