*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${base_Url}     https://gorest.co.in
${bearerToken}      "Bearer 7232803c821bc49a0bd5c56d7df39c5289168e323fb17c5b6b1597d8941e33ef"

*** Test Cases ***
Quick Get Request Test
    Create Session    mySession    ${base_Url}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${bearerToken}
    ${response}=    Get Request    mySession    /public/v2/users    headers=${headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}