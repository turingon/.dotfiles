import tkinter as tk
from tkinter import ttk
from pathlib import Path
import os
import tkinter
def submit():
    if entry1 and entry2 and entry3:
        
        home = Path.home()
        directory = entry1.get()
        print(type(directory))
        directory_path = directory.split(" ")
        directory_arrange = ""

        for i in range(len(directory_path)-1):
            directory_arrange += directory_path[i].casefold()
            directory_arrange += "-"
        directory_arrange += directory_path[-1].casefold()

        dir = home / "Notes"
        course_dir = os.path.join(dir,directory_arrange) 
        
        os.makedirs(course_dir)
        x = os.path.join(course_dir,"info.yaml")
        
        with open(x, "a") as file:
            file.write(f'title: "{entry2.get()}"')
            file.write("\n")
            file.write(f'short: "{entry3.get()}"')
            file.close()
        
        entry1.delete(0, tkinter.END)
        entry1.insert(0, "")
        entry2.delete(0, tkinter.END)
        entry2.insert(0, "")
        entry3.delete(0, tkinter.END)
        entry3.insert(0, "")


root = tk.Tk()
root.title("Latex Add Course Application")
root.geometry("500x500")

frame = ttk.Frame(root, padding=10)
frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))

label1 = ttk.Label(frame, text="Course Folder:")
label1.grid(row=0, column=0, sticky=tk.W, pady=5)
entry1 = ttk.Entry(frame)
entry1.grid(row=0, column=1, pady=5)

label2 = ttk.Label(frame, text="Course Name:")
label2.grid(row=1, column=0, sticky=tk.W, pady=5)
entry2 = ttk.Entry(frame)
entry2.grid(row=1, column=1, pady=5)

label3 = ttk.Label(frame, text="Course Short")
label3.grid(row=2, column=0, sticky=tk.W, pady=5)
entry3 = ttk.Entry(frame)
entry3.grid(row=2, column=1, pady=5)

submit_button = ttk.Button(frame, text="Add Course", command=submit)
submit_button.grid(row=3, column=0, columnspan=2, pady=10)

root.mainloop()

