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
${DELAY}          2
${VALID USER}     ExtraManagement8215
${VALID EMAIL}    bob@hotmail.com
${VALID PASSWORD}   W44tW44t
${LOGIN URL}      https://${SERVER}/login/
${ERROR URL}      https://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be     reddit.com: Log in

Input User
    [Arguments]    ${user}
    Input Text      loginUsername       ${user}

Input Password
    [Arguments]    ${password}
    Input Text      loginPassword    ${password}

Submit Credentials
    Click Element         class:AnimatedForm__submitButton.m-full-width

Welcome Page Should Be Open
    Location Should Be    https://${SERVER}/
    Title Should Be     Reddit - Dive into anything

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open
