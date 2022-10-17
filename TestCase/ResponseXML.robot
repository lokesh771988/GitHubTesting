*** Settings ***
Library               RequestsLibrary
Library               Collections
Library               XML
Library               OperatingSystem

*** Variables ***
${base_Url}     http://thomas-bayer.com

*** Test Cases ***
XMLVerify
    Create Session    mySession    ${base_Url}
    ${response}=    Get Request    mySession    /sqlrest/CUSTOMER/15
    ${xml_respponse}=       Convert To String    ${response.content}
    ${xml_Obj}=     Parse Xml    ${xml_respponse}
    Log To Console    ${xml_Obj}
    Element Text Should Be    ${xml_Obj}    15  .//ID