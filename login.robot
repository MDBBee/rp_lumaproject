*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         lumap_keyword.robot
Resource         lumap_variables.robot
Suite Setup      Precondition for login

*** Test Cases ***
Navigate to home page and login with valid credentials
    [Tags]    DEBUG
    Login with valid credentials and assert successful login   ${USERNAME}   ${PASSWORD}   ${LOGGEDINUSER}
    [Teardown]   sign out successfully

Verify that Invalid credentials should not login successfully
    [Tags]    Bobby
    #[Setup]   Precondition for login
    [Template]    users with invalid credentials should get correct error message
    ${USERNAME}            ${INVALID_PASSWORD}        ${LOGGEDINUSER}
    ${INVALID_USERNAME}    ${PASSWORD}                ${LOGGEDINUSER}
    ${INVALID_USERNAME}    ${INVALID_PASSWORD}        ${LOGGEDINUSER}
    ${EMPTY}               ${EMPTY}                   ${LOGGEDINUSER}

