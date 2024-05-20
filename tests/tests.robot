*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/setup_teardown.robot
Resource          ../resources/home_page.resource
Resource          ../resources/movie_page.resource

Suite Setup       Open Browser To Movies
Suite Teardown    Close Browser


*** Variables ***
${BROWSER}        chrome
${URL}            http://localhost:3000/

*** Test Cases ***
Sort Movies By Title
    [Documentation]  Sort movies by Title and assert the last movie in the list is The Phantom Menace
    Sort Movies By Title

View Movie Species
    [Documentation]  View the movie The Empire Strikes Back and check if the Species list has Wookie
    View Movie Species  'The Empire Strikes Back'

Planets Not In Movie
    [Documentation]  Assert that Planets Camino is not part of the movie The Phantom Menace
    Planets Not In Movie    'The Phantom Menace'   'Camino'