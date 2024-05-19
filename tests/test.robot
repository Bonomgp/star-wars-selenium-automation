*** Settings ***
Library    SeleniumLibrary
Library    ../resources/SetupAndTearDown.py
Library    ../resources/SetupAndTearDown.SetupAndTearDown        ${driver}
Library    ../resources/page_objects/home_page.py
Library    ../resources/page_objects/home_page.HomePage    ${driver}

*** Variables ***
${URL}    http://localhost:3000  # Replace with your actual URL

*** Test Cases ***
Sort Movies By Title Ascending And Assert Last Movie
    Open Browser To Movie Page
    
    ${last_movie}    Get Last Movie Title
    Should Be Equal    ${last_movie}    The Phantom Menace
    [Teardown]    Close Browser    # Close browser after the test


*** Keywords ***
Open Browser To Movie Page
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

Sort Movies By Title
    [Arguments]    ${direction}
    ${sort_icon} =    Set Variable If    '${direction}' == 'asc'    ${arrow_drop_up_icon}    ${arrow_drop_down_icon}
    ${opposite_icon} =    Set Variable If    '${direction}' == 'asc'    ${arrow_drop_down_icon}    ${arrow_drop_up_icon}
    ${is_opposite_icon_displayed} =    Run Keyword And Return Status    Element Should Be Visible    ${opposite_icon}
    Run Keyword If    '${is_opposite_icon_displayed}'    Click Element    ${sort_title_header}


Get Last Movie Title
    [Return]    ${last_movie}
    ${last_movie} =    Get Text    ${last_movie_title}