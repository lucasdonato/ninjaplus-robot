*** Settings ***
Library     RequestsLibrary
Library     Collections

# Desafios:
# 1) Resolver a questao da massa de testes com o pyscopg2
# 2) Automtizar o cenario de consulta de usuario

*** Test Cases ***
Create a new user
    create session      nplus               http://ninjaplus-api:3000
    &{body}=            create dictionary   full_name=Bruce Wayne   email=bruce@wayne.com  password=pwd123
    &{headers}=         create dictionary   Content-Type=application/json

    ${response}=        post request        nplus   /user   data=${body}    headers=${headers}
    ${code}=            convert to string   ${response.status_code}
    should be equal     ${code}             200