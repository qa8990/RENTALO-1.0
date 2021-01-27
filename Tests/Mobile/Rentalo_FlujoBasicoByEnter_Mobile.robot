*** Settings ***
Documentation  Suite de pruebas para Rentalo.com.mx
Library           DataDriver    file=RENTALO_MX.xlsx    sheet_name=VALIDOS
# notice we're no longer referencing the Selenium2Library in our script!
Resource  ../../Resources/search_resources_mobile.robot
Resource  ../../Resources/Common_mobile.robot  # necessary for Setup & Teardown
Resource  ../../Resources/PO/LandingPage_Mobile.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

Test Template   Busqueda por Enter


*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://rentalo.com.mx/
${HOMEPAGE_TITLE} =  Rentalo


# Copy/paste the below line to Terminal window to execute
# robot -d results tests/Rentalo.robot

*** Test Cases ***
Buscar - usando   ${machinename}     ${machinelink}
    

*** Keywords ***

Busqueda por Enter
    [Arguments]    ${machinename}    ${machinelink}
    LandingPage_Mobile.Cargar Website Mobile
    LandingPage_Mobile.Verificar Website cargado
    search_resources_mobile.Insertar Nombre de Máquina completo    ${machinename}
    search_resources_mobile.El buscador despliega opciones para autocompletar        ${machinename}     ${machinelink}
    search_resources_mobile.Presionar Enter
