*Settings*
Documentation    Esta suite contiene los test cases del archivo Change primary Offer.
Library     SeleniumLibrary
Library     OperatingSystem
Library     ../Libraries/Excel.py
Resource    ../Resources/Common/Common.resource
Resource    ../Resources/Purchase_New_Offer/Purchase_New_Offer.resource

*** Test Cases ***
Activacion Cliente Nuevo
    [Tags]    Regresion    Purchase New Offer
        [Documentation]   Activacion de Cliente Abierto/Control
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. CURP Nueva sin asignar
    ...    
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor valido.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Purchase_New_Offer\\TD_PNO_01
    Given Login para Activacion de Nuevo Suscriptor
    Then Cliente Nuevo Pospago Sin Equipo
    Then Verificacion de Detalles de Tarifa para Cliente Nuevo
    And Logout De BES
