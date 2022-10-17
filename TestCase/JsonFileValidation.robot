*** Settings ***
Library               JSONLibrary
Library               OperatingSystem
Library               Collections

*** Test Cases ***
TestCase1
    ${json_File}=    Load JSON From File    C:\\Users\\GorantlL\\Documents\\BackUp Floder\\BackUp Floder\\My Documents\\RobotFramework_API\\Sample.js

    #check Single Value
    ${firstName}=       Get Value From Json    ${json_File}     $.firstName
    Log To Console    ${firstName[0]}
    Should Be Equal    ${firstName[0]}    Rack

    ${address}=       Get Value From Json    ${json_File}     $.address.streetAddress
    Log To Console    ${address[0]}
    Should Be Equal    ${address[0]}    126

