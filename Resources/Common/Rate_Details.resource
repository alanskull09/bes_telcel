*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../../Libraries/Yggdrasil.py 
Variables    ../Locators.py
Resource    ../Resources/Common/Utils.resource

*** Variables ***
${OBSERVATIONS} 

*** Keywords ***
Resumen de Detalles de Tarifa
    [Documentation]    Muestra el resumen de Detalles de Tarifa
    ...    Confirma la gestion de la operacion exitosa y obtiene el numero de orden
    log_console_and_log    *** MODULO DE DETALLES DE TARIFA ***
    get_actual_frame
    Sleep    5s
    Step    Modulo de Detalles de tarifa
    Wait Until Element Is Visible    ${DETAILS}[TXT_TITLE]     40s
    verify_element_is_present   ${DETAILS}[TXT_TITLE]
    verify_element_is_present    ${DETAILS}[TXT_TOTAL]
    verify_element_is_present    ${DETAILS}[AMOUNT] 
    ${Amount}    Get Text    ${DETAILS}[AMOUNT]
    Step    Validamos monto de detalles de tarifa es ${Amount}
    Scroll Element Into View    ${BUTTON}[NEXT]
    Click Element    ${BUTTON}[NEXT]
    Step  Confirmar Gestion de la Operacion Exitosa
    verify_element_is_present    ${CONFIRMATION}[SUCCESS]
    verify_element_is_present    ${SEARCH_ORDER}[ORDER_NUMBER]
    ${OrderId}    Get Text    ${SEARCH_ORDER}[ORDER_NUMBER]
    Step    Obtenemos el numero de Orden ${OrderId}

Resumen de Detalles de Tarifa con Observaciones Cliente Nuevo
    [Documentation]    Muestra el resumen de Detalles de Tarifa
    ...    Confirma la gestion de la operacion exitosa y obtiene el numero de orden
    log_console_and_log    *** MODULO DE DETALLES DE TARIFA ***
    get_actual_frame
    Sleep    5s
    Step    Modulo de Detalles de tarifa
    Wait Until Element Is Visible    ${DETAILS}[TXT_TITLE]     40s
    verify_element_is_present   ${DETAILS}[TXT_TITLE]
    verify_element_is_present    ${DETAILS}[TXT_TOTAL]
    verify_element_is_present    ${DETAILS}[INPUT_OBSERVATIONS]
    Input Text    ${DETAILS}[INPUT_OBSERVATIONS]    ${OBSERVATIONS}
    Step    Se agrega comentario de detalle de tarifa ${OBSERVATIONS}     
    verify_element_is_present    ${DETAILS}[AMOUNT] 
    ${AMOUNT}    Get Text    ${DETAILS}[AMOUNT]
    Step    Validamos monto de detalles de tarifa es ${AMOUNT}
    Scroll Element Into View    ${BUTTON}[NEXT]
    Click Element    ${BUTTON}[NEXT]
    Step  Confirmar Gestion de la Operacion Exitosa
    verify_element_is_present    ${CONFIRMATION}[SUCCESS]
    verify_element_is_present    ${SEARCH_ORDER}[ORDER_NUMBER]
    ${ORDERID}    Get Text    ${SEARCH_ORDER}[ORDER_NUMBER]
    ${SIM_ASIGNADO}    Get Text    ${SEARCH_ORDER}[SIM_ASSIGNED]
    Step    Obtenemos el numero de Orden ${ORDERID}
    Step    Obtenemos la SIM Asignada de Orden ${SIM_ASIGNADO}