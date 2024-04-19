*** Settings ***
Resource    ../../resources/main.resource


*** Test Cases ***
TC109-001 - User can search for specific place
    [Documentation]    Search bar check (Front-end)
    Open Home
    Max Window
    Input Text    css:input[name="query"]    turku
    Click Element    xpath=//button[@class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 text-primary underline-offset-4 hover:underline h-10 w-10 shrink-0"]
    Wait Until Page Contains    Turku, Turun seutukunta, Varsinais-Suomi, Lounais-Suomen aluehallintovirasto, Manner-Suomi, Suomi / Finland    
    Log    The Search result has appeared
    Click Element    xpath=//div[@class="p-5 border-b last:border-0 hover:bg-muted hover:cursor-pointer"]
    Wait Until Element Is Visible    xpath=//img[@src="https://b.tile.openstreetmap.org/14/9205/4716.png"]
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