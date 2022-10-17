*** Settings ***
Library               RequestsLibrary
Library               Collections
Library               JSONLibrary

*** Variables ***
${base_Url}     https://gorest.co.in

*** Test Cases ***
Quick Get Request Test
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer 7232803c821bc49a0bd5c56d7df39c5289168e323fb17c5b6b1597d8941e33ef
    Create Session    mySession    ${base_Url}      headers=${headers}
    ${response}=    Get Request    mySession    /public/v2/users
    ${json_object}=     To Json   ${response.content}
    ${id}=      Get Value From Json    ${json_object}     $.[1].id
    Log To Console    ${id}
    Should Be Equal    ${id}    2797
