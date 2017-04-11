*** Settings ***
Documentation       Test registration in alura
Library         Selenium2Library

*** Variables ***
${LOGIN_URL}                https://cursos.alura.com.br/compra/premium
${HOME}                     https://www.alura.com.br/
${NAME_REGIS_FIELD}         id=name
${NAME_EMAIL_FIELD}         id=userEmail
${CPF_EMAIL_FIELD}          id=cpf




*** Keywords ***
Go to registration page
    open browser        ${HOME}
    Go to               https://www.alura.com.br/planos-cursos-online
    go to               https://cursos.alura.com.br/compra/premium
    maximize browser window


Input user_name resgistration
    [Arguments]     ${user_name}

    wait until keyword succeeds     10s     3s      page should contain element         ${NAME_REGIS_FIELD}
    input text      ${NAME_REGIS_FIELD}        ${user_name}


Input user_email resgistration
    [Arguments]     ${user_email}

    wait until keyword succeeds     10s     3s      page should contain element         ${NAME_EMAIL_FIELD}
    input text      ${NAME_EMAIL_FIELD}        ${user_email}


Input user_cpf resgistration
    [Arguments]     ${user_cpf}

    wait until keyword succeeds     10s     3s      page should contain element         ${CPF_EMAIL_FIELD}
    input text      ${CPF_EMAIL_FIELD}        ${user_cpf}


Clik button realize search
    wait until keyword succeeds     10s     3s      page should contain element         ${NAME_EMAIL_FIELD}