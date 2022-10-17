*** Settings ***
Library               XML
Library               OperatingSystem
Library               Collections

*** Test Cases ***
TestCase1
    ${xml_File}=    Parse Xml    C:\\Users\\GorantlL\\Documents\\BackUp Floder\\BackUp Floder\\My Documents\\RobotFramework_API\\MyXML.xml

    #check Single Value
    ${test_Name}=       Get Element Text    ${xml_File}     .//Test[1]/Name
    Should Be Equal    ${test_Name}    Convert number to string

    #Approche two indirect way
    ${test_Name}=       Get Element     ${xml_File}     .//Test[1]/Name
    Should Be Equal    ${test_Name.text}    Convert number to string

    #3rd single line
    Element Text Should Be    ${xml_File}    Convert number to string       .//Test[1]/Name

    #we can find count of tags
    ${count}=       Get Element Count    ${xml_File}    .//Test
    Log To Console    ${count}

    # verifying using attribute value
    Element Attribute Should Be    ${xml_File}    TestId    0001    .//Test[1]

    #get All Child Elements
    ${child_Element}=   Get Child Elements    ${xml_File}   .//Test[1]
    Should Not Be Empty    ${child_Element}

    ${fName}=   Get Element Text    ${child_Element[0]}
    Should Be Equal    ${fName}    Convert number to string