*** Settings ***
Documentation   tests verifying new accounts creation
Resource  lumap_keyword.robot

*** Test Cases ***
verify new user can create account
  Navigate to create account page
  Enter first for new user
  Enter lastname for new user
  Enter email for new user
  Enter new user password, create account and assert account was created

Modify user address
  [Tags]  Modify
  Precondition for login
  Login with valid credentials and assert successful login  	thomas02@example.org  Testing123   	Madeline Gregory
  Go to user account page
  Modify address detail and save



