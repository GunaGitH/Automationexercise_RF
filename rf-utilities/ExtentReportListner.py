import xlsxwriter
import os
import shutil
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

def Create_ExtentNode(TestCaseNodeDetails):
    global RowCounter
    RowCounter = RowCounter + 1
    node = "node~"+TestCaseNodeDetails
    print(node)
    worksheet.write('A'+str(RowCounter),node)

def Extent_TestCaseSteps(TestCaseeSteps, TestCaseStatus, ScreenshotPath):
    global RowCounter
    RowCounter = RowCounter + 1
    worksheet.write('B'+str(RowCounter), TestCaseeSteps)
    worksheet.write('C'+str(RowCounter), TestCaseStatus)
    if (ScreenshotPath != "None"):
        indexOfRelativePath = ScreenshotPath.index("/Screenshots")
        worksheet.write('D'+str(RowCounter), "."+(ScreenshotPath[indexOfRelativePath:]))

def Close_Extent_Report():
    workbook.close()

def createUserDirectory(TestCaseID, screenshotFlag):
    if(screenshotFlag == "True" or screenshotFlag == "TRUE" or screenshotFlag == "true"):
        path = os.getcwd()
        path = path.replace("\\","/")
        screenshotBasePath = path + "/Reports/Screenshots/" + TestCaseID
        Today = datetime.now()
        DateFormat = Today.strftime("%d-%b-%Y")
        TimeFormat = Today.strftime("%H-%M-%S")
        print (TimeFormat)
        FinalPath = (screenshotBasePath+"/"+DateFormat+"/"+TimeFormat)
        if not os.path.exists(FinalPath):
            os.makedirs(FinalPath)
            print (FinalPath)
            return (FinalPath)

def copyExtentFile():
    current_Directory = os.getcwd
    current_Directory = current_Directory.replace("\\","/")
    Today = datetime.now()
    DateFormat = Today.strftime("%d-%b-%Y")
    TimeFormat = Today.strftime("%H-%M-%S")
    source = current_Directory+"/File/"
    destination = current_Directory+"/Reports/ExtentFile/"
    shutil.copytree(source,destination,dirs_exist_ok=True)
    newFileName = "Extent_"+DateFormat+"_"+TimeFormat+"+xlsx"
    os.rename(destination+"Extent.xlsx",destination+newFileName)