*Settings*
Documentation    Esta suite contiene los test cases del archivo Change primary Offer.
Library     SeleniumLibrary
Library     OperatingSystem
Library     ../Libraries/Excel.py
Resource    ../Resources/Common/Common.resource
Resource    ../Resources/Migrations_Offer/Migrations.resource

*** Test Cases ***
Migracion Abierto a Controlado Sin Equipo
        [Documentation]   Se realiza la migracion de suscriptor de Abierto a Controlado
    ...    y Controlado a Abierto
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor Pospago valido.
    ...
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor abierto valido.
    ...    3. Linea sin adeudos.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Migrations\\TD_MIG_01
    Given Login y Busqueda De Suscriptor
    Then Migracion Pospago Sin Equipo
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES

Migracion Prepago a Abierto Sin Equipo
        [Documentation]   Se realiza la migracion de suscriptor de Prepago a Abierto
    ...    y Prepago a Controlado
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor Pospago valido.
    ...
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor abierto valido.
    ...    3. Linea sin adeudos.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Migrations\\TD_MIG_02
    Given Login y Busqueda De Suscriptor
    Then Migracion Prepago Sin Equipo
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES

Migracion Pospago a Prepago Sin Equipo
        [Documentation]   Se realiza la migracion de suscriptor de Prepago a Abierto
    ...    y Prepago a Controlado
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor Pospago valido.
    ...
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor abierto valido.
    ...    3. Linea sin adeudos.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Migrations\\TD_MIG_03
    Given Login y Busqueda De Suscriptor
    Then Migracion Pospago a Prepago Sin Equipo
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES