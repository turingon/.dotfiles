#!/usr/bin/python3
from courses import Courses
from rofi import rofi
from utils import generate_short_title, MAX_LEN

lectures = Courses().current.lectures

sorted_lectures = sorted(lectures, key=lambda l: -l.number)

options = [
    "{number: >2}. <b>{title: <{fill}}</b> <span size='smaller'>{date}  ({hour})</span>".format(
        fill=10, 
        number=lecture.number,
        title=generate_short_title(lecture.title),
        date=lecture.date.strftime('%a %-d %B %Y'),
        hour=lecture.hour
    )
    for lecture in sorted_lectures
]

key, index, selected = rofi('Select Lecture:', options, [
    '-lines', 5,
    '-markup-rows',
])
#print("key = ",key," index = ",index," selected = ", selected)
if key == 0:
    sorted_lectures[index].edit()
elif key == 1:
    new_lecture = lectures.new_lecture()
    new_lecture.edit()
