#!/bin/python3
from courses import Courses, Lectures

for course in Courses():
        lectures = course.lectures
        course_title = lectures.course.info["title"]
        course_short = lectures.course.info["short"]
        lines = [r'\documentclass[a4paper]{article}',
                 r'\input{../preamble.tex}',
                 r'\input{./preamble.tex}',
                 fr'\title{{{course_title} \proctect\\ {course_short}}}',
                 r'\begin{document}',
                 r'    \maketitle',
                 r'    \tableofcontents',
                 fr'    % start lectures',
                 fr'    % end lectures',
                 r'\end{document}'
                ]
        lectures.master_file.touch()
        lectures.preamble_file.touch(exist_ok=True)
        lectures.master_file.write_text('\n'.join(lines))
        (lectures.root / 'master.tex.latexmain').touch()
        (lectures.root / 'figures').mkdir(exist_ok=True)
        (lectures.root / 'lectures').mkdir(exist_ok=True)
