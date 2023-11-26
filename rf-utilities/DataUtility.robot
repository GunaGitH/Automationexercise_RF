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

    ${doc_id}=    Generate Random String    4    0123456789

    Open Excel Document    ${TESTDATA FILE PATH}\\${FileName}    ${doc_id}
    @{COLUMN VALUE}  Read Excel Column    col_num=1    sheet_name=${Sheet Name}

    ${ROW COUNT}    Get Length    ${COLUMN VALUE}
    ${TESTDATA ROW NUMBER}=    Get Index From List    ${COLUMN VALUE}    ${Row Name}
    ${TESTDATA ROW NUMBER}=    Evaluate    int(${TESTDATA ROW NUMBER})+1
    @{SELECTED DEVICE VALUE}    Read Excel Row    row_num=${TESTDATA ROW NUMBER}    sheet_name=${Sheet Name}

    @{HEADER ROW VALUE}    Read Excel Row    row_num==1    sheet_name=${Sheet Name}



    &{TEST DATA DICT}=    Convert Two List Into Dictionary    ${HEADER ROW VALUE}    ${SELECTED DEVICE VALUE}
    Close All Excel Documents
    [Return]    &{TEST DATA DICT}

Read Column Data From File
    [Documentation]    Load Column Data from an Excel(.xls) file
    [Arguments]    ${File Name}    ${Sheet Name}    ${Column Name}

    ${doc_id}=    Generate Random String    4    0123456789

    Open Excel Document    ${TESTDATA FILE PATH}\\${FileName}    ${Column Name}
    @{ROW VALUE}    Read Excel Row    row_num=1    sheet_name=${Sheet Name}

    ${COLUMN COUNT}    Get Length    ${ROW VALUE}
    ${TESTDATA COLUMN NUMBER}=    Get Index From List    ${ROW VALUE}    ${Column Name}
    ${TESTDATA COLUMN NUMBER}=    Evaluate    int(${TESTDATA COLUMN NUMBER}) + 1


    @{HEADER COLUMN VALUE}    Read Excel Column    1    sheet_name=${Sheet Name}




    Close All Excel Documents
    [Return]    @{HEADER COLUMN VALUE}


Convert Two List Into Dictionary
 
    [Documentation]    keyword wrapper to convert the two list into dictionary
    [Arguments]    ${LIST1}    ${LIST2}
    
    &{Dict Data}    Create Dictionary

    FOR  ${key}    ${value}  IN ZIP    ${LIST1}    ${LIST2}
        Set To Dictionary    ${Dict Data}    ${Key}    ${Value}
    END
    [Return]    &{Dict Data}

Convert Given String to List Based On Delimiter
    [Documentation]    keyword wrapper to convert string to list base on delimiter
    [Arguments]    ${STRING}    ${SEPARATOR}






    @{DATA LIST}=    Split String    ${STRING}    ${SEPARATOR}
    [Return]    @{DATA LIST}