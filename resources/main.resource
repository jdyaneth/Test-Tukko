*** Settings ***
Library    SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library    DateTime


*** Variables ***
${url}   http://128.214.255.43:5175
${browser}    Firefox 
${API_URL}    http://128.214.255.43:8080 

*** Keywords ***
Open Home
    Open Browser    ${url}    ${browser}

Max Window
    Maximize Browser Window