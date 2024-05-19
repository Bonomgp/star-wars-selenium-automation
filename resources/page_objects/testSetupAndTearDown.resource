*** Settings ***
Resource    ../resources/worker.resource

*** Variables ***
${DEFAULT_WINDOW_WIDTH}    1920
${DEFAULT_WINDOW_HEIGHT}   1080

*** Keywords ***
Open Application
    [Arguments]    ${selenium_speed}    ${selenium_timeout}    ${browser}    ${url}
    Set Selenium Speed    ${selenium_speed}
    Set Selenium Timeout    ${selenium_timeout}
    Open Browser To Home Page    ${browser}    ${url}

Close Application
    Close Browser
