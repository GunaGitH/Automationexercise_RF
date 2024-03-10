*** Settings ***
Library    String
Library    SeleniumLibrary    timeout=60
Library    OperatingSystem
Library    ../rf-utilities/ReadConfig_Properties.py
Resource    ../DriverUtils/SeleniumCommonUtils.robot

*** Variables ***
${homePageBanner}    //section[@id='slider']
${loginBtn}    //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

*** Keywords ***
Verify that home page is visible successfully
    [Arguments]
    Create ExtentNode    Verify that home page is visible successfully
    SeleniumCommonUtils.Page Should Contain Element    ${homePageBanner}    Home Page Banner

Click on 'Signup / Login' button
    Create ExtentNode    Click on 'Signup / Login' button
    SeleniumCommonUtils.Click Element    ${loginBtn}    Signup/Login Btn
