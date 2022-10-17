*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${base_Url}     https://postman-echo.com

*** Test Cases ***
BasicAuth
     ${auth}=    Create List     postman     password
    Create Session    mySession    ${base_Url}  auth=${auth}
    ${response}=    Get Request    mySession    /basic-auth
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}