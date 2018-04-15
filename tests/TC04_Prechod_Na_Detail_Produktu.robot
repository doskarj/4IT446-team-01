*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_vydra.txt
Test Teardown    Close Browser

*** Test Cases ***
TC-04 Prechod na detail produktu pres menu
    #1 Otevreni stranky e-shopu
    Open browser to Zoo eshop
    
    #2 Prechod na vypis s magnetkami
    Navigate to souveniers/magnets
    
    #3 Kontola vyskytu testovaciho produktu
    Check for product in list
    
    #4 Prechod na detail produktu
    Click Element    ${vydra_url}
    Check URL    ${product_page_vydra}
    
    #5 Kontrola detailu produktu
    Check Product Detail Basic Info
    Page Should Contain Element    ${vydra_related} 
    Page Should Contain Element    ${vydra_short_description}                              
    
  