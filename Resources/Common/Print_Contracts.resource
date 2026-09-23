*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../../Libraries/Yggdrasil.py 
Variables    ../Locators.py
Resource    ../Resources/Common/Utils.resource

*** Variables ***
${print_reason}

*** Keywords ***

Generar Contrato Digital
    [Documentation]
    ...    Genera el contrato digital de la operacion realizada
    ...    *NOTE : This Gherkin component could be used for all the scripts*
    Wait Until Element Is Not Visible    ${SYSTEM}[LOADING_2]    10s
    ${status}  Run Keyword And Return Status    Set Focus To Element    ${PRINT_CONTRACT}[DIGITAL]
    Run Keyword If    ${status}==True   Run Keywords    verify_element_is_present    ${PRINT_CONTRACT}[GENERATE_DIGITAL]
    ...    AND    Click Element    ${PRINT_CONTRACT}[GENERATE_DIGITAL]
    ...    AND    Step  Seleccionar contrato digital
    ...    AND    Contrato No Encontrado
    ...    AND    Autorizacion Digital
    ...    AND    Mensaje de Error Esperado Impresion de Contrato Local
    Unselect Frame

Contrato No Encontrado
    [Documentation]
    FOR    ${index}    IN RANGE    1    500    
        ${status}  Run Keyword And Return Status    Set Focus To Element    ${PRINT_CONTRACT}[NOT_FOUND]
        Run Keyword If    '${status}'=='True'    Run Keywords    Click Element    ${PRINT_CONTRACT}[OK_BTN_CONTRACT]
        ...    AND    Verify_Element_is_Present    ${PRINT_CONTRACT}[GENERATE_DIGITAL]
        ...    AND    Click Element    ${PRINT_CONTRACT}[GENERATE_DIGITAL]
        Run Keyword If    '${status}'=='False'    Exit For Loop  
    END

Autorizacion Digital
    Switch Window    NEW    ${SYSTEM}[TIMEOUT_30]    
    Step    Cerrar Ventana Contrato Digital
    Close Window 
    Switch Window    MAIN
    Unselect Frame
    Sleep    2s
    Get_Actual_Frame

Mensaje de Error Esperado Impresion de Contrato Local
    Step    Validar Mensaje De Error Esperado de Impresion Digital
    verify_element_is_present      ${PRINT_CONTRACT}[MESSAGE_ERROR]
    verify_element_is_present      ${PRINT_CONTRACT}[BTN_CONFIRM_ERROR]
    Click Element      ${PRINT_CONTRACT}[BTN_CONFIRM_ERROR]

Impresion de Contrato Local
    [Documentation]
    ...    Imprime el contrato de manera Local
    Wait Until Element Is Not Visible    ${SYSTEM}[LOADING_2]    10s
    get_actual_frame
    verify_element_is_present    ${PRINT_CONTRACT}[LOCAL_RADIOBUTTON]
    Click Element    ${PRINT_CONTRACT}[LOCAL_RADIOBUTTON]
    verify_element_is_present    ${PRINT_CONTRACT}[REASON]
    seleccionar_opcion_dropdown    ${PRINT_ORDER}[DROPDOWN]    ${print_reason}
    Step  Seleccionar Impresion local motivo ${print_reason}
    verify_element_is_present    ${BUTTON}[CONFIRM]
    click_element    ${BUTTON}[CONFIRM]
    Cerrar Impresion de Contrato Local

Cerrar Impresion de Contrato Local
    Switch Window    Página de portal BES    #MAIN
    Sleep    1s
    Mouse Over    ${PRINT_ORDER}[PRINT_TAB_2]
    Click Element    ${PRINT_ORDER}[CLOSE_PRINT_TAB]    
    Step   Cerramos la impresion de contrato Local
    Regresar a la ventana de Detalles de Tarifa

Regresar a la ventana de Detalles de Tarifa
    ${count}  Get Element Count    ${NAVIGATION}[IFR_CONTAINER]
    ${value}  Convert To String    ${count} 
    ${l_tab}  Replace Values    ${NAVIGATION}[SELECT_TAB]    ${value}
    verify_element_is_present    ${l_tab}
    Click Element    ${l_tab}
    ${l_iframe}  Replace Values    ${IFRAME_LIST}[IFRAME]    ${value}
    Unselect Frame
    Select Frame    ${l_iframe}