*** Settings ***
Resource    FEA000.resource


# These test cases test the initial Tukko's back-end

*** Test Cases ***
TC000-006
    [Documentation]    GET stations/{id} test on API
    [tags]  Smoke
    Create Session  mysession  ${API_URL}  verify=true
    ${response}=  GET On Session  mysession  /api/stations/24607
    Status Should Be  200  ${response}  #Check Status as 200

    ${name}=  Get Value From Json  ${response.json()}  name
    ${nameFromList}=  Get From List   ${name}  0
    Should be equal  ${nameFromList}  vt1_Karnainen

TC000-007
    [Documentation]    GET /roadworks test on API
    [tags]  Smoke
    Create Session  mysession  ${API_URL}  verify=true
    ${response}=  GET On Session  mysession  /api/Roadworks    params=primaryPointRoadNumber=8102&primaryPointRoadSection=1&secondaryPointRoadNumber=8102&secondaryPointRoadSection=5&severity=HIGH    
    Status Should Be  200  ${response}  

    # Status	
    # 200: A list of road works.
    # 400: Invalid parameter value.
    # 404: Road works are not found.
    # 500: Internal server error.


TC000-008
    [Documentation]    GET /sensors test on API
    [tags]  Smoke
    Create Session  mysession  ${API_URL}  verify=true
    ${response}=  GET On Session  mysession  /api/Sensors    params=stationId=24607    
    Status Should Be  200  ${response}

    # Status	
    # 200: A list of sensors works.
    # 400: Invalid parameter value.
    # 404: sensors are not found.
    # 500: Internal server error.


TC000-009
    [Documentation]    GET /stations test on API
    [tags]  Smoke
    Create Session  mysession  ${API_URL}  verify=true
    ${response}=  GET On Session  mysession  /api/Stations      
    Status Should Be  200  ${response}
    
    # ${name}=  Get Value From Json  ${response.json()}[0]  name
    # ${nameFromList}=  Get From List   ${name}  0
    # Should be equal  ${nameFromList}  vt1_Karnainen
    # Status	
    # 200: A list of sensors works.
    # 400: Invalid parameter value.
    # 404: sensors are not found.
    # 500: Internal server error.