*** Settings ***
library    SeleniumLibrary
library    OperatingSystem
library    ../../Libraries/Yggdrasil.py
variables    ../Locators.py
resource    ../Resources/Common/Utils.resource
Resource    ../Change_Subscriber_Number/Change_Subscriber_Number.resource
Resource    ../Change_Subscriber_SIM/Change_Subscriber_SIM.resource

*** Variables ***
${TYPE_PHONE_AND_SIM}
${PHONE_REASON}
${PHONE_COMMENT}

*** Keywords ***
Agregar Numero y SIM a Cliente Nuevo
    log_console_and_log    *** MODULO AGREGAR NUMERO Y SIM *** 
    Scroll Element Into View    //span[text()="Capture tarjeta SIM"]
    Run Keyword If    '${TYPE_PHONE_AND_SIM}'=='MANUAL'    Agregar Numero SIM Manual    
    ...    ELSE IF    '${TYPE_PHONE_AND_SIM}'=='AUTOMATICO'    Agregar Numero SIM Automatico
           
Agregar Numero SIM Manual  
    Agregar Numero Manual
    Agregar SIM Manual

Agregar Numero SIM Automatico  
    Agregar Numero Automatico
    Agregar SIM Automatico

Cambio de Numero
    Agregar Numero Manual
    Run Keyword If    '${CHANGE_SIM}'=='YES'    Agregar SIM en Cambio de Numero
    Unselect Frame
    get_actual_frame
    Scroll Element Into View    ${CHANGE_NUMBER}[DROPDOWN_PHONE_REASON]
    seleccionar_opcion_dropdown    ${CHANGE_NUMBER}[DROPDOWN_PHONE_REASON]    ${PHONE_REASON}
    Step    Motivo de cambio de Numero ${PHONE_REASON}
    Input Text    ${CHANGE_NUMBER}[INPUT_PHONE_REASON]    ${PHONE_COMMENT}
    verify_element_is_present    ${BUTTON}[NEXT]
    Click Element    ${BUTTON}[NEXT]          

Cambio de SIM Card
    Cambio de Tarjeta SIM
    verify_element_is_present    ${BUTTON}[NEXT]
    Click Element    ${BUTTON}[NEXT]   