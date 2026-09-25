*** Settings ***
Documentation    Esta suite contiene los test cases del archivo Change primary Offer.
Library          SeleniumLibrary
Library          OperatingSystem
Library          ../Libraries/Excel.py
Resource         ../Resources/Common/Common.resource
Resource         ../Resources/Change_Primary_Offer/Change_Primary_Offer.resource

*** Test Cases ***
Cambio Oferta Primaria Sin Equipo
    [Tags]    Regresion    Change Primary Offer
    [Documentation]    Validar cambio de oferta primaria sin equipo.
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor valido.
    ...    
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor valido.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Change_Primary_Offer\\TD_CPO_01
    Given Login y Busqueda De Suscriptor
    Then Cambio De Oferta Primaria
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES

Cambio Oferta Primaria con Equipo
    [Tags]    Regresion    Change Primary Offer
    [Documentation]    Validar cambio de oferta primaria con equipo.
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor valido.
    ...    
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor valido.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Change_Primary_Offer\\TD_CPO_02
    Given Login y Busqueda De Suscriptor
    Then Cambio De Oferta Primaria
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES

Cambio Oferta Primaria y Oferta Suplementaria Sin Equipo 
    [Tags]    Regresion    Change Primary Offer
    [Documentation]    Validar cambio de oferta primaria sin equipo
    ...    y Agregar una oferta suplementaria.
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor valido.
    ...    
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor valido.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Change_Primary_Offer\\TD_CPO_03
    Given Login y Busqueda De Suscriptor
    Then Cambio De Oferta Primaria
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES

Cambio Oferta Primaria y Dar de Baja Oferta Suplementaria Sin Equipo 
    [Tags]    Regresion    Change Primary Offer
    [Documentation]    Validar cambio de oferta primaria sin equipo
    ...    y Dar de baja una oferta suplementaria.
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor valido.
    ...    
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor valido.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Change_Primary_Offer\\TD_CPO_04
    Given Login y Busqueda De Suscriptor
    Then Cambio De Oferta Primaria
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES    

Test Login
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Change_Primary_Offer\\TD_CPO_01
    Given Login y Busqueda De Suscriptor