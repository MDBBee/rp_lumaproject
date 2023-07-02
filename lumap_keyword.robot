*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         lumap_variables.robot
Library          FakerLibrary


*** Keywords ***
Precondition for login
    Open Browser  ${URL}   ${BROWSER}
    Maximize Browser Window
    Click Element    ${HOMEPAGE_SIGNIN_LINK}

Login with valid credentials and assert successful login
    [Arguments]   ${username}   ${password}   ${loggedInuser}
    Input Text    ${USERNAME_FIELD}     ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Element    ${LOGIN_BUTTON}
    Wait Until Page Contains    ${loggedInuser}   6s
    Capture Page Screenshot

users with invalid credentials should get correct error message
    [Arguments]   ${username}   ${password}   ${loggedInuser}
    Wait Until Element Is Visible    ${HOMEPAGE_SIGNIN_LINK}   6s
    Input Text    ${USERNAME_FIELD}     ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Element    ${LOGIN_BUTTON}
    Wait Until Page Does Not Contain    ${loggedInuser}   6s
    Capture Page Screenshot

Navigate to create account page
   Open Browser  ${URL}   ${BROWSER}
   Maximize Browser Window
   Wait Until Element Is Visible    ${CREATEACC_LINK}
   Click Element    ${CREATEACC_LINK}

Enter required data and create account
    Input Text    ${FIRSTNAME_FIELD}     Tester
    Input Text    ${LASTNAME_FIELD}      Testing
    Input Text    ${EMAIL_FIELD}    lanretesting@gmail.com
    Input Text  ${NEWACCPASSWORD_FIELD}  Testing123
    Input Text  ${CONFIRMPASSW_FIELD}  Testing123
    Click Element    ${CREATEACC_BTN}
    Wait Until Page Contains    Tester Testing  10s


Enter first for new user
  ${firstname}=  FakerLibrary.firstName
  log  ${firstname}
  Set Test Variable    ${firstname}
  Wait Until Element Is Visible   ${FIRSTNAME_FIELD}
  Input Text    ${FIRSTNAME_FIELD}    ${firstname}

Enter lastname for new user
  ${lastname}=  FakerLibrary.lastname
  log  ${lastname}
  Set Test Variable    ${lastname}
  Wait Until Element Is Visible   ${LASTNAME_FIELD}
  Input Text    ${LASTNAME_FIELD}    ${lastname}

Enter email for new user
  ${email}=  FakerLibrary.email
  log  ${email}
  Set Test Variable    ${email}
  Wait Until Element Is Visible    ${EMAIL_FIELD}
  Input Text     ${EMAIL_FIELD}    ${email}

Enter new user password, create account and assert account was created
    Input Text  ${NEWACCPASSWORD_FIELD}  Testing123
    Input Text  ${CONFIRMPASSW_FIELD}  Testing123
    Click Element    ${CREATEACC_BTN}
    Wait Until Page Contains    Thank you for registering with Main Website Store  10s

Modify address detail and save
    Wait Until Element Is Visible    ${ADDRBOOK_LINK}
    Click Element    ${ADDRBOOK_LINK}
    Wait Until Element Is Visible   ${ADDR_FIELD}
    Input Text    ${ADDR_FIELD}    1 testing avenue
    Input Text    ${CITY}   Helsinki
    Input Text    ${PHONE_NUMBER}    123456789
    Select From List By Label    ${COUNTRY}  Finland
    Select From List By Label   ${STATE}   Uusimaa
    Input Text    ${POSTCODE}    00000
    Click Element    ${SAVE_ADDR}

Go to user account page
    Wait Until Element Is Visible   ${USERDROPDOWN_BTN}
    Click Element    ${USERDROPDOWN_BTN}
    Wait Until Element Is Visible   ${MYACCT_BTN}
    Click Element    ${MYACCT_BTN}

sign out successfully
    Wait Until Element Is Visible   ${USERDROPDOWN_BTN}
    Click Element    ${USERDROPDOWN_BTN}
    Wait Until Element Is Visible    ${SIGN_OUT_BTN}
    Click Element    ${SIGN_OUT_BTN}