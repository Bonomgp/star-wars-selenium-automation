*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Movies
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close Browser
    [Arguments]    ${force}=${False}
    Run Keyword And Ignore Error    Close Browser Without Errors
    IF    '${force}' == 'True'
        Run Keyword And Ignore Error    Close Browser Without Errors
    END

Close Browser Without Errors
    Try
        Close Browser
    Except
        Log    Failed to close browser gracefully.
    END
