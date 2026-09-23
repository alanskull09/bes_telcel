*** Settings ***
library    SeleniumLibrary
library    OperatingSystem
Library    ../../Libraries/Yggdrasil.py
Variables    ../Locators.py
Resource    ../Common/Utils.resource

*** Variables ***
${SIM}
${SIM_TYPE}
${SIM_MODE}
${SIM_WAREHOUSE}
${SIM_REASON}
${SIM_COMMENT}

*** Keywords ***
Agregar SIM Manual
    get_actual_frame
    Sleep    2s
    Scroll Element Into View    ${BUTTON}[NEXT]
    Step    Seleccionar SIM Manual
    Click Element    ${CHANGE_SIM}[MANUAL_SIM_BTN]
    Sleep    2s
    verify_element_is_present    ${CHANGE_SIM}[INPUT_MANUAL_SIM]
    Input Text    ${CHANGE_SIM}[INPUT_MANUAL_SIM]    ${SIM}
    verify_element_is_present    ${CHANGE_SIM}[VERIFY_SIM_CARD]
    Click Element    ${CHANGE_SIM}[VERIFY_SIM_CARD]    
    Sleep    2s
    Step    Validar Ventana SIM disponible
    verify_element_is_present    ${CHANGE_SIM}[POPUP_SIM_DISPONIBLE]
    Click Element    ${CHANGE_SIM}[OK_SIM_DISPONIBLE]
    Sleep    2s
    Click Element    ${BUTTON}[NEXT]         
     
Agregar SIM Automatico
    get_actual_frame
    Sleep    2s
    Scroll Element Into View    ${BUTTON}[NEXT]
    verify_element_is_present    ${CHANGE_SIM}[SIM_AUTO_BTN]
    Click Element    ${CHANGE_SIM}[SIM_AUTO_BTN]
    Scroll Element Into View    ${BUTTON}[NEXT] 
    Sleep    2s
    verify_element_is_present    ${CHANGE_SIM}[SIM_WAREHOUSE_DROPDOWN]
    Seleccionar Opcion Dropdown    ${CHANGE_SIM}[SIM_WAREHOUSE_DROPDOWN]    ${SIM_WAREHOUSE}    
    verify_element_is_present    ${CHANGE_SIM}[SIM_TYPE_DROPDOWN]
    Seleccionar Opcion Dropdown    ${CHANGE_SIM}[SIM_TYPE_DROPDOWN]    ${SIM_TYPE}    
    Step    Seleccionar SIM Automatico Almacen ${SIM_WAREHOUSE} Tipo ${SIM_TYPE}
    ${BTN_VERIFY_OFFER}    Run Keyword And Return Status    verify_element_is_present    ${CHANGE_SIM}[VERIFY_OFFER_BTN]
    Run Keyword If    '${BTN_VERIFY_OFFER}' == 'True'
    ...    Run Keywords
    ...    Step    Validar Boton de Verificar Oferta de Equipo
    ...    AND
    ...    Click Element    ${CHANGE_SIM}[VERIFY_OFFER_BTN]
    Click Element    ${BUTTON}[NEXT] 

Agregar SIM en Cambio de Numero
    get_actual_frame
    Sleep    2s
    ${CHANGE_SIM_CARD}    Replace String    ${BUTTON}[RADIO_BTN]    {}    ${CHANGE_SIM}
    Step    Click en Cambio de SIM ${CHANGE_SIM}
    Click Element    ${CHANGE_SIM_CARD}
    Wait Until Element Is Visible    ${CHANGE_SIM}[LBL_CHANGE_SIM]    timeout=10s
    ${CHANGE_SIM_MODE}    Replace String    ${BUTTON}[RADIO_BTN]    {}    ${SIM_MODE}
    Step    Click en Cambiar Tarjeta SIM Anterior ${SIM_MODE}
    Click Element    ${CHANGE_SIM_MODE}
    Run Keyword If    '${SIM_MODE}'=='Manual'    Input SIM Manual
    Run Keyword If    '${SIM_MODE}'=='Automático'    Input SIM Automatico
    
Cambio de Tarjeta SIM
    Sleep    5s
    Unselect Frame
    get_actual_frame
    ${CHANGE_SIM_MODE}    Replace String    ${BUTTON}[RADIO_BTN]    {}    ${SIM_MODE}
    Step    Click en Cambiar Tarjeta SIM Anterior ${SIM_MODE}
    Click Element    ${CHANGE_SIM_MODE}
    Run Keyword If    '${SIM_MODE}'=='Manual'    Input SIM Manual
    Run Keyword If    '${SIM_MODE}'=='Automático'    Input SIM Automatico
    
Input SIM Manual
    Step    Agregar SIM Manual
    verify_element_is_present    ${CHANGE_SIM}[INPUT_MANUAL_SIM]
    Input Text    ${CHANGE_SIM}[INPUT_MANUAL_SIM]    ${SIM}
    verify_element_is_present    ${CHANGE_SIM}[VERIFY_SIM_CARD]
    Click Element    ${CHANGE_SIM}[VERIFY_SIM_CARD]    
    Sleep    2s
    Step    Validar Ventana SIM disponible
    verify_element_is_present    ${CHANGE_SIM}[POPUP_SIM_DISPONIBLE]
    Click Element    ${CHANGE_SIM}[OK_SIM_DISPONIBLE]
    Sleep    2s
    Motivo Cambio de Tarjeta
    
Input SIM Automatico
    Step    Agregar SIM Automatico
    Sleep    2s
    verify_element_is_present    ${CHANGE_SIM}[SIM_WAREHOUSE_DROPDOWN]
    Seleccionar Opcion Dropdown    ${CHANGE_SIM}[SIM_WAREHOUSE_DROPDOWN]    ${SIM_WAREHOUSE}    
    verify_element_is_present    ${CHANGE_SIM}[SIM_TYPE_DROPDOWN]
    Seleccionar Opcion Dropdown    ${CHANGE_SIM}[SIM_TYPE_DROPDOWN]    ${SIM_TYPE}    
    Step    Seleccionar SIM Automatico Almacen ${SIM_WAREHOUSE} Tipo ${SIM_TYPE}
    Sleep    2s
    Motivo Cambio de Tarjeta

Motivo Cambio de Tarjeta
    Scroll Element Into View    ${CHANGE_SIM}[LBL_REASON_CHANGE_SIM]
    seleccionar_opcion_dropdown    ${CHANGE_SIM}[DROPDOWN_SIM_REASON]    ${SIM_REASON}
    Step    Motivo de cambio de tarjeta SIM ${SIM_REASON}
    Input Text    ${CHANGE_SIM}[INPUT_SIM_REASON]    ${SIM_COMMENT}