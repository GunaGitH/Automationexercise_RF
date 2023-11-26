*** Settings ***
Library    ../rf-utilities/ExtentReportListner.py
Library    SeleniumLibrary

*** Keywords ***

Write Extent Test Steps
    [Arguments]    ${TestStepDescription}    ${TestStepStatus}    ${ScreenshotFlag}
    ${TestCaseID}=    Set Var