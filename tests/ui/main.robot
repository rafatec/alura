*** Settings ***
Documentation       Studyng selenium e robot with the Alura site
Library     Selenium2Library
Library     Screenshot
Resource    browser.robot
Resource    search.robot
Resource    header_navigation.robot
Resource    category_list_card.robot
Resource    login_alura.robot
Resource    registration_alura.robot
#Test Teardown    Take Screenshot

*** Variables ***


*** Test Cases ***
Access to the search field
    [Tags]  search_field
    Open Browser Site       https://www.alura.com.br/       firefox
    Check if it exists the header bar search in page
    Show search bar
    Input text in field for search          JAVA
    #Close Browser Site
    [Teardown]  run keyword if test failed  set test message    Test failed! Error access search bar

Check header menu navigation
    [Tags]  header_menu
    Open Browser Site       https://www.alura.com.br/       firefox
    Check elements of menu item
    Close Browser Site
    [Teardown]  run keyword if test failed  set test message    Test failed! Error access menu navigation


Check container category list card
    [Tags]  category_list_home
    Open Browser Site       https://www.alura.com.br/       firefox
    Check if container list card exist
    Check if container category list card is visible in page
    Check Individual test of card list categories
    Close Browser Site
    [Teardown]  run keyword if test failed  set test message    Test failed! Error ckeck category List



Login access page
    [Tags]  login_page
    Go to login page
    Login user      rfsilva@daitangroup.com         123456



Registration in page
    [Tags]      registration_page
    go to registration page
    Input user_name resgistration               Rafael Fernandes da Silva
    Input user_email resgistration              rfsilva@daitangroup.com
    Input user_cpf resgistration                333-333-333-33
