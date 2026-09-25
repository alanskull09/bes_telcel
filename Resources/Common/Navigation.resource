*** Settings ***
Library    SeleniumLibrary
Library    String
Library    ../../Libraries/Yggdrasil.py 
Variables    ../Locators.py
Resource    ../Resources/Common/Utils.resource

*** Variables ***
${menu_section}
${menu_option}

*** Keywords ***
Navigation Main Menu
    [Documentation]    Select the main menu option received using the arguments
    ...    ${First_Option} - Select the main options in the menu (Gestion de la Ordes, Operaciones Integradas y Gestion de IPCC)
    ...    ${Second_Option} - Select the sub menu option you wish to enter, example: ...    ${First_Option} - Select the two main options in the menu (Integrated Options or IPCC Management)
    ...    ${Second_Option} - Select the menu option you wish to enter, example: Vista 360 Grados
    Wait Until Element Is Visible    ${NAVIGATION}[MAIN_MENU]    ${SYSTEM}[TIMEOUT_5]
    Click Element    ${NAVIGATION}[MAIN_MENU]
    ${l_menu}    Replace Values    ${NAVIGATION}[MENU_SECTION]   ${menu_section}
    verify_element_is_present    ${l_menu}
    Step  Seleccion de menu ${MenuSection}
    Click Element    ${l_menu}    
    ${l_submenu}    Replace Values     ${NAVIGATION}[MENU_OPTION]    ${menu_option}
    verify_element_is_present    ${l_submenu}
    Step  Seleccion de flujo ${MenuOption}    
    Click Element    ${l_submenu}
    Sleep    8s
    
    