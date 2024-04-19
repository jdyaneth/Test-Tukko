*** Settings ***
Resource    ../resources/main.resource

# This test suite contains test cases for Acceptance testing

*** Test Cases ***
AT001 - Testing markers front end
    [Documentation]    Testing whether the markers appear in front-end
    Open Home
    Max Window
    Wait Until Element Is Visible    css=div.leaflet-marker-icon.customMarker.leaflet-zoom-animated.leaflet-interactive
    Log    Markers appear as usual
    [Teardown]    Close Browser

    
AT002 - GET /stations test on API
    [Documentation]    GET /stations test on API. Response status will be checked.
    [tags]  Smoke
    Create Session  user_session  ${API_URL}  verify=true
    ${response}=  GET On Session  user_session  /api/Stations      
    Status Should Be  200  ${response}

    # Status	
    # 200: A list of sensors works.
    # 400: Invalid parameter value.
    # 404: sensors are not found.
    # 500: Internal server error.


AT003 - Real-Time /stations/{id}/history test on API
    [Documentation]    GET /stations/{id}/history test on API. Response status will be checked. Date of the retrieved data will be checked. 
    [tags]  Smoke
    Create Session  user_session  ${API_URL}  verify=true
    ${response}=  GET On Session  user_session  /api/Stations/24607/history    params=timeRange=Today      
    Status Should Be  200  ${response}

    ${Current_Date}    Get Current Date    result_format=%Y-%m-%d
    ${Formatted_Date}    Set Variable    ${Current_Date}T00:00:00Z

    ${endTime}=  Get Value From Json  ${response.json()}  sensors[0].timeWindowEnd
    ${endTimeFromList}=  Get From List   ${endTime}    0
    Should be equal  ${endTimeFromList}  ${Formatted_Date}
    Log    History data is shown Real-Time!


AT004 - Map tiles are visible
    [Documentation]    Testing whether the map is visible in front-end
    Open Home
    Max Window
    Wait Until Element Is Visible    xpath=//img[@src="https://a.tile.openstreetmap.org/12/2331/1185.png"]
    [Teardown]    Close Browser

