*** Settings ***
Library    SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${url}   http://128.214.255.43:5175
${browser}    Firefox 
${API_URL}    http://localhost:8080

*** Keywords ***
Open Home
    Open Browser    ${url}    ${browser}

Max Window
    Maximize Browser Window

Theme Change
    Click Element    css=.react-toggle-track

Wait Until Dark Mode
    Wait Until Element Is Visible    css:body[class="dark"]

Wait Until Light Mode
    Wait Until Element Is Not Visible    css:body[class="dark"]    
    Wait Until Element Is Visible    css:body[class=""]    

Language change
    Click Element    css=.langContainer

Wait Until Fi
    Wait Until Element Is Visible    css:button[class="languageToggle fi fi-fi"]

Click WIMMA Lab Logo
    Click Element    css=.wimmaLabLogo

Click IoTitude Logo
    Click Element    css=.iotitudeLogo
