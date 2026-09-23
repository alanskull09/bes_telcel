*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../Libraries/Yggdrasil.py
Variables    ../Locators.py
Resource    ../Resources/Common/close_fingerprint.resource

*** Variables ***
${STEP_NUMBER}

*** Keywords ***
log_console_and_log
    [Documentation]
    ...    Allow us to enter a message both in console and in the log    
    [Arguments]    ${message}
    ${_timestamp} =    Get Time
    Log  ${message}
    Log To Console  ${_timestamp} -- ${message}

verify_element_is_present
    [Arguments]    ${locator}
    ${status1}    ${value1}=    Run Keyword And Ignore Error
    ...    Wait Until Element Is Visible    ${locator}    15s
    ${status2}    ${value2}=    Run Keyword And Ignore Error
    ...    Scroll Element Into View    ${locator}
    Run Keyword If    '${status1}' == 'FAIL' and '${status2}' == 'FAIL'
    ...    Run Keywords
    ...    Log    Element not found: ${locator}
    ...    AND    Fail    Element not found: ${locator}
    ${WebElement}    Get WebElement    ${locator}
    Highlight    ${WebElement}
    RETURN    ${status1}

seleccionar_opcion_dropdown
    [Arguments]    ${locator_dropdown}    ${texto_opcion}
    Click Element    ${locator_dropdown}
    ${opcion_locator}=    Set Variable    //span[contains(@title,"${texto_opcion}")]
    Wait Until Element Is Visible    ${opcion_locator}
    Click Element    ${opcion_locator}

get_actual_frame
    Run Keyword And Ignore Error    Unselect Frame    
    Wait Until Element Is Enabled    ${NAVIGATION}[IFR_CONTAINER]     ${SYSTEM}[TIMEOUT_500]    
    ${count}  Get Element Count  ${NAVIGATION}[IFR_CONTAINER]
    ${value}  Convert To String    ${count}
    ${l_iframe}  Replace Values    ${IFRAME_LIST}[IFRAME]    ${value}    
    ${source}  Get Element Attribute    ${l_iframe}   src
    Wait Until Element Is Visible    ${l_iframe}    ${SYSTEM}[TIMEOUT_500]
    Wait Until Keyword Succeeds    5x    1min    Select Frame    ${l_iframe}

Click Element If Visible
    [Arguments]    ${locator}    ${timeout}=5s
    ${visible}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${locator}    ${timeout}
    IF    ${visible}
        Step    Click en boton Ok de POPUP
        Click Element    ${locator}  
    END
    
Validate ABE web
    [Documentation]    
    Sleep    10s
    ${status}   Run Keyword And Return Status    Switch Window     NEW    15s
    Run Keyword If    ${status} == True    Close Fingerprint

Step
    [Documentation]    Keyword que saca el numero de paso y captura evidencia 
    ...    reemplazando el capture page screenshoot    
    [Arguments]    ${description}
    ${STEP_NUMBER}=    Evaluate    ${STEP_NUMBER} + 1
    Set Suite Variable    ${STEP_NUMBER}
    ${timestamp}=    Get Time    result_format=%Y%m%d_%H%M%S
    Log To Console    ▶ Step ${STEP_NUMBER}: ${description}
    ${file_name}=    Replace String Using Regexp
    ...    ${STEP_NUMBER}_${timestamp}_${description}.png
    ...    [^a-zA-Z0-9_.-]
    ...    _
    Capture Page Screenshot    ${file_name}

click_con_JS
    [Documentation]     Da click al elemento usando JS
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=15s
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript
    ...    arguments[0].scrollIntoView({behavior:'instant',block:'center',inline:'center'});
    ...    arguments[0].focus();
    ...    arguments[0].dispatchEvent(new MouseEvent('mouseover',{bubbles:true}));
    ...    arguments[0].dispatchEvent(new MouseEvent('mousedown',{bubbles:true}));
    ...    arguments[0].click();
    ...    arguments[0].dispatchEvent(new MouseEvent('mouseup',{bubbles:true}));
    ...    arguments[0].dispatchEvent(new MouseEvent('click',{bubbles:true,cancelable:true,view:window}));
    ...    ARGUMENTS
    ...    ${element}

find_in_dictionary
    [Arguments]   ${list}  ${l_value} 
    FOR    ${element}    IN  @{list}
           ${value}  Get From Dictionary    ${list}    ${element}
           ${l_value}  Convert To Upper case    ${l_value}
           ${status}  Run Keyword And Return Status    Should Be Equal    ${element}    ${l_value}
           Exit For Loop If    ${status}==True
    END
    RETURN  ${value} 