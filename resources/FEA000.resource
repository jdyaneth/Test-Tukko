*** Settings ***
Resource    main.resource

*** Keywords ***
Theme Change
    Click Element    xpath://button[@class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-secondary text-secondary-foreground hover:bg-secondary/80 h-10 w-10"]

Wait Until Dark Mode
    Wait Until Element Is Visible    css:body[class="dark"]

Wait Until Light Mode
    Wait Until Element Is Not Visible    css:body[class="dark"]    
    Wait Until Element Is Visible    css:body[class=""]    

Language change
    Click Button    xpath://button[contains(text(), 'EN')]

Wait Until Fi
    Wait Until Element Is Visible    xpath://button[contains(text(), 'FI')]
    Wait Until Element Is Visible    css:input[placeholder="Etsi paikka"]

Click WIMMA Lab Logo
    Click Element    css=.wimmaLabLogo

Click IoTitude Logo
    Click Element    css=.iotitudeLogo
