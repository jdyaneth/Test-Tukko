*** Settings ***
Library    SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${url}   http://localhost:5173/
${browser}    Firefox 
${API_URL}    http://localhost:8080

*** Keywords ***
Open Home
    Open Browser    ${url}    ${browser}

Max Window
    Maximize Browser Window


