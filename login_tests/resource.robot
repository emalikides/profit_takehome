*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         www.reddit.com
${BROWSER}        Firefox
${DELAY}          10
${VALID USER}     demo
${VALID PASSWORD}   W44t
${LOGIN URL}      https://${SERVER}/login/
${SIGNUP URL}     https://${SERVER}/account/register/
${ERROR URL}      https://${SERVER}/error.html

*** Keywords ***
Open Browser To Signup Page
    Open Browser    ${SIGNUP URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Signup Page Should Be Open

Signup Page Should Be Open
    Title Should Be reddit.com: Join the worldwide conversation

Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be Reddit - Dive into anything


Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page