*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${base_Url}     https://gorest.co.in

*** Test Cases ***
Quick Post Request Test
    Create Session    mySession    ${base_Url}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer 7232803c821bc49a0bd5c56d7df39c5289168e323fb17c5b6b1597d8941e33ef
    ${body}=        Create Dictionary    name=Tenali Ramakrishna3   gender=male     email=tenali.ramakrishna3@15ce.com      status=active
    ${response}=    Post Request    mySession    /public/v2/users   headers=${headers}   data=${body}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
    ${statusCode}=      Convert To Integer      ${response.status_code}
    Should Be Equal As Integers    ${statusCode}    200
