*** Settings ***
Documentation  Resource for login users
Library         Selenium2Library


*** Variables ***
${LOGIN_URL}                https://cursos.alura.com.br/loginForm?urlAfterLogin=https://cursos.alura.com.br/dashboard
${HOME}                     https://www.alura.com.br/
${EMAIL_LOGIN_FIELD}        id=login-email
${PASS_LOGIN_FIELD}         name=password
${BUTTON_LOGIN}             xpath=//*[@class="btn-login"]


*** Keywords ***
Go to login page
    open browser        ${HOME}
    Go to               ${LOGIN_URL}


Input user email in page
    [Arguments]     ${user_email}

    wait until keyword succeeds     10s     3s      page should contain element         ${EMAIL_LOGIN_FIELD}
    input text      ${EMAIL_LOGIN_FIELD}        ${user_email}


Input user pass in page
    [Arguments]     ${pass}

    wait until keyword succeeds     10s     3s      page should contain element         ${PASS_LOGIN_FIELD}
    input text      ${PASS_LOGIN_FIELD}        ${pass}


Login user
    [Arguments]     ${user_email}       ${pass}

    Input user email in page    ${user_email}
    Input user pass in page     ${pass}
    click element               ${BUTTON_LOGIN}