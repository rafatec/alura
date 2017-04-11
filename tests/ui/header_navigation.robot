*** Settings ***
Documentation   Test Verification the header menu navigation
Library             Selenium2Library


*** Variables ***
${LINK_CARRIER}                 xpath=//*[@class="header-carreiras"]
${LINK_LOGIN}                   xpath=//*[@class="header-areaAluno"]
${LINK_REGISTRATION}            xpath=//*[@class="header-cta"]
${HOME}                          https://www.alura.com.br/


*** Keywords ***
Check elements of menu item
    [Arguments]  ${wait_time}=10s  ${retry_interval}=3s     ${sleep}=3s
    @{list_elem}=       create list     ${LINK_CARRIER}    ${LINK_REGISTRATION}     ${LINK_LOGIN}
    :FOR    ${list_cat}     IN      @{list_elem}
     \      ${element_menu}=        run keyword and return status       wait until keyword succeeds   ${wait_time}        ${retry_interval}     page should contain element          ${list_cat}
     \      run keyword if           ${element_menu} == True        click element   ${list_cat}
     \      sleep  ${sleep}
     \      go to     ${HOME}









