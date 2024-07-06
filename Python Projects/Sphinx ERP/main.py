from tkinter import *

from sqlite3 import *

window = Tk()

m = Tk() #root window
m.title("Sphinx ERP - Supply Chain Tool")
back_image = PhotoImage(file='papyrus.png')
canvas = Canvas(m, width=back_image.width(),height=back_image.height())
canvas.pack(fill=BOTH, expand=True)
canvas.create_image(0, 0, image=back_image, anchor=NW)
label1 = Label(m,text="Hello world")
exitb = Button(m,text='Exit',width=30,command=m.destroy)
label1.pack()
exitb.pack()
m.mainloop()