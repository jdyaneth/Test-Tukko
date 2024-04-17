*** Settings ***
Resource    ../resources/main.resource


*** Test Cases ***
TC109-003 - Back-end Test for Search Feature
    [Documentation]    Search bar test (back-end). Response status and the response body values will be checked. 
    [tags]  Smoke
    Create Session  user_session  ${API_URL}  verify=true
    ${response}=  GET On Session  user_session  /api/Locations/search/  params=query=helsinki
    Status Should Be  200  ${response}  #Check Status as 200

    #Check Title as Helsinki from Response Body
    ${name}=  Get Value From Json  ${response.json()}[0]  name
    ${nameFromList}=  Get From List   ${name}  0
    Should be equal  ${nameFromList}  Helsinki
