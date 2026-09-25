*Settings*
Documentation    Esta suite contiene los test cases del archivo Number and SIM
Library     SeleniumLibrary
Library     OperatingSystem
Library     ../Libraries/Excel.py
Resource    ../Resources/Common/Common.resource
Resource    ../Resources/Common/Number_and_SIM.resource

*** Test Cases ***
Cambio de SIM
    [Documentation]   Se realiza el cambio de SIM
    ...
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor Pospago valido.
    ...    
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor abierto valido.
    ...    3. Linea sin adeudos.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Change_Subscriber_SIM\\TD_CSS_01
    Given Login y Busqueda De Suscriptor
    Then Cambio de SIM Card
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES    