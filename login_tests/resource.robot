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

Click UserDropDown
    Click Button         USER_DROPDOWN_ID

DropDownMenu Should Be Visible
    ${dropdownmenu}=   Get WebElement        css:div[role='menu']
    Should Not Be Equal As Strings      ${dropdownmenu}         None    


Click LogOut
    ${logout_btn}=       Execute JavaScript      return [... document.querySelectorAll('span')].filter((el)=>(el.textContent === 'Log Out'))[0]
    Click Element       ${logout_btn}
    Sleep       5
    Username Should Not Be Visible
    Sleep       5


Username Should Not Be Visible
    ${username_el}=       Execute JavaScript      return [... document.querySelectorAll('span')].filter((el)=>(el.textContent === '${VALID USER}'))[0]
    Should Be Equal As Strings      ${username_el}      None



