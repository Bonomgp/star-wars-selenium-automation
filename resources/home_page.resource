# WebElements for HomePage

*** Variables ***
${sort_title_header}        xpath://th[text()='Title']
${arrow_drop_up_icon}       xpath://*[@data-testid='ArrowDropUpIcon']
${arrow_drop_down_icon}     xpath://*[@data-testid='ArrowDropDownIcon']
${last_movie_title}         xpath://tr[last()]/td[1]
${specific_movie_title_locator}  xpath://td/a[contains(text(),'{title}')]
${home_logo}                xpath://section/img



*** Keywords ***
Sort Movies By Title
    Wait Until Element Is Visible    ${sort_title_header}    10s
    Click Element    ${sort_title_header}
    Wait Until Element Is Visible    ${arrow_drop_up_icon}   10s
    Sleep    5s
    ${last_movie_title}=    Get Text    ${last_movie_title}
    Should Be Equal    ${last_movie_title}    The Phantom Menace

View Movie Species
    [Arguments]    ${title}
    Wait Until Element Is Visible    ${specific_movie_title_locator.format(title=${title})}    10s
    Click Element    ${specific_movie_title_locator.format(title=${title})}
    Wait Until Element Is Visible    ${species_list}   10s
    ${species_elements}=    Get Text    ${species_list}
    Should Contain    ${species_elements}    Wookie
    Click Element    ${back_to_home_button}

Planets Not In Movie
    [Arguments]    ${title}    ${planet}
    Wait Until Element Is Visible    ${specific_movie_title_locator.format(title=${title})}    10s
    Click Element    ${specific_movie_title_locator.format(title=${title})}
    Wait Until Element Is Visible    ${planets_list}    10s
    ${planets_elements}=    Get Text    ${planets_list}
    Should Not Contain    ${planets_elements}    ${planet}
    Click Element    ${back_to_home_button}