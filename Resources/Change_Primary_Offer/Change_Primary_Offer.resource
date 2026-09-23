*** Settings ***
library    SeleniumLibrary
library    OperatingSystem
library    ../../Libraries/Yggdrasil.py
variables    ../Locators.py
resource    ../Resources/Common/Utils.resource
resource    ../Resources/Change_Supplementary_Offer/Change_Supplementary_Offer.resource

*** Variables ***
${type_offer}
${type_project}
${primary_offer}
${ADD_SUPP_OFFER}
${REMOVE_SUPP_OFFER}
${DEVICE}
${SEARCH_DEVICE_BY}  
${NEW_DEVICE}
${PERIOD_DEVICE}
${FINANCE_DEVICE}
${BILLING_CYCLE}

*** Keywords ***
Cambio De Oferta Primaria
    [Documentation]    Keyword qque realiza el cambio de oferta primaria, con la posibilidad de agregar o dar de baja una oferta suplementaria y agregar un equipo.
    log_console_and_log    *** MODULO DE CAMBIO DE OFERTA PRIMARIA ***
    get_actual_frame
    Scroll Element Into View    ${CHANGE_PRIMARY_OFFER}[CHANGE_TYPE]
    Seleccionar Opcion Dropdown    ${CHANGE_PRIMARY_OFFER}[CHANGE_TYPE]     ${type_offer}
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[PROJECT_TYPE]
    Step    Seleccionar tipo de cambio ${type_offer}
    Seleccionar Opcion Dropdown    ${CHANGE_PRIMARY_OFFER}[PROJECT_TYPE]     ${type_project}
    Step    Seleccionar tipo de proyecto ${type_project}
    Run Keyword If    '${DEVICE}'=='YES'    Evaluacion Preliminar
    verify_element_is_present    ${BUTTON}[NEXT]
    Step    Click en boton siguiente
    Click Element    ${BUTTON}[NEXT]
    Busqueda de Oferta Primaria
    Detalles de Oferta Primaria
    #Agrega Oferta Suplementaria
    Run Keyword If    '${ADD_SUPP_OFFER}'=='YES'    Seleccionar Oferta Suplementaria
    #Da de baja Oferta Suplementaria
    Run Keyword If    '${REMOVE_SUPP_OFFER}'=='YES'    Dar de baja Oferta Suplementaria    
    #Agrega el Equipo
    Run Keyword If    '${DEVICE}'=='YES'    Seleccion de Oferta de Equipo
    Scroll Element Into View    ${BUTTON}[NEXT]       
    verify_element_is_present    ${BUTTON}[NEXT]
    Step    Click en boton siguiente
    Click Button    ${BUTTON}[NEXT]
    Validar Modulo De Actividad De Promociones
    
Seleccion de Oferta de Equipo
    [Documentation]    Keyword que realiza la seleccion de un equipo, 
    ...    y realiza la verificacion de credito, seleccion de plazo y reserva de recurso.
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[LABEL_DEVICE]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[DEVICE_BUTTON]
    Click Button    ${CHANGE_PRIMARY_OFFER}[DEVICE_BUTTON]
    ${status}    Run Keyword And Return Status    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[CREDIT_CHECK_WARN]
    Run Keyword If    '${status}'=='True'     Verificacion de Credito para Seleccion de Equipo     ${CHANGE_PRIMARY_OFFER}[LOCAL_PRINT_AUTHORIZATION]
    Wait Until Element Is Visible    ${CHANGE_PRIMARY_OFFER}[POP_UP]    ${SYSTEM}[TIMEOUT_20]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[TABLE_DEVICES]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[DROP_ITEM]
    Seleccionar Opcion Dropdown    ${CHANGE_PRIMARY_OFFER}[DROP_ITEM]  ${SEARCH_DEVICE_BY}  
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[INPUT_DEVICE]
    Input Text    ${CHANGE_PRIMARY_OFFER}[INPUT_DEVICE]    ${NEW_DEVICE}
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[SEARCH_DEVICE]
    Step    Busqueda por ${SEARCH_DEVICE_BY} Equipo ${NEW_DEVICE}
    Click Element    ${CHANGE_PRIMARY_OFFER}[SEARCH_DEVICE]
    Seleccionar Equipo
    Run Keyword If    '${FINANCE_DEVICE}'=='YES'    Financiar Equipo
    Reservar Recurso

Evaluacion Preliminar
    [Documentation]    Keyword que realiza la evaluacion preliminar de credito para la seleccion de un equipo
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[EVALUATION_BUTTON]
    Step    Click en boton de Evaluacion Preliminar
    Click Element    ${CHANGE_PRIMARY_OFFER}[EVALUATION_BUTTON]
    ${RENO_POPUP}    Run Keyword and Return Status    verify_element_is_present      ${BUTTON}[OK]
    Run Keyword If    '${RENO_POPUP}'=='True'    Click Element    ${BUTTON}[OK] 
    Verify_Element_is_Present    ${CHANGE_PRIMARY_OFFER}[RESULT_BASIC_CC]
    ${FolioN}    Get Text    ${CHANGE_PRIMARY_OFFER}[FOLIO_NEMONICO]
    Step    El Folio Nemonico es ${FolioN}
    ${ResultadoCC}    Get Text    ${CHANGE_PRIMARY_OFFER}[RESULT_BASIC_CC]
    Step    El Resultado es ${ResultadoCC}
    Verify_Element_is_Present    ${CHANGE_PRIMARY_OFFER}[CLOSE_CREDITCHECK]
    Step    Cerrar Ventana de Credicheck Basica
    Click Button     ${CHANGE_PRIMARY_OFFER}[CLOSE_CREDITCHECK]   
       
Busqueda de Oferta Primaria
    [Documentation]    Componente para Buscar la oferta primaria
    ...    y seleccionar la oferta buscada
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[INPUT_OFFER]
    Input Text    ${CHANGE_PRIMARY_OFFER}[INPUT_OFFER]     ${primary_offer}
    Step    Seleccionar Oferta Primaria ${primary_offer}
    Sleep    3s
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[SEARCH_DEVICE]
    Click Element    ${CHANGE_PRIMARY_OFFER}[SEARCH_DEVICE]
    Sleep   2s
    Click Element If Visible    ${BUTTON}[OK]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[BUTTON_CHOOSE]
    Click Button    ${CHANGE_PRIMARY_OFFER}[BUTTON_CHOOSE]
    Click Element If Visible    ${BUTTON}[OK]
    
Busqueda de Oferta Primaria para Cliente Nuevo
    [Documentation]    Componente para Buscar la oferta primaria
    ...    y seleccionar la oferta buscada
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[PNO_INPUT_OFFER]
    Input Text    ${CHANGE_PRIMARY_OFFER}[PNO_INPUT_OFFER]     ${primary_offer}
    Step    Seleccionar Oferta Primaria ${primary_offer}
    Sleep    3s
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[PNO_SEARCH_BTN]
    Click Element    ${CHANGE_PRIMARY_OFFER}[PNO_SEARCH_BTN]
    Sleep   2s
    Click Element If Visible    ${BUTTON}[OK]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[BUTTON_CHOOSE]
    Click Button    ${CHANGE_PRIMARY_OFFER}[BUTTON_CHOOSE]
    Click Element If Visible    ${BUTTON}[OK]
        
Detalles de Oferta Primaria
    [Documentation]     Valida los Detalles de la Oferta Primaria (PLAN)
    Sleep    3s
    get_actual_frame
    Wait Until Element Is Visible    ${CHANGE_PRIMARY_OFFER}[PLAN_DETAILS]    ${SYSTEM}[TIMEOUT_20]
    Scroll Element Into View    ${CHANGE_PRIMARY_OFFER}[PLAN_DETAILS]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[PLAN_DETAILS]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[SPECS]
    Step    Ingresamos a de Detalles del Plan    

Seleccionar Equipo
    [Documentation]    Keyword que realiza la seleccion de el equipo
    ...    y lo selecciona
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[NAME_DEVICE]
    ${DEVICE_NAME}=    Get Text    ${CHANGE_PRIMARY_OFFER}[NAME_DEVICE]
    Step    Se selecciona el equipo ${DEVICE_NAME}
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[SKU_DEVICE]
    ${DEVICE_SKU}=    Get Text    ${CHANGE_PRIMARY_OFFER}[SKU_DEVICE]
    ${SELECT_DEVICE}=    Replace String    ${CHANGE_PRIMARY_OFFER}[CHOOSE_DEVICE_OFFER]    {}    ${DEVICE_SKU}
    verify_element_is_present    ${SELECT_DEVICE}
    Step    Click en Boton Seleccion de equipo
    Click Element    ${SELECT_DEVICE}

Financiar Equipo
    [Documentation]    Keyword que se ejecuta si la variable del excel de
    ...    finance_device es igual a YES para financiar el equipo
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[BTN_SELECT_DEVICE_SCHEME]
    Step    Click en boton Plazo
    Click Element    ${CHANGE_PRIMARY_OFFER}[BTN_SELECT_DEVICE_SCHEME]
    Wait Until Element Is Visible    ${CHANGE_PRIMARY_OFFER}[FINANCE_EQUIPMENT_FRAME]    timeout=5s
    Step    Seleccionar Plazo de Cotizacion
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[PLAZO_DROPDOWN]
    Seleccionar Opcion Dropdown    ${CHANGE_PRIMARY_OFFER}[PLAZO_DROPDOWN]    ${PERIOD_DEVICE}
    Step    Plazo de financiamiento es ${PERIOD_DEVICE}
    Sleep    5s
    verify_element_is_present    ${BUTTON}[CONFIRM_LEASING]
    Click Element    ${BUTTON}[CONFIRM_LEASING]
    verify_element_is_present      ${CHANGE_PRIMARY_OFFER}[DEVICE_TABLE_TERM]
    ${ARREQ_TABLE}    Get Text    ${CHANGE_PRIMARY_OFFER}[DEVICE_TABLE_TERM]
    log_console_and_log    Tabla de financiamiento: ${ARREQ_TABLE}
    Step    Se Obtiene tabla de Equipo a Plazo

Reservar Recurso
    [Documentation]    Keyword que realiza la reserva de recurso
    Step    Reservar Numero de Recurso
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[RESERVE_BUTTON]
    Click Element    ${CHANGE_PRIMARY_OFFER}[RESERVE_BUTTON]
    Sleep    12s 
    ${RESERVE_IMEI}    Get Text    ${CHANGE_PRIMARY_OFFER}[RESERVE_IMEI]
    log_console_and_log    Numero de recurso: ${RESERVE_IMEI}
    Sleep    12s
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[CONFIRM_DEVICE_BUTTON]
    Click Element    ${CHANGE_PRIMARY_OFFER}[CONFIRM_DEVICE_BUTTON]
    Step    Validar Mensaje de Soporte de ESim
    ${ESIM_WARNING}    Run Keyword And Return Status    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[ESIM_WARNING]
    Run Keyword If    '${ESIM_WARNING}'=='True'    Click Element    ${CHANGE_PRIMARY_OFFER}[ESIM_BUTTON_OK]
    Step    Validar Asignacion de SEGURO TELCEL UP RENTA
    ${TELCEL_UP_WARNING}    Run Keyword And Return Status    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[TELCEL_UP_WARNING]
    Run Keyword If    '${TELCEL_UP_WARNING}'=='True'    Click Element    ${CHANGE_PRIMARY_OFFER}[TELCEL_UP_CLOSE_POPUP]
    Sleep    2s
    Step    Obtener Telcel UP asignado
    ${TELCEL_UP_ASSIGN}=    Run Keyword And Return Status    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[TELCEL_UP_ASIGNADO]
    Run Keyword If    '${TELCEL_UP_ASSIGN}'=='True'    Click Element    ${CHANGE_PRIMARY_OFFER}[TELCEL_UP_CLOSE_POPUP]
    Sleep    2s

 Verificacion de Credito para Seleccion de Equipo
    [Documentation]    Keyword que realiza la verificacion de credito para la seleccion de un equipo
    [Arguments]    ${l_authorization}    
    verify_element_is_present    ${BUTTON}[OK_BUTTON]
    Click Element    ${BUTTON}[OK_BUTTON]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[CREDIT_CHECK_BUTTON]
    Click Button    ${CHANGE_PRIMARY_OFFER}[CREDIT_CHECK_BUTTON]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[POP_UP]
     ${FolioN}    Get Text    ${CHANGE_PRIMARY_OFFER}[FOLIO_NEMONICO]
    Step    El Folio Nemonico es: ${FolioN}
    ${ResultadoCC}    Get Text    ${CHANGE_PRIMARY_OFFER}[RESULT_BASIC_CC]
    Step    El Resultado es: ${ResultadoCC}
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[CREDIT_CHECK_BUTTON_2]
    Click Button    ${CHANGE_PRIMARY_OFFER}[CREDIT_CHECK_BUTTON_2]
    verify_element_is_present    ${BUTTON}[OK]
    Click Element    ${BUTTON}[OK]
    Sleep    5s
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[CLOSE_CREDIT_CHECK]
    Click Button    ${CHANGE_PRIMARY_OFFER}[CLOSE_CREDIT_CHECK]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[CONFIRM_CREDIT_CHECK]
    Click Button    ${CHANGE_PRIMARY_OFFER}[CONFIRM_CREDIT_CHECK]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[LABEL_DEVICE]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[DEVICE_BUTTON]
    Click Button    ${CHANGE_PRIMARY_OFFER}[DEVICE_BUTTON]

Validar Modulo De Actividad De Promociones
    [Documentation]    Keyword que valida si se muestra el modulo de actividad de promociones
    ${PROMOTION_MODULE}    Run Keyword and Return Status    verify_element_is_present     ${CHANGE_PRIMARY_OFFER}[PROMO_POPUP]     
    Run Keyword If    '${PROMOTION_MODULE}'=='True'    verify_element_is_present    ${BUTTON}[CONFIRM] 
    Step    Popup Modulo de Actividad de Promociones 
    Sleep    5s
    verify_element_is_present    ${BUTTON}[CONFIRM]
    Step    Se Obtienen las Promociones Disponibles
    Sleep    2s
    Step    Click en boton confirmar
    Click Element    ${BUTTON}[CONFIRM]

Agregar Informacion de la Cuenta
    Scroll Element Into View    ${BUTTON}[ADD_ACCOUNT]
    Step    Agregar Informacion de la cuenta
    Click Element    ${BUTTON}[ADD_ACCOUNT]
    Wait Until Element Is Visible    ${CHANGE_PRIMARY_OFFER}[DROPDOWN_BILLING_CYCLE]    timeout=5s
    Seleccionar Opcion Dropdown    ${CHANGE_PRIMARY_OFFER}[DROPDOWN_BILLING_CYCLE]    ${BILLING_CYCLE}
    Step    Agregar Ciclo de facturacion ${BILLING_CYCLE}
    Scroll Element Into View    ${CHANGE_PRIMARY_OFFER}[BILL_BTN]
    Click Element    ${CHANGE_PRIMARY_OFFER}[BILL_BTN]
    verify_element_is_present    ${CHANGE_PRIMARY_OFFER}[VALIDATE_BILL]
    Click Element    ${CHANGE_PRIMARY_OFFER}[CONFIRM_BILL_BTN]
    Scroll Element Into View    ${BUTTON}[CONFIRM]
    Click Element    ${BUTTON}[CONFIRM]

