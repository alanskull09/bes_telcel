*** Settings ***
Documentation    Keywords de primer nivel para los casos de prueba de Change Supplementary Offer
Library         SeleniumLibrary 
variables       ../Locators.py
resource        ../Resources/Common/Utils.resource

*** Variables ***
${supplementary_offer}


*** Keywords ***
Seleccionar Oferta Suplementaria
    Scroll Element Into View    ${CHANGE_SUPPLEMENTARY_OFFER}[SELECT_SUPPLEMENTARY_OFFER]
    verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[SELECT_SUPPLEMENTARY_OFFER]
    Step    Click en boton de Seleccionar oferta suplementaria
    Click Button    ${CHANGE_SUPPLEMENTARY_OFFER}[SELECT_SUPPLEMENTARY_OFFER]
    Click Element If Visible    ${CHANGE_SUPPLEMENTARY_OFFER}[POP_UP]
    log_console_and_log    *** SELECT SUPPLEMENTARY OFFER COMPONENT ***
    verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[SEARCH_KEYWORD]
    Input Text    ${CHANGE_SUPPLEMENTARY_OFFER}[SEARCH_KEYWORD]    ${supplementary_offer}
    Step    Ingresamos la oferta suplementaria ${supplementary_offer}
    Sleep   3s
    verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[SEARCH_OFFER_BUTTON]
    Click Element    ${CHANGE_SUPPLEMENTARY_OFFER}[SEARCH_OFFER_BUTTON]
    Sleep    3s
    ${supplementary_element}    Replace Values    ${CHANGE_SUPPLEMENTARY_OFFER}[TAB_SUPOFFER]    ${supplementary_offer}
    FOR    ${index}    IN RANGE    1    5
    ${status}=    Run Keyword And Return Status    verify_element_is_present    ${supplementary_element}
 
    IF    ${status}
        get_actual_frame
        verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[CHOOSE_SUPOFFER]
        Sleep    2s
        Click Element    ${CHANGE_SUPPLEMENTARY_OFFER}[CHOOSE_SUPOFFER]
        Step     Click en boton seleccionar de la oferta suplementaria
        Exit For Loop
    ELSE
        log_console_and_log    Supplementary Offer Not Found
        verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[SEARCH_OFFER_BUTTON]
        Click Element    ${CHANGE_SUPPLEMENTARY_OFFER}[SEARCH_OFFER_BUTTON]
    END
 
    IF    ${index} == 4
        Fail    Supplementary Offer not Found
    END
    END
    verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[UPDATE_OFFER]
    verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[CONFIRM_OFFER]
    Step    Click en boton confirmar
    Click Button    ${CHANGE_SUPPLEMENTARY_OFFER}[CONFIRM_OFFER]

Dar de baja Oferta Suplementaria
    get_actual_frame
    Sleep    3s
    Scroll Element Into View    ${CHANGE_SUPPLEMENTARY_OFFER}[LABEL_SUPPLEMENTARY_OFFER]
    verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[LABEL_SUPPLEMENTARY_OFFER]
    log_console_and_log    *** REMOVE SUPPLEMENTARY OFFER COMPONENT ***
    verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[MORE_SUPP_OFFER]
    Click_Con_JS    ${CHANGE_SUPPLEMENTARY_OFFER}[MORE_SUPP_OFFER] 
    Step    Click en mas del apartado ofertas suplementarias
    ${REMOVE_SUPP_OFFER}=    Replace String    ${CHANGE_SUPPLEMENTARY_OFFER}[REMOVE_SUPP_PLACEHOLDER]    {}    ${supplementary_offer}    
    verify_element_is_present    ${REMOVE_SUPP_OFFER}       
    Step    Oferta Suplemenatria a dar de baja ${supplementary_offer}
    ${UNSUBSCRIBE_OFFER_BTN}=    Replace String    ${CHANGE_SUPPLEMENTARY_OFFER}[UNSUBSCRIBE_SUPP_OFFER]    {}    ${supplementary_offer}
    verify_element_is_present    ${UNSUBSCRIBE_OFFER_BTN}
    Click Element    ${UNSUBSCRIBE_OFFER_BTN}
    Step     Click en boton Dar de baja
    verify_element_is_present    ${CHANGE_SUPPLEMENTARY_OFFER}[CANCEL_UNSUBSCRIBE_BTN]
    
