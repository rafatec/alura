*** Settings ***
Documentation       Tests for verification the search in page
Library             Selenium2Library


*** Variables ***
${SEARCH_BAR}                       xpath=//*[@class="header-barraBusca"]
${IDENTIFIER_HEADER_BAR}            xpath=//*[@class="header-busca"]
${FIELD_SEARCH}                     xpath=//*[@id="header-barraBusca-campoBusca"]
${BUTTON_SEARCH}                    xpath=//*[@class="header-barraBusca-submit"]




*** Keywords ***
Check if it exists the header bar search in page
    [Arguments]  ${element}=${IDENTIFIER_HEADER_BAR}      ${wait_time}=10s  ${retry_interval}=3s
    Wait Until Keyword Succeeds  ${wait_time}  ${retry_interval}        page should contain element         ${SEARCH_BAR}   #Verifica se contem o elemento na página
    Wait Until Keyword Succeeds  ${wait_time}  ${retry_interval}        element should be visible           ${SEARCH_BAR}   #Verifica se o elemento está lógicamente visível na página
    sleep  2s

Show search bar
    [Arguments]  ${element}=${IDENTIFIER_HEADER_BAR}      ${wait_time}=10s  ${retry_interval}=3s
     Wait Until Keyword Succeeds  ${wait_time}  ${retry_interval}  Element Should Be Visible  ${element}
     click element      ${element}         #Elemento responsável pela liberação da barra de pesquisa
     sleep  2s



Input text in field for search
   [Arguments]  ${term}     ${element}=${FIELD_SEARCH}       ${wait_time}=5s  ${retry_interval}=1s
    Wait Until Keyword Succeeds  ${wait_time}  ${retry_interval}  Element Should Be Visible  ${element}
    click element  ${element}
    sleep  2s
    input text      ${FIELD_SEARCH}         ${term}
    sleep  2s
    click element   ${BUTTON_SEARCH}




