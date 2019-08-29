*** Settings ***
Resource  KeywordExistDemo.robot
*** Variables ***
${Values}

*** Test Cases ***
join strings  comment  joins two strings
    [Tags]  join
    ${name1} =  set variable  Sunil
    ${name2} =  set variable  Chirravuri
    ${name3} =  catenate  seperator=" "  ${name1}  ${name2}
    log  ${name3}

Loop Demo  comment  Explains loop various conditions
    [Tags]  loop
    :FOR    ${INDEX}  IN RANGE  1  6
    \   run keyword if  ${INDEX}==3  Continue For Loop
    \   log  Do Something

CreateDict
    [Tags]  Dict
    &{MyDict} =  create dictionary  name1=Sunil  name2=Chirravuri  FullName="Sunil Chirravuri"
    :FOR  ${Values}  IN  &{MyDict}
    \   log  ${Values}

EvaluateDemo
    [Tags]  ifDemo
    ${Name} =  set variable  Sunil Chirravuri
    ${age} =  set variable  30
    ${Result1} =  evaluate  10<${age}<40
    ${Result2} =  evaluate  ${age} + 10
    #string Evaluation
    should be equal as strings  ${Name}  Sunil chirravuri  msg="Evaluation Failed"  ignore_case=true
    log  ${Result1}
    log  ${Result2}

TimeDemo
    [Tags]  time
    ${time} =  Get Time 
    ${year} =  Get Time  year
    ${month} =  Get Time  month
    ${day} =  Get Time  day
    log  ${day}

KeywordExistsDemo
    [Tags]  keywordExists
    keyword should exist  KeywordExistDemo.Enter Log  message="FAILED: Keyword does not exist"

ViewLogOnConsole
    [Tags]  LogConsole
    Log To Console  ""
    Log To Console	Hello, console!	
    Log To Console	Hello, stderr!	STDERR
    Log To Console	Message starts here and is	no_newline=true
    Log To Console	continued without newline.	
