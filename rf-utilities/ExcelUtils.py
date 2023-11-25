import xlrd

loc = ("D:\\Testing\\Test.xls")

wb = xlrd.open_workbook(loc)
sheet = wb.sheet_by_index(0)

print(sheet.cell_value(0,0))

for xlrd __import__(wb)
