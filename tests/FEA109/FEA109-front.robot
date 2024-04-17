*** Settings ***
Resource    FEA109.resource


*** Test Cases ***
TC109-001
    [Documentation]    Search bar check (Front-end)
    Open Home
    Max Window
    Input Text    css:input[name="query"]    turku
    Click Element    xpath=//button[@class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-primary underline-offset-4 hover:underline h-10 w-10 shrink-0"]
    Wait Until Element Is Visible    xpath=//div[@class="px-5 py-2.5 border-b last:border-0 hover:bg-muted hover:cursor-pointer"]
    Log    The Search result has appeared
    Click Element    xpath=//div[@class="px-5 py-2.5 border-b last:border-0 hover:bg-muted hover:cursor-pointer"]
    Wait Until Element Is Visible    xpath=//img[@src="https://a.tile.openstreetmap.org/12/2301/1179.png"]
    Log    Location: (60.45721779774396, 22.236328125) will be visible on the map. (True Location: Pitkämäki, Turku)
    Click Element    //button[text()="Close"]    
    [Teardown]    Close Browser


# *** Test Cases ***
# TC109-003
#     [Documentation]    Search bar test (back-end)
#     [tags]  Smoke
#     Create Session  mysession  ${API_URL}  verify=true
#     ${response}=  GET On Session  mysession  /api/Locations/search/  params=query=helsinki
#     Status Should Be  200  ${response}  #Check Status as 200

#     #Check Title as Helsinki from Response Body
#     ${name}=  Get Value From Json  ${response.json()}[0]  name
#     ${nameFromList}=  Get From List   ${name}  0
#     Should be equal  ${nameFromList}  Helsinki