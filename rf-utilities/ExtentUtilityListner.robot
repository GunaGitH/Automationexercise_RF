*** Settings ***
Library    ../rf-utilities/ExtentReportListner.py
Library    SeleniumLibrary

*** Keywords ***

Write Extent Test Steps On Pass
    [Arguments]    ${TestStepDescription}    ${ScreenshotFlag}
    ${TestStepStatus} =    Set Variable    Pass
    ${TestCaseID}=    Set Variable    %{TCID}
    ${PathFinder}=    Create User Directory    ${TestCaseID}    ${screenshotFlag}
    IF    '${PathFinder}' != 'None'
         ${TestStepsFileName}=    Set Variable    PassedStep.jpg
         Sleep    1
         SeleniumLibrary.Capture Page Screenshot    ${PathFinder}/${TestStepsFileName}
         Extent TestCaseSteps    ${TestStepDescription}    ${TestStepStatus}    ${PathFinder}/${TestStepsFileName}
    ELSE
        Extent TestCaseSteps    ${TestStepDescription}    ${TestStepStatus}    None
    END

Write Extent Test Steps On Fail
    [Arguments]    ${TestStepDescription}    ${ScreenshotFlag}
    ${TestStepStatus} =    Set Variable    Fail
    ${TestCaseID}=    Set Variable    %{TCID}
    ${PathFinder}=    Create User Directory    ${TestCaseID}    ${screenshotFlag}
    IF    '${PathFinder}' != 'None'
         ${TestStepsFileName}=    Set Variable    FailedStep.jpg
         Sleep    1
         SeleniumLibrary.Capture Page Screenshot    ${PathFinder}/${TestStepsFileName}
         #Fail    ${TestStepDescription}
         Extent TestCaseSteps    ${TestStepDescription}    ${TestStepStatus}    ${PathFinder}/${TestStepsFileName}
    ELSE
        #Fail    ${TestStepDescription}
        Extent TestCaseSteps    ${TestStepDescription}    ${TestStepStatus}    None
    END

Write Extent Test Steps On Warning
    [Arguments]    ${TestStepDescription}    ${ScreenshotFlag}
    ${TestStepStatus} =    Set Variable    Warning
    ${TestCaseID}=    Set Variable    %{TCID}
    ${PathFinder}=    Create User Directory    ${TestCaseID}    ${screenshotFlag}
    IF    '${PathFinder}' != 'None'
         ${TestStepsFileName}=    Set Variable    FailedStep.jpg
         Sleep    1
         SeleniumLibrary.Capture Page Screenshot    ${PathFinder}/${TestStepsFileName}
         #Fail    ${TestStepDescription}
         Extent TestCaseSteps    ${TestStepDescription}    ${TestStepStatus}    ${PathFinder}/${TestStepsFileName}
    ELSE
        #Fail    ${TestStepDescription}
        Extent TestCaseSteps    ${TestStepDescription}    ${TestStepStatus}    None
    END
