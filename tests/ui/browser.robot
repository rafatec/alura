*** Settings ***
Documentation   keywords that aid in maneging  browsers
Library  Selenium2Library


*** Variables ***



*** Keywords ***
Open Browser Site
    [Arguments]          ${URL_SITE}         ${BROWSER}
    open browser         ${URL_SITE}         ${BROWSER}


Close Browser Site
    close browser