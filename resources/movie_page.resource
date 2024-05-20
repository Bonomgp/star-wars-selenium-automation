# WebElements for MoviePage

*** Variables ***
${species_list}            xpath://div[2]/div[3]
${planets_list}            xpath://div[2]/div[2]
${back_to_home_button}     xpath://a[text()='Back']


*** Keywords ***
Species Contains
    [Arguments]    ${species_name}
    Wait Until Element Is Visible    ${species_list}   10s
    ${species_elements}=    Get Text    ${species_list}
    Should Contain    ${species_elements}    ${species_name}

Planets Does Not Contain
    [Arguments]    ${planet_name}
    Wait Until Element Is Visible    ${planets_list}   10s
    ${planets_elements}=    Get Text    ${planets_list}
    Should Not Contain    ${planets_elements}    ${planet_name}