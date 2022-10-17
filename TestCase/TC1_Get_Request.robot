*** Settings ***
Library               RequestsLibrary

*** Variables ***
${base_Url}     https://gorest.co.in

*** Test Cases ***

Quick Get Request Test
    ${response}=    GET  ${base_Url}/public/v2/users
    ${status_code}=         Convert To String        ${response.status_code}
    Set Global Variable      ${status_code}
    #${status_code}=         ${response.status_code}
    Should Be Equal As Strings           ${respopostnse.status_code}              ${200}