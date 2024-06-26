*** Settings ***
Resource    ../../resources/main.resource


# These test cases test the Tukko V1.1's back-end as a regression test. 

*** Test Cases ***
TC000-006 - GET stations/{id} test on API
    [Documentation]    GET stations/{id} test on API. Response status and the response body will be checked.
    [tags]  Smoke
    Create Session  user_session  ${API_URL}  verify=true
    ${response}=  GET On Session  user_session  /api/stations/24607
    Status Should Be  200  ${response}  #Check Status as 200

    ${name}=  Get Value From Json  ${response.json()}  name
    ${nameFromList}=  Get From List   ${name}  0
    Should be equal  ${nameFromList}  vt1_Karnainen

TC000-007 - GET /roadworks test on API
    [Documentation]    GET /roadworks test on API. Response status will be checked.
    [tags]  Smoke
    Create Session  user_session  ${API_URL}  verify=true
    ${response}=  GET On Session  user_session  /api/Roadworks        
    Status Should Be  200  ${response}  

    # Status	
    # 200: A list of road works.
    # 400: Invalid parameter value.
    # 404: Road works are not found.
    # 500: Internal server error.

TC000-007.1 Test if reponse has mandatory fields
    [Documentation]    GET /roadworks test on API
    [tags]  Smoke
    Create Session  user_session  ${API_URL}  verify=true
    ${response}=  GET On Session  user_session  /api/Roadworks        
    Status Should Be  200  ${response}  
    ${start}=  Get Value From Json  ${response.json()}[0]  startTime
 
    


TC000-008 - GET /sensors test on API
    [Documentation]    GET /sensors test on API. Response status will be checked.
    [tags]  Smoke
    Create Session  user_session  ${API_URL}  verify=true
    ${response}=  GET On Session  user_session  /api/Sensors    params=stationId=24607    
    Status Should Be  200  ${response}

    # Status	
    # 200: A list of sensors works.
    # 400: Invalid parameter value.
    # 404: sensors are not found.
    # 500: Internal server error.


TC000-009 - GET /stations test on API
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



# params=primaryPointRoadNumber=8102&primaryPointRoadSection=1&secondaryPointRoadNumber=8102&secondaryPointRoadSection=5&severity=HIGH