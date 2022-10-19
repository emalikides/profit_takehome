*** Settings ***
Documentation     A test suite with tests for logging into and out of a dummy reddit account.
...
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input User      ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
Valid DropDown
    Click UserDropDown
    DropDownMenu Should Be Visible
Valid LogOut
    Click LogOut
    Sleep       5
    Username Should Not Be Visible
    [Teardown]    Close Browser


