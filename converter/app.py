from tkinter import * 
import xlwings as xw
import pandas as pd
from tkinter.filedialog import asksaveasfile
root = Tk()

def save():
    files = [('All Files', '*.*'), ('Excel File', '*.xlsx*')]
    file = asksaveasfile(filetypes = files, defaultextension = '.xlsx')
    return file.name

def handleChange(data, fuite):
    df = xw.load(index=False)
    s = df.columns
    t = []
    for i in s:
        if i == None:
            t.append('')
        else:
            t.append(i.lower().replace(' ', ''))

    f = t.index(fuite)
    g = 0
    while f < len(t):
        if g == len(data):
            break
        f += 1
        t[f] = data[g]
        g += 1
    df.columns = t
    df = df.loc[(df[t[0]] >= 1)]
    path = save()
    df.to_excel(path, index=False)

myLabel = Label(root, text="select a barage:")
myLabel.grid(row=0, column=0, columnspan=8)

def clickHanssali():
    data = ['v.turbine', 'v.s.d', 'v.s.g', 'v.deverse', 'total', 'volumeApport', 'debitApport']
    handleChange(data, 'fuites')

def clickMassira():
    data = ['one', 'onep1', 'onep2', 'vid.fond', 'evac. crue', 'total', 'volumeApport', 'debitApport']
    handleChange(data, 'fuites\nmm³\n')

def clickMyYoussef():
    data = ['evc', 'v', 'c', 'one', 'vf', 'total', 'volumeApport', 'débitApport']
    handleChange(data, 'fuites')

def clickTimoutine():
    data = ['v.deverse', 'V1', 'V2', 's.soltania', 'total', 'volumeApport', 'débitApport']
    handleChange(data, 'v.vidangé')


def clickSidiDriss():
    data = ['oued', 'canal', 'vid. fond', 'dev', 'total', 'volumeApport', 'débitApport']
    handleChange(data, 'fuite')

def clickMessaoud():
    data = ['v.turbine', 'v.vidange', 'v.evacue', 'total', 'volumeApport', 'debitApport']
    handleChange(data, 'fuite')

def clickHassan():
    data = ['onep', 'one', 'vid. fond', 'e.crue', 'total', 'volumeApport', 'débitApport']
    handleChange(data, 'fuites')

def clickBinOuidane():
    data = ['v.turbiné', 'v.s.d', 'v.s.g', 'v.déversé', 'total', 'volumeApport', 'débitApport']
    handleChange(data, 'fuites')



button = Button(root, text="Hansali", command=clickHanssali)
button.grid(column=1, row=2)

button = Button(root, text="Massira", command=clickMassira)
button.grid(column=2, row=2)

button = Button(root, text="MyYoussef", command=clickMyYoussef, bg='Red')
button.grid(column=3, row=2)

button = Button(root, text="Timoutine", command=clickTimoutine)
button.grid(column=4, row=2)

button = Button(root, text="SidiDriss", command=clickSidiDriss)
button.grid(column=5, row=2)

button = Button(root, text="ait mesaoud", command=clickMessaoud)
button.grid(column=6, row=2)







root.mainloop()