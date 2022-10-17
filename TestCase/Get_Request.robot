*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${base_Url}     https://gorest.co.in

*** Test Cases ***
Quick Get Request Test
    Create Session    mySession    ${base_Url}
    ${response}=    Get Request    mySession    /public/v2/users
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${statusCode}=      Convert To Integer      ${response.status_code}
    Should Be Equal As Integers    ${statusCode}    200
    ${body}=        Convert To String       ${response.content}
    Should Contain    ${body}    Rajiv Asan DVM

    ${contentype}=      Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentype}    application/json; charset=utf-8