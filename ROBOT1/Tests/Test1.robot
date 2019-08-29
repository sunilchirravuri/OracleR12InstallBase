*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
login Oracle
    [Documentation]  login
    [Tags]  login
    open browser  https://sit12.diebold.com/OA_HTML/AppsLogin  ff
    sleep  3s
    input text  id=userid  ATSCMDNA
    input password  name=password  Oracle_12
    click element  name=submit
    sleep  5s
    close browser
#Logout Oracle
#    [Documentation]  Logout
#    [Tags]  logout
#    click link  linktext=Logout  modifier=False

*** Keywords ***