*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${base_Url}     https://pie.authz.wpp.api.hp.com

*** Test Cases ***
Create Service Access Token
    ${auth}=    Create List     2UaOr0pFqSvrFC53Cq1hFX4SDABJjz9Z        MOHw8qywuCSZTLdqEDI0oBjWfYiVSgQ6
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    mysession     ${base_Url}     auth=${auth}        headers=${headers}
    &{params}=  Create Dictionary   grant_type=client_credentials
    ${serviceResponse}=    POST On Session     mysession     /openid/v1/token        params=${params}
    Should Be Equal As Strings           ${serviceResponse.status_code}              ${200}
    ${serviceAccessToken}=         Convert To String        ${serviceResponse.json()['access_token']}
    Set Global Variable      ${serviceAccessToken}
    #${serviceAccessToken}=    evaluate    ${serviceResponse.json()['access_token']}
    #Log to Console  ${serviceAccessToken}
    #Set Global Variable      ${serviceAccessToken}

Create User Access Token
    ${auth}=    Create List     2UaOr0pFqSvrFC53Cq1hFX4SDABJjz9Z        MOHw8qywuCSZTLdqEDI0oBjWfYiVSgQ6
    #${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    mysession     ${base_Url}     auth=${auth}
    &{params}=  Create Dictionary   subject_token=${serviceAccessToken}      subject_token_type=urn:ietf:params:oauth:token-type:access_token        grant_type=urn:ietf:params:oauth:grant-type:token-exchange      requested_user_type=hp:authz:params:oauth:user-id-type:hpid     requested_user=7rmw9ikk78ga89iph8t6coxw638fdy7a
    ${userResponse}=    POST On Session     mysession     /openid/v1/token        params=${params}
    Should Be Equal As Strings           ${userResponse.status_code}              ${200}
    ${userAccessToken}=         Convert To String        ${userResponse.json()['access_token']}
    Set Global Variable      ${userAccessToken}