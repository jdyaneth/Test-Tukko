*** Settings ***
Resource    FEA000.resource


*** Test Cases ***
TC000-000
    [Documentation]    Testing Zoom in and out elements
    Open Home
    Max Window
    Click Element    css:.leaflet-control-zoom-in
    Click Element    css:.leaflet-control-zoom-out
    [Teardown]    Close Browser


TC000-001
    [Documentation]    Feedback Button check
    Open Home
    Max Window
    Click Element    css:button[data-state="closed"]
    Log    Title should have 10 or more characters    
    Input Text    css:input[name="title"]    TestingTitle
    Log    Description should have 20 or more characters
    Input Text    css:textarea[name="description"]    TestingDescriptionrandomtestgeneratedfortesting
    Click Button    xpath://button[contains(text(), 'Submit')]
    [Teardown]    Close Browser


TC000-002
    [Documentation]    Checking Theme button
    Open Home
    Max Window
    Theme Change
    Wait Until Light Mode
    Capture Page Screenshot
    Theme Change
    Wait Until Dark Mode
    Capture Page Screenshot
    [Teardown]    Close Browser


TC000-003
    [Documentation]    Testing Language changes
    Open Home
    Max Window
    Language change
    Wait Until Fi
    [Teardown]    Close Browser


# TC000-004
#     [Documentation]    Testing Wimmalab and IoTitude links
#     Open Home
#     Max Window
#     Click WIMMA Lab Logo
#     Click IoTitude Logo
#     [Teardown]    Close Browser

TC000-005
    [Documentation]    Testing Draw tool Buttons
    Open Home
    Max Window
    Click Element    css:div[title="Draw Rectangle"]
    Click Element    css:div[title="Draw Polygons"]
    Click Element    css:div[title="Draw Circle"]
    Click Element    css:div[title="Remove Layers"]
    [Teardown]    Close Browser

#TC000-010
