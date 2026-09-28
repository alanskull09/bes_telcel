*** Settings ***
Documentation    Esta suite contiene los test cases del modulo Cambio Oferta Suplementaria.
Library          SeleniumLibrary
Library          OperatingSystem
Library          ../Libraries/Excel.py
Resource         ../Resources/Common/Common.resource
Resource         ../Resources/Common/Login.resource
Resource         ../Resources/Change_Supplementary_Offer/Change_Supplementary_Offer.resource

*** Test Cases ***
Cambio de Oferta Suplementaria Exitosa
    [Tags]    Regresion    Change Supplementary Offer
    [Documentation]    Validar la busqueda y cambio de una oferta suplementaria especifica.
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. CURP de suscriptor valido.
    
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Change_Supplementary_Offer\\TD_CSO_01
    
    # Login inicial (reutilizando keyword de Common/Login)
    Given BES Init
    
    # Navegacion especifica para este modulo
    And Navegacion y Busqueda Por CURP
    
    # Proceso central de seleccion de la oferta
    When Proceso Cambio Oferta Suplementaria
    
    # Validacion final y cierre de sesion (reutilizando keywords existentes)
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES