# FUNCTIONS
def createinput(ref):
    l_input = '//input[' + ref + ']'
    return l_input


def createbutton(ref):
    l_button = '//button[contains(.,"' + ref + '")]'
    return l_button


def createelement(ref):
    l_element = '//div[contains(.,"' + ref + '")]'
    return l_element


def weirdbutton(ref):
    w_button = '//div//span[@id="' + ref + '"]'
    return w_button


def createframe(ref):
    l_frame = '//iframe[@src[contains(.,"' + ref + '")]]'
    return l_frame


def createtitle(ref):
    l_title = '//*[@title="' + ref + '"]'
    return l_title


def createoption(ref):
    l_option = '//span[contains(text(),"' + ref + '")] | //div[(text()="' + ref + '")]'
    return l_option


def createrecharge(ref):
    l_recharge = '//div[(text()="' + ref + '")]'
    return l_recharge


def createoption2(ref):
    l_option = '//span[contains(.,"' + ref + '")]'
    return l_option


def createshortcut(ref):
    l_shortcut = '//div//a[contains(.,"' + ref + '")]'
    return l_shortcut


def createlabel(ref):
    l_label = '//label/span[@title="' + ref + '"]'
    return l_label


def createradiobtn(ref):
    l_radio = '//input[@type="radio"]//following::label/span[@title="' + ref + '"]'
    return l_radio


def createfocus(ref):
    l_focus = '//div/span[contains(.,"' + ref + '")]'
    return l_focus


def deleteoffer(ref):
    l_offer = '//*[@id=\"besColResizer0\"]/tbody/tr/td//div/a[@title=\"' + ref + '\"]/following::button[1]'
    return l_offer


def dropdownOption(ref):
    l_option = '//option[@value=' + ref + ']'
    return l_option

SYSTEM = {
    "URL": "https://10.59.10.198:12900/oc/bes/sm/login/login.html?logoutReason=SessionInvalid",
    "BROWSER": "Chrome",
    "WINDOW": "MAIN",
    "TIMEOUT_500": "500s",
    "TIMEOUT_30": "30s",
    "TIMEOUT_20": "20s",
    "TIMEOUT_10": "10s",
    "TIMEOUT_5": "5s",
    "LOADING": "//div[@id='loadingcover' and @style='display: none;']",
    "LOADING_2": "//div[@id='loadingcover']//img[@class='loading']"
}

IFRAME_LIST = {
    "iFrameID": ["bp-reactivesubs", "bp-networkSetting", "bp-modifysubscriber", "bp-360custviewframework","bp-predropsubs"],
    "ELMNT_TITLE": "//div[@id='popwin_title'][contains(.,'Error') or contains(.,'Información') or contains(.,'Estado del documento')]",
    "IFRAME": "//iframe[Replace]",
}

BUTTON = {
    "SEARCH": createbutton("Buscar"),
    "CONSULT": createbutton("Consultar"),
    "RESET": createbutton("Restablecer"),
    "SELECT": createbutton("Seleccionar"),
    "CONFIRM": createbutton("Confirmar"),
    "SENT": createbutton("Enviar"),
    "SENT2": createbutton("ENVIAR"),
    "RETURN": createbutton("Regresar"),
    "CANCEL": createbutton("Cancelar"),
    "SEARCH_ORDER": createbutton("Buscar Orden"),
    "AUTOMATIC": createbutton("Automático"),
    "MANUAL": createbutton("Manual"),
    "CONFIRM_CONTACT": "//button[@id=\"btn_saveContactEntitycustomercontact\"]",
    "CONFIRM_CONTACT_TO": "//button[@id=\"btn_saveContactEntitynewcontactmanInfo\"]",
    "READ": createbutton("Leer"),
    "VERIFY": createbutton("Verificar"),
    "MODIFY": createbutton("Modificar"),
    "FIND": createbutton("Consultar"),
    "GENERATE": createbutton("Generar,"),
    "CREDITCHECK": createbutton("VERIFICACIÓN DE CRÉDITO"),
    "SAVE": createbutton("GUARDAR CLIENTE"),
    "NEXT": createbutton("Siguiente"),
    "BACK": createbutton("Regresar"),
    "CLOSE": createbutton("Cerrar"),
    "CHOOSE": createbutton("Elegir"),
    "RESERVE": createbutton("Reservar"),
    "ADD_ACCOUNT": createbutton("Agregar Cuenta"),
    "ADD_CONTACTCUSTOMER": "//button[@id=\"btn_addCommonContactcustomercontact\"]",
    "ADD_CONTACTCUSTOMER_TO": "//button[@id=\"btn_addCommonContactnewcontactmanInfo\"]",
    "MORE": createbutton("Más"),
    "CONFIRM_ERROR": "//button[@id=\"tipserrorconfirmbtn\"]",
    "OK": "//div[@class='msgbox-ok-text']",
    "ZIP": "//button[@id=\"btn_searchByPostCode\"]",
    "CONFIRM_2": "//button[@id=\"btn_saveContactEntitybillContactEntitypaymentchannelpopaddaccountpop\"]",
    "CONFIRM_ADDCONTACTACCOUNT": "btn_setokcustomeraccountinfolist",
    "CLOSE_FINAL_CREDIT_CHECK": "//button[@id='btn_cancelcreditcheck']",
    "BTN_ENVIAR": "mobileoffering-custChangeSave",
    "CONFIRM_ACCOUNT_TO": "//button[@id=\"btn_setoktransferowner_account\"]",
    "CALCULAR": createbutton("Calcular"),
    "CONTINUAR": "//span[contains(@class, 'uee-msgbox-ok')]//div[contains(text(), 'Continuar')]",
    "EVALUACION_PREELIMINAR_BTN": createbutton("EVALUACIÓN PRELIMINAR"),
    "OK_BUTTON": createoption2("OK"),
    "NEXT_BUTTON": "//button[@id='btn_next']",
    "CONFIRM_LEASING" : "//button[@id='btn_selectinstallment_okgoodsInstallmentorleasing']",
    "CONTINUE": "//button[@id='btn_continue']",
    "RADIO_BTN" : "//label[@class='hlds-radio__label']//span[contains(@title,'{}')]",
}

LOGIN = {
    "LOGINPAGE": "//div[@id=\"div_login_nologin\"]",
    "USERNAME": createinput('@id="ipt_name"'),
    "LBL_USER": "//div[@label=\"SM.LOGIN.LABEL.USERNAME\"]",
    "PASSWORD": "//input[@type=\"password\"]",
    "LBL_PASS": "//div[@label=\"SM.LOGIN.LABEL.PASSWORD\"]",
    "LOGIN_BUTTON": "//button[@id=\"loginBtn\"]",
    "BTN_SIGNIN": "//button[@id=\"loginBtn\"]",
    "LANG_US": "//a[@locale=\"en_US\"]",
    "TXT_EN_US": "//div[@id=\"forget_pwd\"]/a[contains(.,\"Olvidó\")]",
    "MSG_LOGIN": "Page not loaded",
    "MSG_LAUNCH": "Something went wrong with Login Page",
    "MSG_WELCOME": "//div[@id='tip_footdiv']//div[@title='¡Bienvenido al sistema!']",
    "BTN_CONTINUAR": "//button[@id=\"loggedinLoginBtn_second\"]"

}

NAVIGATION = {
    "MAIN_MENU": "//a[@id=\"logoDiv\"]/preceding::span",
    "MENU_SECTION": createoption("Replace"),
    "MENU_OPTION": "//a[@title='Replace']",
    "NAV_USER": "//div[@id='userInfoDiv']",
    "NAVUSER_SIGNOUT": "//div[@class='acc-exit']",
    "BTN_OK": "//div[@class=\"msgbox-ok-text\"]",
    "WORKBENCH": "//span[contains(.,'de Trabajo')]",
    "TABS": "//li/div[@class=\"tab_title\"]",
    "SELECT_TAB": "//li[Replace]/div[@class=\"tab_title\"]",
    "IFR_CONTAINER": "//*[@id=\"ifr_container\"]//iframe",
}

CUSTOMER = {
    "INPUT_FIELD": createinput('@id="inputReplacenewTest"'),
    "IFRAME": createframe("customerauth"),
    "TXT_TITLE": createtitle("Lista de Clientes"),
    "LBL_TOTAL": "//div[@total]",
    "NUM": "//div[@id='customerCustList']//label[1]",
    "LIST_VALUE": "//button[contains(.,\"Seleccionar\")[1])",
    "NOT_FOUND": "Subscriber Not Found..."
}

SEARCH_INFORMATION = {
    "IDTYPE": "//div[@id=\"idTypenewTest\"]",
    "IDNUMBER": createinput('@id="inputidNumbernewTest"'),
    "PHONENUMBER": createinput('@id="inputserviceNumbernewTest"'),
    "FIRSTNAME": createinput('@id="inputfirstNamenewTest"'),
    "MIDDLENAME": createinput('@id="inputmiddleNamenewTest"'),
    "LASTNAME": createinput('@id="inputlastNamenewTest"'),
    "IMSI": createinput('@id="inputimsiNumbernewTest"'),
    "ICCID": createinput('@id="inputiccidNumbernewTest"'),
    "EMAIL": createinput('@id="inputemailnewTest"'),
    "RFC": (createinput('@id="inputrfcnewTest"'))[1],
    "CURP": (createinput('@id="inputcurpnewTest"')),
    "ACCOUNT": createinput('@id="inputqueryAccountCodenewTest"'),
    "SEARCH_PLACEHOLDER" : "//label[@title='{}']/following-sibling::div//input",
    "LABEL" : "//span[@title='Consultar Cliente']",
}

CLOSE_FINGERPRINT = {
    "SELECT_ACCOUNT": "//div[@id='popwin_title'][contains(.,'Seleccionar Cuenta')]",
    "ACCOUNT_NUMBER": "//td[@class='ng-scope']//div[@title='Replace']//following::td[@class='ng-scope']//child::button[contains(text(),'Seleccionar')]",
    "frame_search": "//iframe[@src='/oc/resource.root/bes/omni/standard/artificial/html/customerauth/customerauth.html?menuid=6013120160524101$build=undefined']",
    "BTN_SELECT": "//*[@id='besColResizer3']/tbody/tr[1]/td[6]/div/button",
    "FP_ERROR_MSG": "//span[@class='uee-button uee-ui-ele uee-msgbox-ok']"
}

CHANGE_PRIMARY_OFFER = {
    "CHANGE_TYPE": "//div[@id='changeTypecreditcheckaddinfo']",    
    "PROJECT_TYPE": "//div[@id='projecttypecreditcheckaddinfo']",
    "INPUT_OFFER": "//input[@id='keyWordInputQueryString']",  
    "SEARCH_DEVICE": "//div[@id='keyWord']//*[@id='btn_comSearchAttrSearchButtonkeyWord']",
    "BUTTON_CHOOSE": "(//button[contains(.,'Elegir')])[1]",
    "PLAN_DETAILS": "//span[@title='Detalles del Plan']",
    "SPECS": "//span[@title='ESPECIFICACIONES']",
    "LABEL_DEVICE": "(//div[@id='openAcctSalePhoneInfo']//div[contains(.,'SELECCIONAR OFERTA DE EQUIPO')])[3]",
    "DEVICE_BUTTON": "//button[@id='selectPhoneBtnopenAcctSalePhoneInfo']",
    "POP_UP": "//div[@id='popwin_title']",
    "CREDIT_CHECK_BUTTON": "//button[@id='basicCreditcheckBtn']",
    "CREDIT_CHECK_BUTTON_2": "//div[@id='basicCreditcheck']//button[@id='btn_creditcheck']",
    "CLOSE_CREDIT_CHECK": "//button[@id='btn_cancelbasicCreditcheck']",
    "CONFIRM_CREDIT_CHECK": "//button[@id='btn_Pop_Confirm']",
    "LOCAL_PRINT_AUTHORIZATION": "//div[@class='popwin_middle_center']//div[contains(.,'Verificación de Crédito')]",
    "CREDIT_CHECK_WARN": "basicCreditcheckBtn",
    "TABLE_DEVICES": "(//div[@id='tabletemplate25changeofferorderopenAcctSalePhoneInfo']//table)[1]",
    "DROP_ITEM": "unionshippingmodeId1changeofferorderopenAcctSalePhoneInfo",
    "INPUT_DEVICE": "//input[@id='keyWordInputQueryString']",
    "SEARCH_DEVICE": "//div[@id='keyWord']//*[@id='btn_comSearchAttrSearchButtonkeyWord']",
    "NAME_DEVICE": "(//div[@id='tabletemplate25changeofferorderopenAcctSalePhoneInfo']//table)[1]//tr[1]//td[1]",
    "SKU_DEVICE": "(//div[@id='tabletemplate25changeofferorderopenAcctSalePhoneInfo']//table)[1]//tr[1]//td[3]",
    "CHOOSE_DEVICE_OFFER": "//div[@title='{}']/following::button[contains(normalize-space(.),'Elegir')]",
    "BUTTON_COTIZAR": "//button[@id='SelectButton']",
    "SELECT_PAYMENT_PLAN": "//button[@id='btn_selectpaymentplangoodsInstallmentorleasing']",
    "CALCULATE_BUTTON": "//button[@id='btn_calculategoodsInstallmentorleasing']",
    "PLAZO_DROPDOWN": "//label[.//span[text()='Plazo de Equipo']]/following::div[contains(@class, 'hlds-picklist__input')][1]//input[@type='search']",
    "CONFIRM_COTIZATION_BUTTON": "//button[@id='btn_selectinstallment_okgoodsInstallmentorleasing']//span[@class='ng-binding ng-scope'][normalize-space()='Confirmar']",
    "CONFIRM_BTN_COTIZATION": "//button[@id='btn_selectinstallment_okgoodsInstallmentorleasing']",
    "DEVICE_TABLE_TERM": "//div[@id='installmentCard']",
    "RESERVE_BUTTON": "//button[@id='btn_reserve']",
    "RESERVE_IMEI": "//div[@class='hlds-text--large hlds-text-align--center ng-binding ng-scope']",
    "CONFIRM_DEVICE_BUTTON": "//button[@id='confirm']",
    "ESIM_WARNING": "//div[@class='popwin_content popwin_warning bc_msgbox_img warning']",
    "ESIM_BUTTON_OK": "//div[@class='msgbox-ok-text']",
    "TELCEL_UP_WARNING": "//div[@id='chooseInsuranceType']",
    "TELCEL_UP_CLOSE_POPUP": "//div[@id='popwin_close']",
    "TELCEL_UP_ASIGNADO": "//div[@class='popwin_content popwin_alert bc_msgbox_img alert']",
    "PROMO_POPUP": "//div[@id='promOfferList']",
    "EVALUATION_BUTTON": "//button[@id='btn_creditcheck']",
    "CLOSE_CREDITCHECK": "//button[@id='btn_cancelcreditcheck']",
    "FOLIO_NEMONICO": "//div[@id='basiccreditcheck_folioNumber']",
    "FOLIO_NEMONICO_FINAL": "//div[@id='finalcreditcheck_folioNumber']",
    "FOLIO_UNICO": "//div[@id='basiccreditcheck_FolionoBes']",
    "RESULT_BASIC_CC": "//div[@id='basiccreditcheck_result']",
    "RESULT_FINAL_CC": "//div[@id='finalcreditcheck_result']",
    "PNO_INPUT_OFFER": "//input[@id='searchlookupfiltercondition_b2cInputQueryString']",
    "PNO_SEARCH_BTN": "//div[@class='hlds-input-has-icon hlds-grid hlds-grow hlds-grid--vertical-align-center ng-scope hlds-input-has-icon--right']//*[name()='svg'][1]",
    "BTN_SELECT_DEVICE_SCHEME" : "//button[@id='SelectButton']",
    "FINANCE_EQUIPMENT_FRAME" : "//div[@id='popwin_title' and normalize-space()='EQUIPO A PLAZO']",
    "AUTH_RADIO_BTN" : "//label[@class='hlds-radio__label']//span[contains(@title,'{}')]",
    "DROPDOWN_BILLING_CYCLE": "//label[@title='Ciclo de Facturación']/following::input[@type='search' and contains(@class, 'hlds-input')][1]",
    "BILL_BTN": "//p[@class='hlds-align--absolute-center hlds-p-bottom--medium hlds-text-color--less-weak ng-binding ng-scope']",
    "VALIDATE_BILL": "//label[@title='Tipo de Contacto']/following::input[@type='search' and contains(@title, 'Envío de factura#')][1]",
    "CONFIRM_BILL_BTN": "//button[@id='btn_saveContactEntitybillContactEntitypaymentchannelpopaddaccountpop']//span[@class='ng-binding ng-scope'][normalize-space()='Confirmar']",
    "DROPDOWN_ENVIO_FAC": "//label[@title='Tipo de Contacto']/following::input[@title= 'Envío de factura']",
    "TERM": "//label[@title='Plazo']/following::input[@type='search' and contains(@class, 'hlds-input')][1]",
          
}

CHANGE_SUPPLEMENTARY_OFFER = {
    "SELECT_SUPPLEMENTARY_OFFER": "//div[normalize-space()='SELECCION DE OFERTA SUPLEMENTARIA']/following::button[normalize-space()='Seleccionar'][1]",
    "POP_UP": "//div[@id='popwin_title']",
    "SEARCH_KEYWORD": "//input[@id='searchlookupConditionchangeofferorderInputQueryString']",
    "SEARCH_OFFER_BUTTON": "//*[@id='btn_comSearchAttrSearchButtonsearchlookupConditionchangeofferorder']",
    "TAB_SUPOFFER": "//div[@id=\"allOfferchangeofferorder\"]//tr[1]//td[contains(.,'Replace')]",
    "CHOOSE_SUPOFFER": "//tr[1]//td//button[contains(.,'Elegir')]",
    "CONFIRM_OFFER": "//button[normalize-space()='Confirmar']",
    "UPDATE_OFFER": "//tr[1]/td[1]//div[2]/a[@class='ng-binding']",
    "LABEL_SUPPLEMENTARY_OFFER": "//div[normalize-space()='SELECCION DE OFERTA SUPLEMENTARIA']",
    "REMOVE_SUPP_PLACEHOLDER": "//a[@title='{}']",
    "UNSUBSCRIBE_SUPP_OFFER": "//tr[.//a[@title='{}']]//button[.//span[normalize-space()='Dar de Baja']]",
    "MORE_SUPP_OFFER": "//button[@fire='showMoreInfoBtn();']",
    "CANCEL_UNSUBSCRIBE_BTN": "//span[normalize-space()='Cancelar']",   
}

DETAILS = {
    "TXT_TITLE": createtitle("DETALLES DE TARIFA"),
    "TXT_TOTAL": "//div[contains(text(),'Total a cobrar')]",
    "AMOUNT": "//div[@ng-bind='displayPriceMap[offerFeeResp.totalPrice]']",
    "OPERATION_OPTIONS": "//input[@id='inputcheckObservation']",
    "CFDI_DROPDOWN": "//div//input[@title='Por definir']",
    "INPUT_OBSERVATIONS": "//input[@id='inputcheckObservation']",
}

CONFIRMATION = {
    "SUCCESS": "//div/span[contains(.,'La gestión de la operación fue exitosa')]"
}

SEARCH_ORDER = {
    "SEARCH_BUTTON": "//button[normalize-space()='Buscar']",
    "ORDER_LIST": "//*[@id=\"orderlist_tr_0\"]",
    "COMPLETE_ORDER": "//div[@title='Completado']",
    "SECTION": "//div[@id=\"serachorderlist\"]",
    "ORDER_ID": createinput('@id="inputorderId"'),
    "MSG_LOAD": "Order section not found",
    "TXT_TOTAL": "//div[@id=\"360vieworderlist\"]/div[@total]",
    "LIST_VALUE": "//div/span[contains(.,\"Replace\")]",
    "IFRAME": createframe("ordermanagement"),
    "STATUS": "//td[@data-label=\"Estatus de la Orden\"]//div/span",
    "LABEL": "//div/label[@title=\"ID de la Orden\"]",
    "ORDER_NUMBER": "//span[@ng-bind='params.orderResp.orderId']",
    "BUTTON": "//button[@id='a_businessentry0']",
    "360_TAB": "//li[@title='Vista de 360 Grados']",
    "ORDER_STATUS": "//td[@data-label='Estatus de la Orden']//span[@ng-bind='$Rowdata.statusShow']",
    "INPUT_ORDER": "//input[@id='inputorderId']",
    "SEARCH_ORDER_LINK": "//span[normalize-space()='Buscar Orden']",
    "SIM_ASSIGNED" : "//span[@ng-bind='iccid']",
}

PRINT_ORDER = {
    "TXT_PRINT": createfocus("Imprimir Contrato/Nota De Venta"),
    "DROPDOWN": "//div[@x-items='printParams.localPrintReasonList']",
    "WINDOW": "print",
    "WINDOW_2": "COLDview Document",
    "PRINT_PREVIEW": "//html/body/print-preview-app",
    "CHECKBOX_LOCALPRINT": "(//span[@class='hlds-radio--faux'])[2]",
    "SELECT_ORDER": "//tr[@id='orderlist_tr_0']//span[contains(text(),'${l_order}')]",
    "CLOSE_POPWIN": "//div[@id=\"popwin_close\"]",
    "PRINT_TAB": "//li[@title=\"Imprimir\"]",
    "CLOSE_TAB": "//li[@title=\"Imprimir\"]/div[2]",
    "LOCAL_PRINT": "//div[@id=\"win0\"]//span[@title=\"Impresión local\"]",
    "PRINT_TAB_2": "//li[@title='Imprimir']",
    "CLOSE_PRINT_TAB": "//li[@title='Imprimir']/div[2]",
}

PRINT_CONTRACT = {
    "LOCAL_RADIOBUTTON": "//span[text()='Impresión local']",
    "LOCAL_PRINT": "//span[@title='Impresión local']",
    "LBL_PRINT_CONTRACT": "//span[contains(.,\"Imprimir Contrato/Nota De Venta\")]",
    "REASON": "//input[contains(@name,'$Gadget.fields[0].besSelect_inputValue')]",
    "NOT_FOUND": "//div[contains(text(),'El contrato no se ha generado')]",
    "DIGITAL": "//span[@title='Digital']",
    "GENERATE_DIGITAL": "//button[contains(.,'Generar')]",
    "GENERATE_DIGITAL_2": "(//button[contains(.,'Generar')])[3]",
    "OK_BTN_CONTRACT": "//div[contains(text(),'OK')]",
    "MESSAGE_ERROR": "//div[@id='popwin_top_center']//div[contains(text(),'Error')]",
    "BTN_CONFIRM_ERROR": "//button[@id='tipserrorconfirmbtn']"
}

PNO = {
    "TIPO_ACTIVACION_FRAME": "//div[@id='popwin_title']",
    "TIPO_ACTIVACION_OPCION": "//span[@title='{}']",
    "LBL_VERIFICACION_CLIENTE": "//div[@title='Verificación del Cliente']",
    "INPUT_CURP": "//input[@id='inputcurp_c']",
    "BTN_CONSULTAR": "//button[@id='btn_custquerymanageuniquecustinfo']",
    "LBL_CLIENTE_EXITOSO": "//span[text()='El Cliente ya existe, verificación exitosa.']",
    "ADD_CONTACT_BTN": "//button[@id='btn_addCommonContactcustomercontact']",
    "DROPDOWN_CONTACT_INFO": "//label[@title='Tipo de Contacto']/following::input[@type='search' and contains(@class, 'hlds-input')][1]",
    "CONTACT_INFO_NAME": "//input[@id='inputtxt_firstName']",
    "CONTACT_INFO_LASTNAME": "//input[@id='inputtxt_middleName']",
    "CONTACT_INFO_PHONE": "//input[@id='inputtxt_homePhone']",
    "BTN_CONFIRM_CONTACT_INFO": "//span[normalize-space()='Confirmar']",
    "ADD_ACCOUNT_INFO_BTN": "//button[@id='btn_addCustomizedAccountcustomeraccountinfo']",
    "DROPDOWN_BILLING_CYCLE": "//label[@title='Ciclo de Facturación']/following::input[@type='search' and contains(@class, 'hlds-input')][1]",
    "BILL_BTN": "//p[@class='hlds-align--absolute-center hlds-p-bottom--medium hlds-text-color--less-weak ng-binding ng-scope']",
    "VALIDATE_BILL": "//label[@title='Tipo de Contacto']/following::input[@type='search' and contains(@title, 'Envío de factura#')][1]",
    "CONFIRM_BILL_BTN": "//button[@id='btn_saveContactEntitybillContactEntitypaymentchannelpopaddaccountpop']//span[@class='ng-binding ng-scope'][normalize-space()='Confirmar']",
    "DROPDOWN_ENVIO_FAC": "//label[@title='Tipo de Contacto']/following::input[@title= 'Envío de factura']",
    "PLAZO": "//label[@title='Plazo']/following::input[@type='search' and contains(@class, 'hlds-input')][1]",
    "CUESTIONARIO": "//span[@title='Cuestionario']",
    "PROJECT_TYPE": "//div[@id='projecttypecreditcheckaddinfo']",
    "CREDIT_VERIFICATION_BUTTON": "//button[@id='btn_creditcheck']",
    "CREDIT_VERIFICATION_RESULT": "//div[@id='bes-basiccreditcheck-pop']",
    "CLOSE_CREDITCHECK": "//button[@id='btn_cancelcreditcheck']",
    "FOLIO_NEMONICO": "//div[@id='basiccreditcheck_folioNumber']",
    "FOLIO_NEMONICO_FINAL": "//div[@id='finalcreditcheck_folioNumber']",
    "FOLIO_UNICO": "//div[@id='basiccreditcheck_FolionoBes']",
    "RESULT_BASIC_CC": "//div[@id='basiccreditcheck_result']",
    "RESULT_FINAL_CC": "//div[@id='finalcreditcheck_result']",
    "DROPDOWN_TIPO_DOC": "//label[@title='Tipo de Documento de Identificación']/following::input[@type='search' and contains(@class, 'hlds-input')][1]",
    "INPUT_NEW_ID": "//input[@id='inputidNumbercommoncertificate']",
}

CHANGE_NUMBER = {
    "MANUAL_NUM_BTN": "//button[@id='btn_manualChooseNumopenAcctnumchoose']",
    "SELECT_NUM_LBL": "//div[text()='Seleccionar Número']",
    "INPUT_MANUAL_NUM": "//input[@id='selectNumInputQueryString']",
    "SEARCH_MANUAL_NUM": "//div[@class='hlds-input-has-icon hlds-grid hlds-grow hlds-grid--vertical-align-center ng-scope hlds-input-has-icon--right']//*[name()='svg'][1]",
    "CONFIRM_MANUAL_NUM_BTN": "//span[normalize-space()='Confirmar']",
    "AUTO_NUM_BTN": "//button[@id='btn_autoChooseNumopenAcctnumchoose']",
    "VALIDATE_MANUAL_NUM": "//div[contains(text(), '{}') and @ng-bind='$Item.telNum']",
    "GET_AUTO_NUM": "//div[@id='numbercarddivopenAcctnumchoose']//div[@ng-bind='$Item.telNum']",
    "DROPDOWN_PHONE_REASON" : "//div[@id='changeNumChangeReasons']",
    "INPUT_PHONE_REASON" : "//div[@id='changeNumRemark']//textarea[@id='uee-002']",
    "BTN_MANUAL" : "//button[@id='btn_manualChooseNumresourceNumChooseId']",
    "BTN_AUTO" : "//button[@id='btn_autoChooseNumresourceNumChooseId']",
}

CHANGE_SIM = {
    "MANUAL_SIM_BTN": "//span[contains(@title,'Manual')]",
    "INPUT_MANUAL_SIM": "//input[@id='inputtxt_simcardICCIDsimcardsettingspop']",
    "VERIFY_SIM_CARD": "//button[@id='btn_simcardChecksimcardsettingspop']",
    "POPUP_SIM_DISPONIBLE": "//div[@class='popwin_content popwin_success bc_msgbox_img success']",
    "OK_SIM_DISPONIBLE": "//div[@class='msgbox-ok-text']",
    "SIM_AUTO_BTN": "//span[@title='Automático']",
    "SIM_WAREHOUSE_DROPDOWN": "//div[@label='salegoods.label.WarehouseCode']//input[@type='search']",
    "SIM_TYPE_DROPDOWN": "//div[@label='salegoods.label.simCardType']//input[@type='search']",
    "VERIFY_OFFER_BTN": "//button[@id='btn_verifyhandsetsimcardsettingspop']",
    "LBL_CHANGE_SIM" : "//span[normalize-space()='OPCIONES DE TARJETA SIM']",
    "LBL_REASON_CHANGE_SIM" : "//span[normalize-space()='MOTIVO DEL CAMBIO DE TARJETA']",
    "DROPDOWN_SIM_REASON" : "//div[@id='unionDelPartyIdchangecardreason']",
    "INPUT_SIM_REASON" : "//div[@id='changecardreason']//textarea[@id='uee-00K']",
}

MIGRATIONS = {
    "OUTSTANDING_PAYMENTS_FRAME": "//div[@id='popwin_title'][contains(.,'PAGOS PENDIENTES EN LA CUENTA')]",
    "PENALTY" : "//div[@id='penalty']",
    "OUTSTANDING_AMOUNT" : "//div[@id='outstandingAmount']",
    "TOTAL_TO_PAY" : "//div[@id='totalToPay']",
    "LOYALTY_POINTS" : "//div[@id='loyaltyPoints']",
    "PROCEDURE_RADIO_BTN" : "//label[@class='hlds-radio__label']//span[contains(@title,'{}')]",
    "LBL_TRAMIT" : "//span[normalize-space()='TIPO DE TRÁMITE']",
}