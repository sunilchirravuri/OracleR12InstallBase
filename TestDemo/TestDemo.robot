*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${Navigation} =  Instance:Instances
${NavigationLinks}
*** Test Cases ***
Get Strings
    ${NavigationLinks} =  Split String  ${Navigation}  :
    :For  ${NavigationLink}    IN    ${NavigationLinks}
    \    Log  ${NavigationLink}