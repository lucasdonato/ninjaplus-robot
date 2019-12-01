*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     ../../resources/lib/db.py

# Desafios:
# 2) Automtizar o cenario de consulta de usuario

*** Variables ***
# DataTest
${Email}        bruce@wayne.com
${Full_name}    Bruce Wayne
${Password}     pwd123

*** Test Cases ***
Create a new user
    Remove User By Email                    ${Email}
    create session      nplus               http://ninjaplus-api:3000
    &{body}=            create dictionary   full_name=${Full_name}   email=${Email}  password=${Password}
    &{headers}=         create dictionary   Content-Type=application/json       

    ${response}=        post request        nplus   /user   data=${body}    headers=${headers}
    ${code}=            convert to string   ${response.status_code}
    should be equal     ${code}             200

#Get a user
#    create session      nplus               http://ninjaplus-api:3000
#    &{headers}=         create dictionary   Content-Type=application/json Authorization= JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6OCwiZXhwaXJlIjoiMjAxOS0xMi0wMVQyMjoxNjozMy42MTcrMDA6MDAifQ.397wTrZEZ-h2TKHr_SlnVNbdG3FCjoRzmxsFKcIkEiQ

#    ${response}=        get request         nplus   /user/6     headers=${headers}
 #   ${code}=            convert to string   ${response.status_code}
 #   should be equal     ${code}             201