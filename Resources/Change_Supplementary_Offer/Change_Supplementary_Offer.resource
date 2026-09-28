*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Variables  ../Locators.py
Resource   ../Common/Utils.resource

*** Variables ***
# Valores por defecto para evitar fallos si el Excel no carga
${curp}         WOHM790806MCLXYZ12
${offer_name}   tiempo

*** Keywords ***
Navegacion y Busqueda Por CURP
    [Documentation]    Navega por el menú hamburguesa, selecciona Operaciones Integradas, busca por CURP y gestiona la ventana emergente.
    
    # 1. Menú Hamburguesa
    Wait Until Element Is Visible    //span[@class='categoryH']    ${SYSTEM}[TIMEOUT_20]
    Click Element                    //span[@class='categoryH']
    
    # 2. Operaciones Integradas
    Wait Until Element Is Visible    //span[text()='Operaciones Integradas']    ${SYSTEM}[TIMEOUT_10]
    Click Element                    //span[text()='Operaciones Integradas']
    
    # 3. Cambio de Oferta Suplementaria
    Wait Until Element Is Visible    //a[@title='Cambio de Oferta Suplementaria']    ${SYSTEM}[TIMEOUT_10]
    Click Element                    //a[@title='Cambio de Oferta Suplementaria']
    
    # Cambiar al iframe de trabajo del CRM
    Sleep    5s
    Run Keyword And Ignore Error    get_actual_frame
    
    # 4. Ingresar CURP
    Log To Console    Usando CURP: ${curp}
    Wait Until Element Is Visible    //input[@id='inputcurpnewTest']    ${SYSTEM}[TIMEOUT_20]
    Input Text                       //input[@id='inputcurpnewTest']    ${curp}
    
    # 5. Clic en Buscar
    Wait Until Element Is Visible    //span[text()='Buscar']    ${SYSTEM}[TIMEOUT_10]
    Click Element                    //span[text()='Buscar']
    Sleep    5s
    
    # 6. Clic en Seleccionar en la tabla del suscriptor
    Wait Until Element Is Visible    //button[contains(@class, 'table_template_operation0') and contains(., 'Seleccionar')]    ${SYSTEM}[TIMEOUT_10]
    Click Element                    //button[contains(@class, 'table_template_operation0') and contains(., 'Seleccionar')]
    
    # 7. Cierre de la ventana emergente
    Sleep    3s
    Run Keyword And Ignore Error    Click Element    //span[text()='Aceptar']
    Run Keyword And Ignore Error    Click Element    //span[text()='OK']
    Run Keyword And Ignore Error    Click Element    //button[contains(., 'Aceptar')]
    Run Keyword And Ignore Error    Click Element    //button[contains(., 'OK')]
    Run Keyword And Ignore Error    Press Keys       None    ESC
    
    # 8. ESPERA OBLIGATORIA DE 40 SEGUNDOS (para que el CRM procese y libere la interfaz)
    Log To Console    Ventana gestionada. Esperando 40 segundos obligatorios para procesamiento del CRM...
    Sleep    40s

Proceso Cambio Oferta Suplementaria
    [Documentation]    Busca la oferta suplementaria por palabra clave ('tiempo'), la elige, confirma y avanza con doble Siguiente.
    
    # Asegurar el frame activo nuevamente
    Run Keyword And Ignore Error    get_actual_frame
    
    # Validar si aparece un botón adicional de 'Seleccionar' y pulsarlo si existe
    ${select_visible}    Run Keyword And Return Status    Element Should Be Visible    //span[text()='Seleccionar']    timeout=5s
    Run Keyword If       '${select_visible}'=='True'    Click Element    //span[text()='Seleccionar']
    
    Sleep    5s
    
    # 9. Escribir 'tiempo' en el buscador de la oferta
    Log To Console    Buscando oferta: ${offer_name}
    Wait Until Element Is Visible    //input[@id='searchlookupConditionchangeofferorderInputQueryString']    30s
    Input Text                       //input[@id='searchlookupConditionchangeofferorderInputQueryString']    ${offer_name}
    
    # 10. Clic en el botón lupa / búsqueda (SVG)
    Wait Until Element Is Visible    //*[@id='btn_comSearchAttrSearchButtonsearchlookupConditionchangeofferorder']    ${SYSTEM}[TIMEOUT_10]
    Click Element                    //*[@id='btn_comSearchAttrSearchButtonsearchlookupConditionchangeofferorder']
    
    # 11. Esperar 10 segundos a que carguen los resultados
    Sleep    10s
    
    # 12. Clic en Elegir
    Wait Until Element Is Visible    //span[text()='Elegir']    ${SYSTEM}[TIMEOUT_10]
    Click Element                    //span[text()='Elegir']
    
    # 13. Scroll y Clic en Confirmar
    Sleep    2s
    Scroll Element Into View         //span[text()='Confirmar']
    Wait Until Element Is Visible    //span[text()='Confirmar']    ${SYSTEM}[TIMEOUT_10]
    Run Keyword And Ignore Error     Click Element    //span[text()='Confirmar']
    Run Keyword And Ignore Error     Execute Javascript    document.evaluate("//span[text()='Confirmar']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    
    # 14. Primer clic en Siguiente
    Sleep    3s
    Scroll Element Into View         //span[text()='Siguiente']
    Wait Until Element Is Visible    //span[text()='Siguiente']    ${SYSTEM}[TIMEOUT_10]
    Click Element                    //span[text()='Siguiente']
    
    # 15. Espera exacta de 10 segundos y segundo clic en Siguiente (con respaldo JS)
    Sleep    10s
    Scroll Element Into View         //span[text()='Siguiente']
    Wait Until Element Is Visible    //span[text()='Siguiente']    ${SYSTEM}[TIMEOUT_10]
    Run Keyword And Ignore Error     Click Element    //span[text()='Siguiente']
    Run Keyword And Ignore Error     Execute Javascript    document.evaluate("//span[text()='Siguiente']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();