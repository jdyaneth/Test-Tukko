*** Settings ***
Resource    FEA000.resource


# These test cases test the initial Tukko's back-end

*** Test Cases ***
TC000-006
    [Documentation]    GET stations/{id} test on API
    [tags]  Smoke
    Create Session  mysession  ${API_URL}  verify=true
    ${response}=  GET On Session  mysession  /stations/24607
    Status Should Be  200  ${response}  #Check Status as 200

    ${name}=  Get Value From Json  ${response.json()}[0]  name
    ${nameFromList}=  Get From List   ${name}  0
    Should be equal  ${nameFromList}  vt1_Karnainen

TC000-007
    [Documentation]    GET /roadworks test on API
    [tags]  Smoke
    Create Session  mysession  ${API_URL}  verify=true
    ${response}=  GET On Session  mysession  /roadworks    params=primaryPointRoadNumber=8102&primaryPointRoadSection=1&secondaryPointRoadNumber=8102&secondaryPointRoadSection=1&startTimeOnAfter=2020-05-30T15%3A13%3A26.000Z&startTimeOnBefore=2030-05-30T15%3A13%3A26.000Z&severity=HIGH    
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
    ${response}=  GET On Session  mysession  /sensors    params=lastUpdated=false&id=5119&stationId=24607&measuredTimeOnAfter=2020-05-30T15%3A13%3A26.000Z&measuredTimeOnBefore=2030-05-30T15%3A13%3A26.000Z&valueGte=10&valueLte=5000    
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
    ${response}=  GET On Session  mysession  /stations    params=lastUpdated=false&longitude=24&latitude=60&radius=50&roadNumber=1&roadSection=12&municipalityCode=444&provinceCode=1    
    Status Should Be  200  ${response}
    
    ${name}=  Get Value From Json  ${response.json()}[0]  name
    ${nameFromList}=  Get From List   ${name}  0
    Should be equal  ${nameFromList}  vt1_Karnainen
    # Status	
    # 200: A list of sensors works.
    # 400: Invalid parameter value.
    # 404: sensors are not found.
    # 500: Internal server error.