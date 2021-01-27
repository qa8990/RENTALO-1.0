*** Settings ***
Library           DataDriver
# notice we're no longer referencing the Selenium2Library in our script!
#Resource  ../Resources/search_resources.robot
#Resource  ../Resources/PO/LandingPage.robot
#Resource  ../Resources/PO/TopNav.robot
#Resource  ../Resources/PO/SearchResults.robot
#Resource  ../Resources/PO/Product.robot
#Resource  ../Resources/PO/Cart.robot
#Resource  ../Resources/PO/SignIn.robot

Resource    ../Resources/Common.robot  # necessary for Setup & Teardown
Resource    ../Resources/PO/LandingPage.robot
Resource    ../Resources/search_resources.robot


*** Keywords ***
Buscar Maquinaria
    [Arguments]   ${searchKey}     ${searchKey2}       ${link}      ${itemInfo}    ${itemInfo2}    ${scenario}
    Run Keyword If      '${scenario}'=='BASICO1'
    ...     Run Keywords        
    ...         Buscar Maquinaria Seleccionado de la Lista Desplegable  ${searchKey}     ${link}     ${itemInfo}    
    ...         AND   RentaloApp.Buscar Maquinaria usando ENTER  ${searchKey}     ${link}     ${itemInfo}
    #...         AND   RentaloApp.Buscar Maquinaria usando SEARCH Button  ${searchKey}     ${link}     ${itemInfo}
    #[Arguments]   ${searchKey}     ${link}      ${itemInfo}     ${scenario}
    Run Keyword If      '${scenario}'=='BASICO2'
    ...     Run Keyword    Seleccionar Categoria   ${searchKey}     ${link}     ${itemInfo}   
    Run Keyword If      '${scenario}'=='BASICO3'
    ...     Run Keyword    Buscar Maquinaria en el Catalogo   ${searchKey}    ${searchKey2}    ${link}       ${itemInfo}    ${itemInfo2}  
    Run Keyword If      '${scenario}'=='BASICO4'
    ...     Run Keyword    Buscar Maquinaria dentro de una Categoria   ${searchKey}    ${searchKey2}    ${link}       ${itemInfo}     ${itemInfo2}  
    Run Keyword If      '${scenario}'=='ALTERNATIVO1'
    ...     Run Keyword    Buscar Maquinaria Seleccionado de la Lista Desplegable con datos No Validos       ${searchKey}     ${link}     ${itemInfo}
    Run Keyword If      '${scenario}'=='ALTERNATIVO2'
    ...     Run Keyword    Buscar Maquinaria en el Catalogo con datos No Validos       ${searchKey}    ${searchKey2}    ${link}       ${itemInfo}      ${itemInfo2}  


# Escenarios de Pruebas Positivos con datos validos
Buscar Maquinaria Seleccionado de la Lista Desplegable
    [Arguments]     ${searchKey}     ${link}       ${itemInfo} 
    LandingPage.Cargar Website 
    LandingPage.Verificar Website cargado
    search_resources.Insertar Valor de Busqueda   ${searchKey}
    search_resources.El buscador despliega opciones para autocompletar      ${searchKey}     ${link}
    search_resources.Seleccionar opción del nombre desplegado  ${link}
    search_resources.Retorna Informacion del producto      ${itemInfo}


Buscar Maquinaria usando ENTER
    [Arguments]     ${searchKey}     ${link}         ${itemInfo}     
    LandingPage.Cargar Website 
    LandingPage.Verificar Website cargado
    search_resources.Insertar Valor de Busqueda   ${searchKey}
    search_resources.El buscador despliega opciones para autocompletar      ${searchKey}     ${link}
    search_resources.Presionar Enter
    #search_resources.Seleccionar opción del nombre desplegado  ${machinelink}
    search_resources.Retorna Informacion del producto      ${itemInfo}


Buscar Maquinaria usando SEARCH Button
    [Arguments]     ${searchKey}     ${link}         ${itemInfo}     
    LandingPage.Cargar Website 
    LandingPage.Verificar Website cargado
    search_resources.Insertar Valor de Busqueda   ${searchKey}
    search_resources.El buscador despliega opciones para autocompletar      ${searchKey}     ${link}
    search_resources.Presionar Boton de Busqueda
    #search_resources.Seleccionar opción del nombre desplegado  ${machinelink}
    search_resources.Retorna Informacion del producto      ${itemInfo}


Seleccionar Categoria
    [Arguments]     ${searchKey}     ${link}         ${itemInfo} 
    LandingPage.Cargar Website 
    LandingPage.Verificar Website cargado
    search_resources.Buscar Seccion Categorias      ${link}


Buscar Maquinaria en el Catalogo
    [Arguments]     ${searchKey}    ${searchKey2}    ${link}       ${itemInfo}      ${itemInfo2}
    LandingPage.Cargar Website 
    LandingPage.Verificar Website cargado
    search_resources.Insertar Valor de Busqueda   ${searchKey}
    search_resources.Presionar Enter
    search_resources.Retorna Catalogo de productos
    search_resources.Insertar Valor de Busqueda  ${searchKey2}
    search_resources.Retorna Informacion del producto  ${itemInfo2}


# Escenarios con datos no validos
Buscar Maquinaria Seleccionado de la Lista Desplegable con datos No Validos
    [Arguments]     ${searchKey}     ${link}       ${itemInfo} 
    LandingPage.Cargar Website 
    LandingPage.Verificar Website cargado
    search_resources.Insertar Valor de Busqueda   ${searchKey}
    search_resources.El buscador no muestra resultados

Buscar Maquinaria en el Catalogo con datos No Validos
    [Arguments]     ${searchKey}    ${searchKey2}    ${link}       ${itemInfo}      ${itemInfo2}
    LandingPage.Cargar Website 
    LandingPage.Verificar Website cargado
    search_resources.Insertar Valor de Busqueda   ${searchKey}
    search_resources.Presionar Enter
    search_resources.Retorna Catalogo de productos
    search_resources.Insertar Valor de Busqueda  ${searchKey2}
    search_resources.Retorna Busqueda en Catalogo de productos vacio

Buscar Maquinaria dentro de una Categoria
    [Arguments]     ${searchKey}    ${searchKey2}    ${link}       ${itemInfo}      ${itemInfo2}  
    LandingPage.Cargar Website 
    LandingPage.Verificar Website cargado
    search_resources.Buscar Seccion Categorias      ${link}
    search_resources.Retorna productos de la Categoria      ${searchKey}
    search_resources.Insertar Valor de Busqueda  ${searchKey2}
    search_resources.Retorna Informacion del producto  ${itemInfo2}


# Manejo de escenarios para creacion de cuentas de usuario
Crear Cuenta de Usuario
    [Arguments]   ${searchKey}     ${searchKey2}       ${link}      ${itemInfo}    ${itemInfo2}    ${scenario}
    Run Keyword If      '${scenario}'=='BASICO1'
    ...     Run Keywords        
    ...         Buscar Maquinaria Seleccionado de la Lista Desplegable  ${searchKey}     ${link}     ${itemInfo}    
    ...         AND   RentaloApp.Buscar Maquinaria usando ENTER  ${searchKey}     ${link}     ${itemInfo}
    #...         AND   RentaloApp.Buscar Maquinaria usando SEARCH Button  ${searchKey}     ${link}     ${itemInfo}
    #[Arguments]   ${searchKey}     ${link}      ${itemInfo}     ${scenario}
    Run Keyword If      '${scenario}'=='BASICO2'
    ...     Run Keyword    Seleccionar Categoria   ${searchKey}     ${link}     ${itemInfo}   
    Run Keyword If      '${scenario}'=='BASICO3'
    ...     Run Keyword    Buscar Maquinaria en el Catalogo   ${searchKey}    ${searchKey2}    ${link}       ${itemInfo}    ${itemInfo2}  
    Run Keyword If      '${scenario}'=='BASICO4'
    ...     Run Keyword    Buscar Maquinaria dentro de una Categoria   ${searchKey}    ${searchKey2}    ${link}       ${itemInfo}     ${itemInfo2}  
    Run Keyword If      '${scenario}'=='ALTERNATIVO1'
    ...     Run Keyword    Buscar Maquinaria Seleccionado de la Lista Desplegable con datos No Validos       ${searchKey}     ${link}     ${itemInfo}
    Run Keyword If      '${scenario}'=='ALTERNATIVO2'
    ...     Run Keyword    Buscar Maquinaria en el Catalogo con datos No Validos       ${searchKey}    ${searchKey2}    ${link}       ${itemInfo}      ${itemInfo2}  