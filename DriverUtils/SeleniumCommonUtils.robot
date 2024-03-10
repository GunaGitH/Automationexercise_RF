*** Settings ***
Library    String
Library    SeleniumLibrary    timeout=60
Library    OperatingSystem
Library    ../rf-utilities/ExtentReportListner.py
Library    Process
Library    os
Library    Collections

Resource    ../rf-utilities/PropertyUtilities.robot
Resource    ../rf-utilities/ExtentUtilityListner.robot
Resource    ../rf-utilities/DataUtility.robot

*** Keywords ***
Launch Application
    &{prop} =    Load Config Properties Data
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
    ${status} =    SeleniumLibrary.Page Should Contain Element    ${element}
    IF    '${status}' == 'True'
        Write Extent Test Steps    ${ElementName} is Available    Pass    True
    ELSE
        Write Extent Test Steps    ${ElementName} is Not Available    Fail    True
    END
    Log To Console    ElementVisibility: ${ElementName} -> ${status} -> ${element}

Scroll Element Into View
    [Arguments]    ${Element}    ${ElementName}
    ${status} =    SeleniumLibrary.Scroll Element Into View    ${Element}
    Log To Console    Scroll Element Into View: ${ElementName} -> ${status} -> ${Element}
    [Return]    ${status}

Click Element
    [Documentation]
    [Arguments]    ${Element}    ${ElementName}
    ${status} =    Scroll Element Into View    ${Element}    ${ElementName}
    IF    '${status}' == 'True'
        ${clickStatus} =    Run Keyword And Return Status    SeleniumLibrary.Click Element    ${Element}
    END
