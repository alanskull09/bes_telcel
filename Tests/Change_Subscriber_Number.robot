*Settings*
Documentation    Esta suite contiene los test cases del archivo Change primary Offer.
Library     SeleniumLibrary
Library     OperatingSystem
Library     ../Libraries/Excel.py
Resource    ../Resources/Common/Common.resource
Resource    ../Resources/Common/Number_and_SIM.resource

*** Test Cases ***
Cambio de Numero
    [Documentation]   Se realiza el cambio de numero
    ...    Se puede cambiar entre Automatico o manual cambiando la
    ...    variables del excel type_phone_and_sim entre AUTOMATICO O MANUAL
    ...    Tambien puede realizar cambio de SIM, cambiar variable  change_sim entre YES o NO
    ...    y sim_mode entre Manual o Automatico
    ...
    ...    *Precondition:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor Pospago valido.
    ...    
    ...    *Test Data:*
    ...    1. Credenciales de acceso validas del usuario al CRM.
    ...    2. Numero de suscriptor abierto valido.
    ...    3. Linea sin adeudos.
    [Setup]    Leer Datos    ${EXECDIR}\\Data\\Change_Subscriber_Number\\TD_CSN_01
    Given Login y Busqueda De Suscriptor
    Then Cambio de Numero 
    Then Verificacion de Detalles de Tarifa con Impresion de contratos
    And Logout De BES    