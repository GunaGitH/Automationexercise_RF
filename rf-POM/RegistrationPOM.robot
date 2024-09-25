*** Settings ***
Library    String
Library    SeleniumLibrary    timeout=60
Library    OperatingSystem
Library    ../rf-utilities/ReadConfig_Properties.py
Resource    ../DriverUtils/SeleniumCommonUtils.robot

*** Variables ***
${homePageBanner}    //section[@id='slider']
${loginBtn}    //a[contains(text(),'Signup / Login')]
${signUpLab}    //h2[contains(text(),'New User Signup!')]
${sighUpName}    //input[@data-qa='signup-name']

*** Keywords ***
Verify that home page is visible successfully
    [Arguments]
    Create ExtentNode    Verify that home page is visible successfully
    SeleniumCommonUtils.Page Should Contain Element    ${homePageBanner}    Home Page Banner

Click on 'Signup / Login' button
    Create ExtentNode    Click on 'Signup / Login' button
    SeleniumCommonUtils.Page Should Contain Element    ${loginBtn}    Signup/Login Btn
    SeleniumCommonUtils.Click Element    ${loginBtn}    Signup/Login Btn

Verify 'New User Signup!'
    Create ExtentNode    Verify 'New User Signup!'
    ${status} =    SeleniumCommonUtils.Page Should Contain Element    ${signUpLab}    Sign Up Lab

Enter name and email address
    [Arguments]    ${name}
    Create ExtentNode    Enter name and email address
    ${mousOverStatus} =    SeleniumCommonUtils.Mouse Over    ${sighUpName}    SignUpName
    IF    '${mousOverStatus}' == 'False'
        Write Extent Test Steps On Fail    Page does not contain Sign Up Name    True
    ELSE
        ${sendKeyStatus} =    SeleniumCommonUtils.Send Keys    ${name}    ${sighUpName}    SignUpName
        SeleniumCommonUtils.Check Status With Fail    ${sendKeyStatus}    SignUpName Value    True
    END

