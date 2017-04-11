*** Settings ***
Documentation   keywords for category check
Library  Selenium2Library


*** Variables ***
${CONTAINER_CATEGORY}                   xpath=//*[@class="categoriaCard-lista container"]
${CATEGORY_MOBILE}                      //*[@href="/cursos-online-mobile"]
${CATEGORY_PROGRAMACAO}                 //*[@href="/cursos-online-programacao"]
${CATEGORY_FRONT}                       //*[@href="/cursos-online-front-end"]
${CATEGORY_INFRA}                       //*[@href="/cursos-online-infraestrutura"]
${CATEGORY_DESIGN}                      //*[@href="/cursos-online-design-ux"]
${CATEGORY_BUSINESS}                    //*[@href="/cursos-online-business"]
${HOME}                                 https://www.alura.com.br/


*** Keywords ***
Check if container list card exist
    page should contain element         ${CONTAINER_CATEGORY}

Check if container category list card is visible in page
    element should be visible           ${CONTAINER_CATEGORY}


Check Individual test of card list categories
    [Arguments]  ${wait_time}=30s  ${retry_interval}=3s     ${sleep}=2s
    #Verificar como criar uma lista pegando os elementos pelo partial link em robot, caso não funcione usar selenium com arquivo python
    @{list}     create list      ${CATEGORY_MOBILE}   ${CATEGORY_PROGRAMACAO}   ${CATEGORY_FRONT}   ${CATEGORY_INFRA}   ${CATEGORY_DESIGN}  ${CATEGORY_BUSINESS}
    :FOR    ${categoria}     IN      @{list}
    \   ${element}=        run keyword and return status            wait until keyword succeeds     ${wait_time}        ${retry_interval}  element should be visible         ${categoria}
    \   run keyword if       ${element} == True                click link      ${categoria}
    \   sleep  ${sleep}
    \   go to     ${HOME}