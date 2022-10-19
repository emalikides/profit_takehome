*** Settings ***
Documentation     A test suite with tests for signup and logging in.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Signup Page
    [Teardown]    Close Browser