import xlsxwriter
import os
from datetime import datetime

RowCounter=0
def Extent_Report_Creation():
    global workbook
    global worksheet
    if (RowCounter==0):
        current_Directory = os.getcwd()
        current_Directory = current_Directory.replace("\\","/")
        final_ExtentBasePath = current_Directory+'/../ExtentUtilities/File/Extent.xlsx'
        if os.path.exists(final_ExtentBasePath):
            os.remove(final_ExtentBasePath)
            workbook = xlsxwriter.Workbook(final_ExtentBasePath)
            worksheet = workbook.add_worksheet()
        else:
            workbook = xlsxwriter.Workbook(final_ExtentBasePath)
            worksheet = workbook.add_worksheet()

def Extent_TestCaseHeader(TestCaseHeader, TestcaseID, TCTag):
    global RowCounter
    RowCounter = RowCounter+1
    worksheet.write('A'+str(RowCounter), TestcaseID+'-'+TestCaseHeader)
    worksheet.write('B'+str(RowCounter), TCTag)