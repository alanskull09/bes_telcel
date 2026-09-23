*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../../Libraries/Yggdrasil.py 
Variables    ../Locators.py
Resource    ../Resources/Common/Utils.resource

*** Keywords ***
Buscar Orden y Validar Estatus
    [Documentation]    da clic en enlace de buscar Orden y valida el estatus de la orden
    [Arguments]    ${OrderId}
    Step    Buscar Orden y Validar Estatus de la orden ${OrderId}
    Sleep    5s
    get_actual_frame
    verify_element_is_present    ${SEARCH_ORDER}[SEARCH_ORDER_LINK]
    Click Element    ${SEARCH_ORDER}[SEARCH_ORDER_LINK]
    Sleep    5s
    Unselect Frame
    get_actual_frame
    Wait Until Keyword Succeeds  4x  10s    Element Should Be Visible    ${SEARCH_ORDER}[SEARCH_BUTTON]
    Click Element    ${SEARCH_ORDER}[SEARCH_BUTTON]
    Wait Until Keyword Succeeds  4x  10s    Element Should Be Visible    ${SEARCH_ORDER}[ORDER_LIST]
    ${ORDER_STATUS}    Get Text    ${SEARCH_ORDER}[ORDER_STATUS]
    Step    El estatus de la orden es ${ORDER_STATUS}
    