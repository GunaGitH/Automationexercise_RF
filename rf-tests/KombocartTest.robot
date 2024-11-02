*** Settings ***
Documentation   This Is Registration Test Case
Library    SeleniumLibrary
Library    String
Resource    ../DriverUtils/SeleniumCommonUtils.robot
Library    ExcelLibrary
Library    openpyxl
Library    Collections
Library    ../rf-utilities/ExtentReportListner.py
Resource    ../rf-POM/HomePagePOM.robot
#Library    AppiumLibrary

Suite Setup    Extent Report Creation
#Test Setup    Launch Application
Suite Teardown    SeleniumCommonUtils.Close Applications

*** Variables ***
${SheetName}    Kombocart
${TestExecutionStatus}    Test ExecutionFail
${tableHeader}    id:header1
${overallStatus}=    False

*** Test Cases ***
K01_Validate Logo
    [Tags]    Regression    K01
    Set Environment Variable    TCID    K01
    SeleniumCommonUtils.Initial Test Set Up    ${SheetName}    K01
    HomePagePOM.Validate the Logo
