*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     ../../resources/lib/db.py

*** Variables ***
${BASE_URL}         http://ninjaplus-api:3000

*** Keywords ***
Get User
    [Arguments]                         ${user_id}

    ${token}=                           Get Token

    create session                      nplus                   ${BASE_URL}
    &{headers}=                         create dictionary       Content-Type=application/json   Authorization=${token}

    ${response}=                        get request             nplus   /user/${user_id}   headers=${headers}
    log                                 ${response.text}
    [return]                            ${response}

Post User
    [Arguments]                         ${body}
    create session                      nplus                   ${BASE_URL}
    &{headers}=                         create dictionary       Content-Type=application/json

    ${response}=                        post request            nplus   /user   data=${body}    headers=${headers}
    log                                 ${response.text}
    [return]                            ${response}

Post User Return Id
    [Arguments]                         ${body}
    create session                      nplus                   ${BASE_URL}
    &{headers}=                         create dictionary       Content-Type=application/json

    ${response}=                        post request            nplus   /user   data=${body}    headers=${headers}
    log                                 ${response.text}
    ${user_id}                          convert to string       ${response.json()['id']}
    [return]                            ${user_id}

Delete User
    [Arguments]                         ${user_id}

    ${token}=                           Get Token

    create session                      nplus                   ${BASE_URL}
    &{headers}=                         create dictionary       Content-Type=application/json   Authorization=${token}

    ${response}=                        delete request             nplus   /user/${user_id}   headers=${headers}
    log                                 ${response.text}
    [return]                            ${response}

Get Token
    create session                      nplus                   ${BASE_URL}
    &{body}                             create dictionary       email=papito@ninjaplus.com      password=pwd123
    &{headers}=                         create dictionary       Content-Type=application/json

    ${response}=                        post request            nplus   /auth   data=${body}   headers=${headers}
    log                                 ${response.text}
    ${token}                            convert to string       JWT ${response.json()['token']}
    [return]                            ${token}