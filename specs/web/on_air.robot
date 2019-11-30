*** Settings ***
Documentation   Verifica se o APP está online
Resource        ../../resources/web/steps/base.robot


Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
App is on the Air
    App deve estar no ar
