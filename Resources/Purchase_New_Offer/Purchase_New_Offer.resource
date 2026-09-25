*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../../Libraries/Yggdrasil.py
Variables  ../Locators.py
Resource   ../Resources/Common/Utils.resource
Resource   ../Resources/Change_Primary_Offer/Change_Primary_Offer.resource
Resource   ../Common/Number_and_SIM.resource

*** Variables ***
${SCHEME}
${SEARCH_VALUE}
${NAME_R1} 
${LAST_R1}
${PHONE_R1}
${NAME_R2}
${LAST_R2}
${PHONE_R2}
${BILLING_CYCLE}
${PLAZO}
${TYPE_DOC}

*** Keywords ***
Cliente Nuevo Pospago Sin Equipo
    Ingresar Datos De Cliente Nuevo
    Agregar Oferta Primaria Cliente Nuevo
    Seleccionar Documento Cliente Nuevo
    Validar Modulo De Actividad De Promociones
    Verificacion de Credito Final Cliente Nuevo

Ingresar Datos De Cliente Nuevo
    Seleccionar Esquema De Cliente Nuevo
    Ingresar CURP cliente nuevo
    Agregar Informacion de Contacto Cliente Nuevo
    Agregar Informacion de la Cuenta Cliente Nuevo
    Llenar Informacion de Credito Basico Cliente Nuevo

Agregar Oferta Primaria Cliente Nuevo
    Busqueda de Oferta Primaria para Cliente Nuevo
    Detalles de Oferta Primaria
    Run Keyword If    '${DEVICE}'=='YES'    Seleccion de Oferta de Equipo
    Agregar Numero y SIM a Cliente Nuevo   

Seleccionar Esquema De Cliente Nuevo
    get_actual_frame
    verify_element_is_present    ${PNO}[TIPO_ACTIVACION_FRAME]
    ${ACTIVATION_TYPE}=    Replace String    ${PNO}[TIPO_ACTIVACION_OPCION]    {}    ${SCHEME}
    Click Element    ${ACTIVATION_TYPE}
    Step    Seleccionar TIPO DE ACTIVACION ${SCHEME}
    verify_element_is_present    ${BUTTON}[NEXT] 
    Click Element    ${BUTTON}[NEXT]

Ingresar CURP cliente nuevo
    verify_element_is_present    ${PNO}[LBL_VERIFICACION_CLIENTE]
    verify_element_is_present    ${PNO}[INPUT_CURP]
    Input Text    ${PNO}[INPUT_CURP]    ${SEARCH_VALUE}
    verify_element_is_present    ${PNO}[BTN_CONSULTAR]
    Click Element    ${PNO}[BTN_CONSULTAR]    
    Sleep    2s
    verify_element_is_present    ${PNO}[LBL_CLIENTE_EXITOSO]
    Step    Ingresar CURP ${SEARCH_VALUE}

Agregar Informacion de Contacto Cliente Nuevo
    Scroll Element Into View    ${PNO}[ADD_CONTACT_BTN]
    Step    Click en boton Agregar informacion de contacto
    Click Element    ${PNO}[ADD_CONTACT_BTN]    
    Sleep    2s
    Seleccionar Opcion Dropdown    ${PNO}[DROPDOWN_CONTACT_INFO]    texto_opcion=Persona para Referencias 1
    Input Text    ${PNO}[CONTACT_INFO_NAME]    ${NAME_R1}
    Input Text    ${PNO}[CONTACT_INFO_LASTNAME]    ${LAST_R1}
    Input Text    ${PNO}[CONTACT_INFO_PHONE]    ${PHONE_R1}
    Step    Referencia 1 Nombre ${NAME_R1} ${LAST_R1} Contacto ${PHONE_R1}
    Click Element    ${PNO}[BTN_CONFIRM_CONTACT_INFO]
    Sleep    4s
    Click Element    ${PNO}[ADD_CONTACT_BTN]
    Seleccionar Opcion Dropdown    ${PNO}[DROPDOWN_CONTACT_INFO]    texto_opcion=Persona para Referencias 2
    Input Text    ${PNO}[CONTACT_INFO_NAME]    ${NAME_R2}
    Input Text    ${PNO}[CONTACT_INFO_LASTNAME]    ${LAST_R2}
    Input Text    ${PNO}[CONTACT_INFO_PHONE]    ${PHONE_R2}
    Step    Referencia 2 Nombre ${NAME_R2} ${LAST_R2} Contacto ${PHONE_R2}
    Click Element    ${PNO}[BTN_CONFIRM_CONTACT_INFO]
    Sleep    2s

Agregar Informacion de la Cuenta Cliente Nuevo
    Scroll Element Into View    ${PNO}[ADD_ACCOUNT_INFO_BTN]
    Step    Agregar Informacion de la cuenta
    Click Element    ${PNO}[ADD_ACCOUNT_INFO_BTN]
    Sleep    6s
    Seleccionar Opcion Dropdown    ${PNO}[DROPDOWN_BILLING_CYCLE]    ${BILLING_CYCLE}
    Step    Agregar Ciclo de facturacion ${BILLING_CYCLE}
    Scroll Element Into View    ${PNO}[BILL_BTN]
    Click Element    ${PNO}[BILL_BTN]
    verify_element_is_present    ${PNO}[VALIDATE_BILL]
    Click Element    ${PNO}[CONFIRM_BILL_BTN]
    Click Element    ${PNO}[BTN_CONFIRM_CONTACT_INFO]

Llenar Informacion de Credito Basico Cliente Nuevo
    Scroll Element Into View    ${BUTTON}[NEXT]
    Seleccionar Opcion Dropdown    ${PNO}[PLAZO]    ${PLAZO}
    Step    Seleccion de plazo ${PLAZO}
    verify_element_is_present    ${PNO}[PROJECT_TYPE]
    Seleccionar Opcion Dropdown    ${PNO}[PROJECT_TYPE]     ${type_project}
    Step    Seleccion de tipo de proyecto ${type_project}   
    verify_element_is_present    ${PNO}[CUESTIONARIO]
    Step    Seleccionar tipo de Autorizacion Cuestionario
    Click Element    ${PNO}[CUESTIONARIO]
    
    # --- 1. VALIDACIÓN FINGER PRINT (ABE) CORREGIDA ---
    Step    Invocar ABE para validacion de huella
    Sleep    3s    
    ${XPATH_ABE}    Set Variable    xpath=//span[contains(normalize-space(), 'Invocar ABE')]
    Scroll Element Into View         ${XPATH_ABE}
    Wait Until Element Is Visible    ${XPATH_ABE}    timeout=15s
    Wait Until Element Is Enabled    ${XPATH_ABE}    timeout=15s
    click_con_JS    ${XPATH_ABE}
    
    Sleep    2s
    Switch Window                    NEW
    Close Window
    Switch Window                    MAIN
    
    ${XPATH_OK}    Set Variable    xpath=//div[contains(@class, 'msgbox-ok-text') and contains(normalize-space(), 'OK')]
    Wait Until Element Is Visible    ${XPATH_OK}    timeout=15s
    click_con_JS    ${XPATH_OK}
    Sleep    3s    
    # ----------------------------------------
    
    # --- 2. CLIC EXCLUSIVO EN EL BOTON SIGUIENTE CORREGIDO ---
    Step    Click en el boton Siguiente post-ABE
    Scroll Element Into View         id=btn_next
    Wait Until Element Is Visible    id=btn_next    timeout=15s
    Wait Until Element Is Enabled    id=btn_next    timeout=15s
    click_con_JS    id=btn_next
    # --------------------------------------------------------
    
    Credicheck Basico Cliente Nuevo

Credicheck Basico Cliente Nuevo
    ${VERIFICACION_POPUP}    Run Keyword and Return Status    verify_element_is_present      ${BUTTON}[OK]
    Run Keyword If    '${VERIFICACION_POPUP}'=='True'    Click Element    ${BUTTON}[OK]    
    Click Button       ${PNO}[CREDIT_VERIFICATION_BUTTON]
    Sleep    2s
    Step    Se Obtiene el Resultado del Credicheck Basico
    Verify_Element_is_Present    ${PNO}[CREDIT_VERIFICATION_RESULT]
    ${FolioN}    Get Text    ${PNO}[FOLIO_NEMONICO]
    log_console_and_log    El Folio Nemonico es: ${FolioN}
    ${ResultadoCC}    Get Text    ${PNO}[RESULT_BASIC_CC]
    log_console_and_log    El Resultado es: ${ResultadoCC}
    Verify_Element_is_Present    ${PNO}[CLOSE_CREDITCHECK]
    Step    Cerrar Informacion Basica Credicheck
    Click Button     ${PNO}[CLOSE_CREDITCHECK]  
    Verify_Element_is_Present   ${BUTTON}[NEXT] 
    Step    Click en boton siguiente
    Click Button     ${BUTTON}[NEXT]
    Sleep    5s   

Seleccionar Documento Cliente Nuevo   
    verify_element_is_present    ${PNO}[DROPDOWN_TIPO_DOC]
    Step    LLenar la Informacion del ID
    Seleccionar Opcion Dropdown    ${PNO}[DROPDOWN_TIPO_DOC]    ${TYPE_DOC}
    Step    Seleccion de tipo de documento ${TYPE_DOC}
    verify_element_is_present    ${PNO}[INPUT_NEW_ID]
    ${ID_DOC}    Generar_IDMEX_aleatorio_cliente_nuevo
    Input Text    ${PNO}[INPUT_NEW_ID]    ${ID_DOC}
    Step    Generacion de ${ID_DOC}
    Scroll Element Into View    ${BUTTON}[NEXT]
    Click Element    ${BUTTON}[NEXT]

Generar_IDMEX_aleatorio_cliente_nuevo
    ${DIGITOS}    Generate Random String    8    [NUMBERS]
    ${ID_IDMEX}    Set Variable    IDMEX${DIGITOS}
    RETURN    ${ID_IDMEX}    

Validar Modulo De Actividad De Promociones
    Step    Validar Modulo de Actividad de Promociones
    Wait Until Element Is Visible    xpath=//span[@title='NINGUNO']    timeout=10s
    Click Element                    xpath=//span[@title='NINGUNO']

Verificacion de Credito Final Cliente Nuevo
    Click Element If Visible    ${BUTTON}[CONTINUAR]
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