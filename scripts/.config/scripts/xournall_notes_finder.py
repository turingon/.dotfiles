#!/usr/bin/python3
from xournall_courses import Courses
from rofi import rofi
from utils import generate_short_title, MAX_LEN

lectures = Courses().current.lectures

sorted_lectures = lectures

options = [
    "<b>{title: <{fill}}</b>".format(
        fill=10, 
        title=generate_short_title(lecture.title),
    )
    for lecture in sorted_lectures
]

key, index, selected = rofi('Select Lecture:', options, [
    '-lines', 5,
    '-markup-rows',
    '-scroll'
])
#print("key = ",key," index = ",index," selected = ", selected)
if key == 0:
    sorted_lectures[index].edit()
