*** Settings ***
Library    ReadConfig_Properties.py
Library    OperatingSystem


*** Variables ***
${PROPERTY FILE PATH}=    rf-config/Config.properties
${WEB_DRIVERS}=    D:\WebDrivers1


*** Keywords ***
Load Config Properties Data
    [Documentation]    KeyWord Wrapper to load the properties file
    &{Load Prop}=    Read Properties    ${PROPERTY FILE PATH}
    
    Set Environment Variable    TEST_TYPE    ${Load Prop}[TestType]
    Set Environment Variable    AUTOMATION_TESTTYPE    ${Load Prop}[TestType]
    
    Set Environment Variable    BROWSER_TYPE    ${Load Prop}[Browser]
    Set Environment Variable    PIPELINE_EXECUTION    ${Load Prop}[PipelineExecution]
    Set Environment Variable    EXECUTION_FILTER     ${Load Prop}[ExecutionFilter]
    Log To Console    Path -----> ${WEB_DRIVERS}
    Append To Environment Variable    ${WEB_DRIVERS}
    Set Environment Variable    TEST_ENV    ${Load Prop}[Env]
    Set Environment Variable    APP_URL    ${Load Prop}[${Load Prop}[Env]_URL]
    #Set Environment Variable    MAIL_URL    ${Load Prop}[MailURL]






















    Log To Console    App Url ->    APP_URL
    IF    "${Load_Prop}[Env]" == "Prod" or "${Load_Prop}[Env]" == "PROD" or "${Load_Prop}[Env]" == "Production"
        Set Environment Variable    TEST_TYPE    'PRODUCTION'
        Set Environment Variable    TEST_DATA_FILE    TestDataSmoke_PROD.xlsx
    ELSE
        Set Environment Variable    TEST_TYPE    'REGRESSION'
        Set Environment Variable    TEST_DATA_FILE    TestDataRegression.xlsx
    END

    [Return]    &{Load Prop}

Update Config Properties For Quotes Template
    [Documentation]    Keyword wrapper to load the properties file
    Load Config Properties Data
    &{Load Prop}=    Read Properties    ${PROPERTY FILE PATH}
    Set Environment Variable    Role    ${Load Prop}[Role]
    Set Environment Variable    NEGATIVE_ROLE    ${Load Prop}[NegativeRole]
    Set Environment Variable    TEMPLATE_ID    ${Load Prop}[TemplateID]
    [Return]    &{Load Prop}
