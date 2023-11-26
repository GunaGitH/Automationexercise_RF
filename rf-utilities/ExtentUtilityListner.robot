*** Settings ***
Library    ../rf-utilities/ExtentReportListner.py
Library    SeleniumLibrary

*** Keywords ***

Write Extent Test Steps
    [Arguments]    ${TestStepDescription}    ${TestStepStatus}    ${ScreenshotFlag}
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
    [Arguments]    ${TestStepDescription}    ${TestCaseID}    ${TestStepStatus}    ${ScreenshotFlag}
    ${PathFinder}=    Create User Directory    ${TestCaseID}    ${screenshotFlag}
    IF    '${PathFinder}' != 'None'
         ${TestStepsFileName}=    Set Variable    FailedStep.jpg
         Sleep    1
         SeleniumLibrary.Capture Page Screenshot    ${PathFinder}/${TestStepsFileName}
         Extent TestCaseSteps    ${TestStepDescription}    ${TestStepStatus}    ${PathFinder}/${TestStepsFileName}
    ELSE
        Extent TestCaseSteps    ${TestStepDescription}    ${TestStepStatus}    None
    END
