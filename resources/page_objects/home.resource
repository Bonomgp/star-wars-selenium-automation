*** Variables ***
${sort_title_header}    xpath://th[text()='Title']
${arrow_drop_up_icon}      xpath://*[@data-testid='ArrowDropUpIcon']
${arrow_drop_down_icon}     xpath://*[@data-testid='ArrowDropDownIcon']
${last_movie_title}    xpath://tr[6]/td[1]
${specific_movie_title_locator}    xpath://td/a[contains(text(),'{title}')]
${home_logo}    xpath://section/img