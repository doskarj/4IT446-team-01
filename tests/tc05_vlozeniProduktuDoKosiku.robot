*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt

*** Test Cases ***
TC-05 Vložení produku do košíku z detailu produktu
    Open browser to Zoo eshop
    
    Navigate to souveniers/magnets
    
    Check for product in list
    
    Click Element    ${vydra_url}

    ${url}=    Get Location
    Should Be Equal    ${url}    ${product_page_vydra}
    Check Product Detail Basic Info
    
    Click Button    ${vydra_add_to_cart}
    Valid success message
    
    Click Button    ${success_msg_continue}
    Wait Until Element Is Not Visible    ${success_msg_containter}   
    
    Click Element    ${vydra_add_to_cart}
    Valid success message
    
    Wait Until Element Is Not Visible    ${success_msg_containter} 

    Click Element    ${vydra_add_to_cart}
    Wait Until Element Is Visible    ${success_msg_containter} 
    
    Step from success message to shopping cart
    Check header menu
    
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_detail}']
    Check Price    ${shop_cart_total_price}    ${product_quantity_from_detail}    ${product_price}
    
    Remove From Cart And Close Browser
    