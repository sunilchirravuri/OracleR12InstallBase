*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/GlobalVariables.robot
Test Setup  Oracle Login  ${USERNAME}  ${PASSWORD}
Test Teardown  Oracle Logout

*** Test Cases ***
IB001
    [Documentation]  IB001 - DMT - Search Instance - Simple Search and Advanced Search
    [Tags]  IB
    log  Empty1

Feature2 Test
    log  Feature2 test created