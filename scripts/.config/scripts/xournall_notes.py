#!/usr/bin/python3
import os
from datetime import datetime
from pathlib import Path
import locale
import re
import subprocess

# TODO
locale.setlocale(locale.LC_TIME)

def get_file_name(file:str):
    folders = file.split("/")
    note = folders[-1].split(".")
    return note[0]

class Lecture():
    
    def __init__(self, file_path, course):
        self.file_path = file_path
        self.title = get_file_name(str(file_path))
        self.course = course

    def edit(self):
        subprocess.Popen([
            "xournalpp",
            f"{(self.file_path)}"
        ])

class Lectures(list):
    def __init__(self, course):
        self.course = course
        self.root = course.path
        self.lectures = course.path 
        list.__init__(self, self.read_files())

    def read_files(self):
    
        files = self.lectures.glob('*.xopp')
        return (Lecture(f, self.course) for f in files)

       
