*** Settings ***
Resource  ../Resources/Common.robot
Library  DataDriver  file=C:\Users\chirras\PycharmProjects\OracleR12InstallBase\Resources\Input.xlsx  sheet_name=IB001
Resource  ../Resources/TestVariables.robot
Test Template  IB001

#Jenkins Run : robot -d OracleR12InstallBase/results OracleR12InstallBase/unittests/IB001.robot
*** Test Cases ***
IB001
    [Documentation]  IB001 - DMT - Search Instance - Simple Search and Advanced Search
    [Tags]  IB
    Common.Oracle Login  ${USERNAME}  ${PASSWORD}

    Common.Oracle Logout
