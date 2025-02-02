from datetime import datetime
from pathlib import Path

def get_week(d=datetime.today()):
    print(((int(d.strftime("%-m")) - 1) * 30 + int(d.strftime("%-d"))) % 7) 
    return 0

# default is 'primary', if you are using a separate calendar for your course schedule,
# your calendarId (which you can find by going to your Google Calendar settings, selecting
# the relevant calendar and scrolling down to Calendar ID) probably looks like
# xxxxxxxxxxxxxxxxxxxxxxxxxg@group.calendar.google.com
# example:
# USERCALENDARID = 'xxxxxxxxxxxxxxxxxxxxxxxxxg@group.calendar.google.com'
USERCALENDARID = 'primary'
CURRENT_COURSE_SYMLINK = Path('~/Notes/current-course').expanduser()
CURRENT_COURSE_ROOT = CURRENT_COURSE_SYMLINK.resolve()
CURRENT_COURSE_WATCH_FILE = Path('/tmp/current-course').resolve()
ROOT = Path('~/Notes').expanduser()
DATE_FORMAT = '%Y %B %d %H:%M'
