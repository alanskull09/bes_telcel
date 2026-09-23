*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../../Libraries/Yggdrasil.py 
Variables    ../Locators.py
Resource    ../Resources/Common/Utils.resource

*** Variables ***
${STEP}             Undefined
${step_number}
${TS_Number}
${user_name}   
${password}

*** Keywords ***
BES Init
    [Documentation]    Close all open sessions to later open a new session,
    ...     go to BES and log in to the application.
    Set Global Variable    ${STEP}    Initialize Telcel BES CRM
    Set Test Variable    ${step_number}    0
    Create Directory  ${OUTPUT_DIR}/${TEST_NAME}
    Empty Directory    ${OUTPUT_DIR}/${TEST_NAME}
    Create Directory    ${OUTPUT_DIR}/${TEST_NAME}
    SeleniumLibrary.Set Screenshot Directory    ${OUTPUT_DIR}/${TEST_NAME}
    ${yyyy}    ${mon}	${dd}    ${hh}    ${mm} =	Get Time	year,month,day,hour,minute
    Set Global Variable    ${TS_Number}    ${yyyy}${mon}${dd}${hh}${mm}
    Login BES
    
Login BES
    [Documentation]
    ...    Open Browser and log in to the application.
    Open Page With Retry    ${SYSTEM}[URL]    ${SYSTEM}[BROWSER]    ${LOGIN}[BTN_SIGNIN]    
    Step  Abre navegador en CRM BES         
    Input Text    ${LOGIN}[USERNAME]    ${user_name}
    Input Text    ${LOGIN}[PASSWORD]    ${password}
    verify_element_is_present    ${LOGIN}[BTN_SIGNIN]
    Step   Login BES
    # Click Button    ${LOGIN}[BTN_SIGNIN]
    click_con_JS    ${LOGIN}[BTN_SIGNIN]
    ${status}    Run Keyword and Return Status     verify_element_is_present      ${LOGIN}[MSG_WELCOME]
    Sleep    4s
    Run Keyword If    '${status}'=='True'    Step    acceso correcto a BES CRM   
    Wait Until Element Is Not Visible    ${LOGIN}[MSG_WELCOME]  ${SYSTEM}[TIMEOUT_10]
    

Open Page With Retry
    [Documentation]    Abre el navegador con capabilities y retrys
    [Arguments]    ${url}    ${browser_opt}    ${locator}    ${retries}=3
    ${capabilities}    Create Chrome options
    FOR    ${i}    IN RANGE    ${retries}
        Log To Console    Inicio de pagina BES CRM Intento: ${i+1}
        Open Browser    ${url}    ${browser_opt}    options=${capabilities}
        Maximize Browser Window
        ${status}=    Run Keyword And Return Status
        ...    Wait Until Element Is Visible    ${locator}    timeout=30s
        IF    ${status}
            Log To Console    Inicio correcto de CRM BES
            RETURN
        END
        Log To Console    Re-Try Open a New Window...
    END
    Fail    No cargó la página

Create Chrome options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${headless}=    Set Variable    --headless=new
    ${windows_size}=    Set Variable    --window-size=1920,1080
    ${scale}=    Set Variable    --force-device-scale-factor=0.75   
    #Call Method    ${options}    add_argument    ${headless}    
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    ${windows_size}
    Call Method    ${options}    add_argument    ${scale}
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    RETURN    ${options}