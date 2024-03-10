*** Settings ***
Documentation   This Is Registration Test Case
Library    SeleniumLibrary
Library    String
Resource    ../DriverUtils/SeleniumCommonUtils.robot
Library    ExcelLibrary
Library    openpyxl
Library    Collections
Library    ../rf-utilities/ExtentReportListner.py
Resource    ../rf-POM/RegistrationPOM.robot
#Library    AppiumLibrary

Suite Setup    Extent Report Creation
#Test Setup    Launch Application
Suite Teardown    SeleniumCommonUtils.Close Applications

*** Variables ***
${SheetName}    Registration
${TestExecutionStatus}    Test ExecutionFail
${tableHeader}    id:header1
${overallStatus}=    False

*** Test Cases ***
01_Register User
    [Documentation]    Register User
    [Tags]    Smoke    01
    Log To Console    OK
    Log To Console    ${EXECDIR}
    Set Environment Variable    TCID    01
    SeleniumCommonUtils.Launch Application
    RegistrationPOM.Verify that home page is visible successfully
    RegistrationPOM.Click on 'Signup / Login' button
    Sleep    10s


