*** Settings ***
Library  OperatingSystem
Library  SeleniumLibrary
Library  String
Resource  ../Resources/TestVariables.robot
Documentation  This Test is used for Common Repeatitive actions.

*** Variables ***
${userid} =  id=userid
${passwordLocator} =  name=password
${submit} =  name=submit
${responsibility_link} =  xpath=//a[text()='${RESPONSIBILITY}']
${logout} =  xpath=//a[text()='Logout']
${logout_message} =  xpath=//span[text()=' You have been logged out! ']
${NavigationArray}
${NavigationArray_last_link}

*** Keywords ***
Oracle Login
    [Arguments]  ${USERNAME}  ${PASSWORD}  ${RESPONSIBILITY}  ${NAVIGATION}
    Open Firefox with URL
    Enter Credentials and Submit
    Oracle Navigate  ${RESPONSIBILITY}  ${NAVIGATION}

Oracle Logout
    Click Logout Link
    Wait for successful logout message and close browser

Oracle Navigate
    [Arguments]  ${RESPONSIBILITY}  ${NAVIGATION}
    Click Responsibility  ${RESPONSIBILITY}
    Navigate To  ${NAVIGATION}

Click Responsibility
    [Arguments]  ${RESPONSIBILITY}
    wait for responsibility link
    Click Link  xpath=//a[text()='${RESPONSIBILITY}']

Navigate To
    [Arguments]  ${Navigation}
    @{NavigationArray} =  Split String  ${NAVIGATION}  :
    :FOR  ${NavigationLink}  IN  @{NavigationArray}
    \  wait until element is visible  xpath=//a[text()='${NavigationLink}']  30s  "FAILED: Navigation NOT found"
    \  log  Navigating to ${NavigationLink}
    \  Click Link  xpath=//a[text()='${NavigationLink}']
    sleep  5s
    log  successfully navigated to ${NavigationArray}

Open Firefox with URL
    #set environment variable  webdriver.gecko.driver  c:/bin/geckodriver.exe
    open browser  @{URL_AND_BROWSER}

Enter Credentials and Submit
    wait until page contains element  ${userid}  30s  "FAILED: Unable to load Login page"
    maximize browser window
    input text  ${userid}  ${USERNAME}
    input password  ${passwordLocator}  ${PASSWORD}
    click button  ${submit}

Click Logout Link
    Click Link  ${logout}

Wait for successful logout message and close browser
    Wait Until Element Is Visible  ${logout_message}  30s  "FAILED: Unable to Logout"
    close browser

wait for responsibility link
    wait until page contains element  xpath=//a[text()='${RESPONSIBILITY}']  20s  "FAILED: Responsibility NOT found"
