*** Settings ***
library    SeleniumLibrary
library    OperatingSystem
library    ../../Libraries/Yggdrasil.py
variables    ../Locators.py
resource    ../Resources/Common/Utils.resource
Resource    ../Change_Primary_Offer/Change_Primary_Offer.resource

*** Variables ***
${AUTHORIZATION_TYPE}
${TYPE_PROCEDURE}

*** Keywords ***
Migracion Pospago Sin Equipo
    [Documentation]    Modulo de Migracion para Abierto a Controlado
    ...    y Controlado a Abierto
    log_console_and_log    *** MIGRATION COMPONENT ***
    get_actual_frame
    Sleep    2s
    Scroll Element Into View    ${CHANGE_PRIMARY_OFFER}[CHANGE_TYPE]
    Seleccionar Opcion Dropdown    ${CHANGE_PRIMARY_OFFER}[CHANGE_TYPE]     ${type_offer}
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[PROJECT_TYPE]
    Step    Seleccionar tipo de cambio ${type_offer}
    Seleccionar Opcion Dropdown    ${CHANGE_PRIMARY_OFFER}[PROJECT_TYPE]     ${type_project}
    Step    Seleccionar tipo de proyecto ${type_project}
    Evaluacion Preliminar
    verify_element_is_present    ${BUTTON}[NEXT]
    Step    Click en boton siguiente
    Click Element    ${BUTTON}[NEXT]
    Busqueda de Oferta Primaria
    Detalles de Oferta Primaria
    Run Keyword If    '${DEVICE}'=='YES'    Seleccion de Oferta de Equipo
    Scroll Element Into View    ${BUTTON}[NEXT]       
    verify_element_is_present    ${BUTTON}[NEXT]
    Step    Click en boton siguiente
    Click Button    ${BUTTON}[NEXT]
    Validar Modulo De Actividad De Promociones
    Click Element If Visible    ${BUTTON}[CONTINUAR]
    Verificacion de Credito Final Migraciones
    
Verificacion de Credito Final Migraciones
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${CHANGE_PRIMARY_OFFER}[CLOSE_CREDITCHECK]    timeout=30s
    Verify_Element_is_Present    ${CHANGE_PRIMARY_OFFER}[CLOSE_CREDITCHECK]
    Step     Verificacion final de Credito
    ${FolioNFinal}    Get Text    ${CHANGE_PRIMARY_OFFER}[FOLIO_NEMONICO_FINAL]
    Step    Obtencion de Folio Nemonico Final ${FolioNFinal}
    ${ResultadoCCFInal}    Get Text    ${CHANGE_PRIMARY_OFFER}[RESULT_FINAL_CC]
    Step   Resultado Final de Verificacion de Credito ${ResultadoCCFInal}
    Sleep    4s
    Step    Cerrar Verificacion de Credito Final en Migraciones
    click_con_JS    ${CHANGE_PRIMARY_OFFER}[CLOSE_CREDITCHECK]
         
Migracion Prepago Sin Equipo
    [Documentation]    Modulo de Migracion para Prepago a Abierto
    ...    Prepago a Controlado
    log_console_and_log    *** MIGRATION COMPONENT PREPAID***
    get_actual_frame
    Sleep    2s
    Agregar Informacion de la Cuenta
    Scroll Element Into View    ${CHANGE_PRIMARY_OFFER}[TERM]
    Seleccionar Opcion Dropdown    ${CHANGE_PRIMARY_OFFER}[TERM]     ${type_offer}
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[PROJECT_TYPE]
    Step    Seleccionar tipo de cambio ${type_offer}
    Seleccionar Opcion Dropdown    ${CHANGE_PRIMARY_OFFER}[PROJECT_TYPE]     ${type_project}
    Step    Seleccionar tipo de proyecto ${type_project}
    ${AUTH_TYPE}=    Replace String    ${CHANGE_PRIMARY_OFFER}[AUTH_RADIO_BTN]    {}    ${AUTHORIZATION_TYPE}
    Step    Seleccionar tipo de Autorizacion ${AUTHORIZATION_TYPE}
    Click Element    ${AUTH_TYPE}
    Evaluacion Preliminar
    verify_element_is_present    ${BUTTON}[NEXT]
    Step    Click en boton siguiente
    Click Element    ${BUTTON}[NEXT]
    Busqueda de Oferta Primaria
    Detalles de Oferta Primaria
    Run Keyword If    '${DEVICE}'=='YES'    Seleccion de Oferta de Equipo
    Scroll Element Into View    ${BUTTON}[NEXT]       
    verify_element_is_present    ${BUTTON}[NEXT]
    Step    Click en boton siguiente
    Click Button    ${BUTTON}[NEXT]
    Validar Modulo De Actividad De Promociones
    Click Element If Visible    ${BUTTON}[CONTINUAR]
    Verificacion de Credito Final Migraciones

Migracion Pospago a Prepago Sin Equipo
    [Documentation]    Modulo de Migracion para Abierto a Controlado
    ...    y Controlado a Abierto
    log_console_and_log    *** MIGRATION COMPONENT ***
    get_actual_frame
    Sleep    2s
    ${ACCOUNT_PAYMENTS}=    Run Keyword And Return Status    verify_element_is_present    ${MIGRATIONS}[OUTSTANDING_PAYMENTS_FRAME]
    Run Keyword If    '${ACCOUNT_PAYMENTS}'=='True'    Popup Pagos Pendientes de la Cuenta
    Tipo de Tramite
    Busqueda de Oferta Primaria
    Detalles de Oferta Primaria
    Run Keyword If    '${DEVICE}'=='YES'    Seleccion de Oferta de Equipo
    Scroll Element Into View    ${BUTTON}[NEXT]       
    verify_element_is_present    ${BUTTON}[NEXT]
    Step    Click en boton siguiente
    Click Button    ${BUTTON}[NEXT]

Popup Pagos Pendientes de la Cuenta
    Sleep    2s
    Step    Validar Ventana de Pagos pendientes de la cuenta
    ${PENALTY}    Get Text    ${MIGRATIONS}[PENALTY]
    Log To Console    Se Obtienen la Penalidad ${PENALTY}
    ${OUTSTANDING_AMOUNT}    Get Text    ${MIGRATIONS}[OUTSTANDING_AMOUNT]
    Log To Console    Se Obtienen la Monto Pendiente de Pago ${OUTSTANDING_AMOUNT}
    ${TOTAL_TO_PAY}    Get Text    ${MIGRATIONS}[TOTAL_TO_PAY]
    Log To Console    Se Obtienen la Total a Pagar ${TOTAL_TO_PAY}
    ${LOYALTY_POINTS}    Get Text    ${MIGRATIONS}[LOYALTY_POINTS]
    Log To Console    Se Obtienen la Puntos de lealtad ${LOYALTY_POINTS}
    Step    Click en boton Continuar
    Click Element    ${BUTTON}[CONTINUE]

Tipo de Tramite
    get_actual_frame
    Wait Until Element Is Visible    ${MIGRATIONS}[LBL_TRAMIT]    timeout=20s
    ${TYPE_OF_PROCEDURE}=    Replace String    ${MIGRATIONS}[PROCEDURE_RADIO_BTN]    {}    ${TYPE_PROCEDURE}
    Step    Seleccionar tipo de Tramite ${TYPE_PROCEDURE}
    Click Element    ${TYPE_OF_PROCEDURE}

    