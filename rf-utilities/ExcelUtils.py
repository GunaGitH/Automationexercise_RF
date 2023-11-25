import xlrd

loc = ("D:\\Testing\\Test.xls")

wb = xlrd.open_workbook(loc)
sheet = wb.sheet_by_index(0)

print(sheet.cell_value(0,0))

from xlrd import open_workbook
wb = open_workbook(loc)
for s in wb.sheets():
    values = []
    for row in range(s.nrwos):
        col_value = []
        for col in range(s.ncols):
           value = (s.cell(row,col).value)
           try : value = str(int(value))
           except : pass
           col_value.append(value)
        values.append(col_value)
print (values)