#!/usr/bin/python3
from rofi import rofi

from courses import Courses

courses = Courses()
all_courses = []
for i in courses:
    if i != courses.current:
        all_courses.append(i)

code, index, selected = rofi('Select Course:', [ c.info['title'] + " " + f"({c.info["short"]})"  for c in all_courses], [
    '-auto-select',
    '-no-custom',
    '-lines', len(courses)
])

if index >= 0:
    all_courses[index].open()
