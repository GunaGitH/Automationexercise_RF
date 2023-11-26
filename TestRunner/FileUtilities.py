


import os
import time





class FileUtils(msg, featureName):
    print(featureName)

    reportPath = os.getcwd.replace("my-tests","")+'Reports\\'
    latestreportPath = reportPath+'LatestRun'

    from time import strftime
    current_month = strftime('%B')


    reportMonthlyFolder = reportPath + current_month
    if(os.path.isdir(reportMonthlyFolder) == True):
        print ("Monthly Folder Exist.")
    else:
        print ("Monthly Folder don't exist.")
        os.mkdir(reportMonthlyFolder)
        print("Created Folder... " + reportMonthlyFolder)

    milliseconds = int(round(time.time()*1000))
    reportTargetFolder = reportTargetFolder+"\\"+featureName+"-"+str(milliseconds)
    import shutil
    shutil.copytree(latestreportPath,reportTargetFolder)
    print("Archived the latest run reports to ~ "+reportTargetFolder)