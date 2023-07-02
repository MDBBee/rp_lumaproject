*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary



*** Variables ***
${URL}   https://magento.softwaretestingboard.com/
${BROWSER}   chrome
${HOMEPAGE_SIGNIN_LINK}   link:Sign In
${USERNAME_FIELD}   name:login[username]
${USERNAME}   bobbylewis@gmail.com
${PASSWORD_FIELD}   id:pass
${PASSWORD}   Testing123
${LOGIN_BUTTON}   name:send
${LOGGEDINUSER}  Bobby Lewis
${INVALID_USERNAME}   bobblewis@gmail.com
${INVALID_PASSWORD}   Testing12
${CREATEACC_LINK}  xpath:/html/body/div[1]/header/div[1]/div/ul/li[3]/a
${FIRSTNAME_FIELD}  id:firstname
${LASTNAME_FIELD}  id:lastname
${EMAIL_FIELD}  id:email_address
${NEWACCPASSWORD_FIELD}  id:password
${CONFIRMPASSW_FIELD}  name:password_confirmation
${CREATEACC_BTN}  xpath://*[@id="form-validate"]/div/div[1]/button/span
${ADDRBOOK_LINK}  xpath://*[@id="block-collapsible-nav"]/ul/li[6]/a
${ADDR_FIELD}  id:street_1
${CITY}  id:city
${PHONE_NUMBER}  id:telephone
${STATE}  name:region_id
${POSTCODE}  name:postcode
${COUNTRY}  name:country_id
${SAVE_ADDR}  xpath://*[@id="form-validate"]/div/div[1]/button/span
${USERDROPDOWN_BTN}   xpath:/html/body/div[1]/header/div[1]/div/ul/li[2]/span
${MYACCT_BTN}   xpath:/html/body/div[1]/header/div[1]/div/ul/li[2]/div/ul/li[1]/a
${SIGN_OUT_BTN}   link:Sign Out
