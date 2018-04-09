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
    
    Element Text Should Be    ${vydra_title}    ${productName}
    Page Should Contain Element    ${vydra_img}    
    Page Should Contain Element    ${vydra_availabitily}
    Element Should Contain    ${vydra_price}    ${productPrice}
    
    Page Should Contain Element    ${vydra_qty}
    Page Should Contain Button    ${vydra_add_to_cart} 
    Page Should Contain Element    ${vydra_add_to_cart}
    Page Should Contain Element    ${vydra_related}                           
    
    Close Browser   