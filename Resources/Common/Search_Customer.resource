*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    OperatingSystem
Library    Collections
Library    ../../Libraries/Yggdrasil.py
Variables    ../Locators.py
Resource    ../Resources/Common/Utils.resource

*** Variables ***
${search_by}
${search_value}

*** Keywords ***
Search Customer With One Parameter
    [Documentation]    Search a customer using one parameter, the parameter is received as an argument.
    #search_criteria
    #select_customer_from_list
    Search Customer Placeholder

Search Criteria
    [Documentation]      
    get_actual_frame
    ${XPATH}  find_in_dictionary  ${SEARCH_INFORMATION}  ${search_by}
    verify_element_is_present    ${XPATH}
    Input Text    ${XPATH}    ${search_value}
    Click Element   ${BUTTON}[SEARCH]
    Step    Seleccion de suscriptor ${search_value}

Select Customer From List
    [Documentation]       
    verify_element_is_present    ${CUSTOMER}[LBL_TOTAL]
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${CUSTOMER}[NUM]    ${SYSTEM}[TIMEOUT_10]    
    Run Keyword If    '${status}'=='False'    Scroll Element Into View    ${CUSTOMER}[NUM]
    ${l_num}    Get Text    ${CUSTOMER}[NUM]
    Step    Seleccion del primer cliente de la lista
    IF    ${l_num} > 0
    Verify Element Is Present    ${BUTTON}[SELECT]
    Click Element    ${BUTTON}[SELECT]
    ELSE
    Element No Exist    ${CUSTOMER}[NOT_FOUND]
    END
    
Element No Exist
    [Arguments]    ${locator}
    ${count}=    Get Element Count    ${locator}
    Should Be Equal As Integers    ${count}    0

Search Customer Placeholder
    [Documentation]    Busca el cliente por el ${search_value}
    get_actual_frame
    Wait Until Element Is Visible    ${SEARCH_INFORMATION}[LABEL]    ${SYSTEM}[TIMEOUT_30]
    ${SEARCH_CUSTOMER_BY}=    Replace String    ${SEARCH_INFORMATION}[SEARCH_PLACEHOLDER]    {}    ${search_by}    
    verify_element_is_present    ${SEARCH_CUSTOMER_BY}
    Input Text    ${SEARCH_CUSTOMER_BY}    ${search_value}
    Step    Busqueda por ${search_by} el Suscriptor ${search_value}   
    Click Element   ${BUTTON}[SEARCH]
    Select Customer From List
        
    