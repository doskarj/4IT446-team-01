*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_vydra.txt

*** Test Cases ***
TC-04 Prechod na detail produktu pres menu
    Open browser to Zoo eshop
    
    Navigate to souveniers/magnets

    Check for product in list
        
    Click Element    ${vydra_url}
    ${url}=    Get Location
    Should Be Equal    ${url}    ${product_page_vydra}
    
    Check Product Detail Basic Info
    
    Page Should Contain Element    ${vydra_add_to_cart}
    Page Should Contain Element    ${vydra_related}                           
    
    Close Browser   