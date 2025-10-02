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
${APP_URL}    https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fcontacts.google.com%2F&followup=https%3A%2F%2Fcontacts.google.com%2F&ifkv=AdBytiPz9TIL21QQPxB2F77BBseGYP4Fo6ie7YcKyrbWrCNg1mlYy-1VxyIPvVHeVOo5REieUSF9&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S-633637472%3A1751503644093265

*** Test Cases ***
01_Register User
    [Documentation]    Register User
    [Tags]    Smoke    01
    Log To Console    ${EXECDIR}
    Set Environment Variable    TCID    G01
    SeleniumLibrary.Open Browser    ${APP_URL}    chrome    options=add_argument("--ignore-certificate-error")
    SeleniumLibrary.Maximize Browser Window
    SeleniumCommonUtils.Send Keys    guna.asokan@gmail.com    //input[@id='identifierId']    UserName
    SeleniumCommonUtils.Click Element    //span[text()='Next']    $ElementName
    Sleep    5s