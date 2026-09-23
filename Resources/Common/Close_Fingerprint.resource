*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../../Libraries/Yggdrasil.py
Variables    ../Locators.py
Resource    ../Resources/Common/Utils.resource

*** Variables ***
${Account} 

*** Keywords ***
Close Fingerprint
   [Documentation]
    ...   This keyword is to Close Fingerprint Window and continue with the Scenario. 
    Close Window
    Switch Window    MAIN
    Run Keyword and Ignore Error    Get_Actual_Frame    
    Step    Validar fingerprint y cerrar ventana
    ${POPUP_FP}=    Run keyword and Return Status    Wait Until Element is Visible    ${CLOSE_FINGERPRINT}[FP_ERROR_MSG]
    Run Keyword If    '${POPUP_FP}'=='True'    Click Element        ${CLOSE_FINGERPRINT}[FP_ERROR_MSG]
    Sleep    2s
    ${Account1}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${CLOSE_FINGERPRINT}[BTN_SELECT]        
    Run Keyword If    '${Account1}'=='True'    Validation Select Account
    Sleep    12s
    Unselect Frame

Validation Select Account
    [Documentation]
    ...   This keyword is to Validate when customer have multiple accounts and select the first match. 
    Step    Select Account          
    ${status}    Run Keyword And Return Status    Run Keyword If    '${Account}' != 'NONE'    Select Account with Number
    Run Keyword If    '${Status}'=='False'    Run Keywords    Wait Until Element Is Visible    ${CLOSE_FINGERPRINT}[BTN_SELECT]        5s
    ...    AND    Click Element        ${CLOSE_FINGERPRINT}[BTN_SELECT]      
    Unselect Frame

Select Account with Number
    [Documentation]
    ...   This keyword is to Select an specific Customer with Account number
    ${Account}=    Convert To String    ${Account}
    ${VALIDATION_NUMBER}=    Replace Values    ${CLOSE_FINGERPRINT}[ACCOUNT_NUMBER]    ${Account}
    Verify_Element_is_Present    ${VALIDATION_NUMBER}
    Click Element    ${VALIDATION_NUMBER}  