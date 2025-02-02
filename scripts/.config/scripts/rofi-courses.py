#!/usr/bin/python3
from rofi import rofi

from courses import Courses

courses = Courses()
current = courses.current

all_courses = []
for i in courses:
    if i.info["title"] != courses.current.info["title"]:
        all_courses.append(i)

'''c.info["short"] + " " +''' #for view with short name
code, index, selected = rofi(f'Current Course ({current.info["short"]}) :', [ c.info['title'] + " " + f"({c.info["short"]})"  for c in all_courses], [
])

if index >= 0:
    courses.current = all_courses[index]
