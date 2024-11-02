*** Settings ***
Library    String
Library    SeleniumLibrary    timeout=60
Library    OperatingSystem
Library    ../rf-utilities/ReadConfig_Properties.py
Resource    ../DriverUtils/SeleniumCommonUtils.robot

*** Variables ***
${logoEle}    //a[@class='logo']

*** Keywords ***
Validate the Logo
    ${mouseOverStatus} =    SeleniumCommonUtils.Mouse Over    ${logoEle}    Logo
    IF    '${mouseOverStatus}' == 'True'
        Write Extent Test Steps On Info    Logo    True    ${logoEle}
    END
    SeleniumCommonUtils.Check Status With Fail    ${mouseOverStatus}    Logo Visigle : ${mouseOverStatus}    True