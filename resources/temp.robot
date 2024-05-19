*** Settings ***
Library    SeleniumLibrary
Library    SetupAndTearDown.py
Library    SetupAndTearDown.SetupAndTearDown        ${driver}
Library    page_objects/HomePage.py
Library    page_objects/HomePage.HomePage    WITH NAME    HomePage
Library    page_objects/MoviePage.py
Library    page_objects/MoviePage.MoviePage   WITH NAME    MoviePage

*** Variables ***
${URL}    http://localhost:3000  # Replace with your actual URL

Suite Setup    Open Browser    ${URL}     Chrome
Suite Teardown    Close Browser


*** Variables ***
${MOVIE_TITLE}    The Phantom Menace
${SPECIES_NAME}   Wookie
${PLANET_NAME}    Camino

*** Test Cases ***
Sort Movies By Title
    [Documentation]  Sort movies by Title and assert the last movie in the list is The Phantom Menace
    HomePage.Sort By Title    asc
    ${last_movie_title}=  HomePage.Get Last Movie Title
    Should Be Equal    ${last_movie_title}    ${MOVIE_TITLE}

View Movie Species
    [Documentation]  View the movie The Empire Strikes Back and check if the Species list has Wookie
    HomePage.Click Specific Movie Title    The Empire Strikes Back
    ${species_contains_wookie}=  MoviePage.Species Contains    Wookie
    Should Be True    ${species_contains_wookie}

Planets Not In Movie
    [Documentation]  Assert that Planets Camino is not part of the movie The Phantom Menace
    HomePage.Click Specific Movie Title    The Phantom Menace
    ${planets_does_not_contain_camino}=  MoviePage.Planets Does Not Contain    Camino
    Should Be True    ${planets_does_not_contain_camino}