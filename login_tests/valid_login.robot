*** Settings ***
Documentation     A test suite with tests for logging into a dummy reddit.
...
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input User      ${VALID USER}
    Input Password      ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
