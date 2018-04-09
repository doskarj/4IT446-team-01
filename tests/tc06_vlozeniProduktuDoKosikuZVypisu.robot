*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt

*** Test Cases ***
TC06 - Vlozeni produktu do kosiku z vypisu
    Open browser to Zoo eshop
    Navigate to souveniers/magnets
    
    Check for product in list
    Add product to shopping cart from product list
    Valid success message
    Click Button    ${success_msg_continue}
    Wait Until Element Is Not Visible    ${success_msg_containter}   
    
    Check price    ${shop_cart_price_mouseover}    ${product_quantity_from_list}
    
    Mouse Over	${shop_cart_mouseover}
    Click Element     ${shop_cart_to_cart}
    Check header menu
    
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_list}']
    Check Price    ${shop_cart_total_price}    ${product_quantity_from_list}
    
    Remove From Cart And Close Browser
