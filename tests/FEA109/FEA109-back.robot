*** Settings ***
Resource    FEA109.resource


*** Test Cases ***
TC109-003
    [Documentation]    Search bar test (back-end)
    [tags]  Smoke
    Create Session  mysession  ${API_URL}  verify=true
    ${response}=  GET On Session  mysession  /api/Locations/search/  params=query=helsinki
    Status Should Be  200  ${response}  #Check Status as 200

    #Check Title as Helsinki from Response Body
    ${name}=  Get Value From Json  ${response.json()}[0]  name
    ${nameFromList}=  Get From List   ${name}  0
    Should be equal  ${nameFromList}  Helsinki