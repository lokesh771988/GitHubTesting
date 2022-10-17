*** Settings ***
Library               RequestsLibrary

*** Variables ***
${base_Url}     https://reqres.in

*** Test Cases ***

Quick Verify Get Request Test

    Should Be Equal As Strings           ${status_code}              ${200}