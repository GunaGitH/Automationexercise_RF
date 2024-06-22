*** Settings ***
Library    String
Library    SeleniumLibrary    timeout=60
Library    OperatingSystem
Library    ../rf-utilities/ExtentReportListner.py
Library    Process
Library    os
Library    Collections
Library    Dialogs

Resource    ../rf-utilities/PropertyUtilities.robot
Resource    ../rf-utilities/ExtentUtilityListner.robot
Resource    ../rf-utilities/DataUtility.robot

*** Keywords ***
Initial Test Set Up
    [Arguments]    ${sheetName}    ${TestCaseID}
    &{prop} =    Load Config Properties Data
    &{TestData} =    Load Test Data From File    %{TEST_DATA_FILE}    ${sheetName}    ${TestCaseID}
    Set Global Variable    &{TestData}
    Set Environment Variable    TCID    ${TestData.TCID}
    Pass Execution If    "${TestData.Execution}"!="Y"    Test Skipped    SKIP
    Launch Application

Launch Application
    SeleniumLibrary.Open Browser    %{APP_URL}    %{BROWSER_TYPE}    options=add_argument("--ignore-certificate-error")
    SeleniumLibrary.Maximize Browser Window

Close Applications
    [Documentation]  Close Application
    Close Browser
    Log To Console    Dir: ${EXECDIR}
    Sleep    1s

Page Should Contain Element
    [Documentation]    Validate Element Visibility
    [Arguments]    ${Element}    ${ElementName}
    ${status} =    Run Keyword And Return Status    SeleniumLibrary.Page Should Contain Element    ${element}
    IF    '${status}' == 'True'
        Write Extent Test Steps On Pass    ${ElementName} is Available    True
        Capture Element Screenshot    ${Element}
    ELSE
        SeleniumLibrary.Page Should Contain Element    ${element}
        Write Extent Test Steps On Fail    ${ElementName} is Not Available    True
    END
    Log To Console    ElementVisibility: ${ElementName} -> ${status} -> ${element}

Scroll Element Into View
    [Arguments]    ${Element}    ${ElementName}
    ${status} =    Run Keyword And Return Status    SeleniumLibrary.Scroll Element Into View    ${Element}
    IF    '${status}' == 'True'
        Write Extent Test Steps On Pass    ${ElementName} is Available    True
        Capture Element Screenshot    ${Element}
    ELSE
        SeleniumLibrary.Scroll Element Into View    ${element}
        Write Extent Test Steps On Fail    ${ElementName} is Not Available    True
    END
    Log To Console    Scroll Element Into View: ${ElementName} -> ${status} -> ${Element}
    [Return]    ${status}

Click Element
    [Documentation]
    [Arguments]    ${Element}    ${ElementName}
    ${status} =    Scroll Element Into View    ${Element}    ${ElementName}
    IF    '${status}' == 'True'
        Write Extent Test Steps On Pass    ${ElementName} is present    True
        SeleniumLibrary.Capture Element Screenshot    ${Element}
        ${clickStatus} =    Run Keyword And Return Status    SeleniumLibrary.Click Element    ${Element}
    END
