*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:3000/
${DRIVER}         None

*** Keywords ***
Open Browser To Movies
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Store the WebDriver instance in a global variable
    ${DRIVER}=    Set Variable    ${BROWSER}
    Set Global Variable    ${DRIVER}

Close Browser
    Close Browser
