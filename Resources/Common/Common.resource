*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../../Libraries/Yggdrasil.py 
Variables    ../Locators.py
Resource    ../Resources/Common/Utils.resource
Resource    ../Resources/Common/Login.resource
Resource    ../Resources/Common/Navigation.resource
Resource    ../Resources/Common/Search_Customer.resource
Resource    ../Resources/Common/Rate_Details.resource
Resource    ../Resources/Common/Print_Contracts.resource
Resource    ../Resources/Common/Search_Order.resource

*** Keywords ***
Login y Busqueda De Suscriptor
    [Documentation]    
    ...    Realizar login en la aplicacion BES y realizar la busqueda de un suscriptor
    ...    *NOTE: This Gherkin component could be used for all the scripts*
    BES Init
    Navigation Main Menu
    Search Customer With One Parameter
    Validate ABE web

Login para Activacion de Nuevo Suscriptor
    [Documentation]    
    ...    Realizar login en la aplicacion BES y realizar la busqueda de un suscriptor
    ...    *NOTE: This Gherkin component could be used for all the scripts*
    BES Init
    Navigation Main Menu    

Logout De BES
    [Documentation]
    ...    Realiza el logout de la aplicacion BES
    ...    *NOTE: This Gherkin component could be used for all the scripts*    
    Unselect Frame
    Execute Javascript    document.querySelector("#userInfoDiv").click()
    verify_element_is_present    ${NAVIGATION}[NAVUSER_SIGNOUT]
    Click Element  ${NAVIGATION}[NAVUSER_SIGNOUT]
    verify_element_is_present    ${NAVIGATION}[BTN_OK]
    Step  BES Log out
    Click Element  ${NAVIGATION}[BTN_OK]
    Close Browser

Verificacion de Detalles de Tarifa con Impresion de contratos
    [Documentation]    
    ...    Muestra el apartado de Detalles de Tarifa y realiza la impresion del contrato digital
    ...    realiza la impresion del contrato local y valida el estatus de la orden
    ...    *NOTE : This Gherkin component could be used for all the scripts*
    Sleep    2s
    ${OrderId}  ${Amount}  Resumen de Detalles de Tarifa
    Generar Contrato Digital
    Impresion de Contrato Local
    Buscar Orden y Validar Estatus  ${OrderId}   
    Unselect Frame

Verificacion de Detalles de Tarifa sin contratos
    [Documentation]    
    ...    Muestra el apartado de Detalles de Tarifa 
    ...    *NOTE : This Gherkin component could be used for all the scripts*
    Sleep    2s
    ${OrderId}  ${Amount}  Resumen de Detalles de Tarifa
    Buscar Orden y Validar Estatus  ${OrderId}   
    Unselect Frame    

Verificacion de Detalles de Tarifa para Cliente Nuevo
    [Documentation]    
    ...    Muestra el apartado de Detalles de Tarifa 
    ...    *NOTE : This Gherkin component could be used for all the scripts*
    Sleep    2s
    ${OrderId}  ${Amount}  Resumen de Detalles de Tarifa con Observaciones Cliente Nuevo
    Generar Contrato Digital
    Impresion de Contrato Local
    Buscar Orden y Validar Estatus  ${OrderId}   
    Unselect Frame