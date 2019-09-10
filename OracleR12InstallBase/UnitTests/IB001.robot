*** Settings ***
#Library  DataDriver  file=../data/Input.xlsx  sheet_name=IB001
Resource  ../Resources/TestVariables.robot
Resource  ../Resources/Common.robot

#Jenkins Run : robot -d OracleR12InstallBase/results OracleR12InstallBase/unittests/IB001.robot
*** Test Cases ***
DMT Search Instance Simple Search and Advanced Search
    [Template]  IB001
    ${USERNAME}
    ${PASSWORD}
    ${RESPONSIBILITY}
    ${NAVIGATION}
    ${INSTANCE_NUMBER}

*** Keywords ***
IB001
    [arguments]  ${USERNAME}  ${PASSWORD}  ${RESPONSIBILITY}  ${NAVIGATION}  ${INSTANCE_NUMBER}
    [Documentation]  IB001 - DMT - Search Instance - Simple Search and Advanced Search
    Common.Oracle Login  ${USERNAME}  ${PASSWORD}  ${RESPONSIBILITY}  ${NAVIGATION}

    Common.Oracle Logout
