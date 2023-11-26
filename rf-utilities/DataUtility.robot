*** Settings ***
Library    ExcelLibrary
Library    Collections
Library    OperatingSystem
Library    String


*** Variables ***
${APPIUM SERVER Config}=    ${CURDIR}\\..\\rf-config
${TESTDATA FILE PATH}=    ${CURDIR}\\..\\rf-data
${TEST_TYPE}=    regression

*** Keywords ***
Load Test Data From File
    [Documentation]    Load Test Data frin an Excel(.xls) File
    [Arguments]    ${File Name}    ${Sheet Name}    ${Row Name}