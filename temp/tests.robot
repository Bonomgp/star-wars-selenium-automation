*** Settings ***
Library           SeleniumLibrary
Resource          setup_teardown.robot
Library           HomePage.HomePage    ${DRIVER}    WITH NAME    HomePage
Library           MoviePage.MoviePage    ${DRIVER}   WITH NAME    MoviePage

Suite Setup       Open Browser To Movies
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:3000/


*** Test Cases ***
Sort Movies By Title
    [Documentation]  Sort movies by Title and assert the last movie in the list is The Phantom Menace
    Wait Until Element Is Visible    //th[text()='Title']    10s
    Click Element    //th[text()='Title']
    Wait Until Element Is Visible    //*[@data-testid='ArrowDropUpIcon']    10s
    Sleep    5s
    ${last_movie_title}=    Get Text    //tr[last()]/td[1]
    Should Be Equal    ${last_movie_title}    The Phantom Menace

View Movie Species
    [Documentation]  View the movie The Empire Strikes Back and check if the Species list has Wookie
    Click Element    //td/a[contains(text(),'The Empire Strikes Back')]
    Wait Until Element Is Visible    //div[2]/div[3]    10s
    ${species_elements}=    Get WebElements    //div[2]/div[3]
    
    Click Element    //a[text()='Back']
   
Planets Not In Movie
    [Documentation]  Assert that Planets Camino is not part of the movie The Phantom Menace
    Click Element    //td/a[contains(text(),'The Phantom Menace')]
    Wait Until Element Is Visible    //div[2]/div[2]    10s
    ${planets_elements}=    Get WebElements    //div[2]/div[2]
    Click Element    //a[text()='Back']