*** Settings ***
Library    SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${url}   http://128.214.255.43:5173
${browser}    Firefox 
${API_URL}    http://128.214.255.43:3001    

*** Keywords ***
Open Home
    Open Browser    ${url}    ${browser}

Max Window
    Maximize Browser Window

