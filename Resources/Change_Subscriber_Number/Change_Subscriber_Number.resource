*** Settings ***
library    SeleniumLibrary
library    OperatingSystem
Library    ../../Libraries/Yggdrasil.py
Variables    ../Locators.py
Resource    ../Common/Utils.resource

*** Variables ***
${PHONE_NUMBER}

*** Keywords ***
Agregar Numero Manual
    get_actual_frame
    Step    Agregar Numero Manual
    verify_element_is_present    ${CHANGE_NUMBER}[BTN_MANUAL]
    Click Element    ${CHANGE_NUMBER}[BTN_MANUAL]    
    Sleep    2s
    verify_element_is_present    ${CHANGE_NUMBER}[SELECT_NUM_LBL]
    verify_element_is_present    ${CHANGE_NUMBER}[INPUT_MANUAL_NUM]
    Input Text    ${CHANGE_NUMBER}[INPUT_MANUAL_NUM]    ${PHONE_NUMBER}    
    Click Element    ${CHANGE_NUMBER}[SEARCH_MANUAL_NUM]
    ${MANUAL_NUM}    Replace String    ${CHANGE_NUMBER}[VALIDATE_MANUAL_NUM]    {}    ${PHONE_NUMBER}
    verify_element_is_present    ${MANUAL_NUM}
    Click Element    ${MANUAL_NUM}
    Click Element    ${CHANGE_NUMBER}[CONFIRM_MANUAL_NUM_BTN]
    Unselect Frame

Agregar Numero Automatico
    verify_element_is_present    ${CHANGE_NUMBER}[BTN_AUTO]
    Click Element    ${CHANGE_NUMBER}[BTN_AUTO]
    ${PHONE_NUM}=    Get Text    ${CHANGE_NUMBER}[GET_AUTO_NUM]   
    Step    Agregar Numero Automatico ${PHONE_NUM}  
    Sleep    2s

        