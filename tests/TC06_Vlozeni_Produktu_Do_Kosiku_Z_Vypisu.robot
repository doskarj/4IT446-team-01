*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt

Test Teardown    Close Browser
*** Test Cases ***
TC06 - Vlozeni produktu do kosiku z vypisu
    #1
    Open browser to Zoo eshop
    #2
    Navigate to souveniers/magnets
    #3
    Check for product in list
    #4
    Add product to shopping cart from product list
    Valid success message
    #5
    Click Button    ${success_msg_continue}
    Wait Until Element Is Not Visible    ${success_msg_containter}   
    #6
    Check price    ${shop_cart_price_mouseover}    ${product_quantity_from_list}    ${product_price}
    #7
    Mouse Over	${shop_cart_mouseover}
    Click Element     ${shop_cart_to_cart}
    Check header menu
    #8
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_list}']
    Check Price    ${shop_cart_total_price}    ${product_quantity_from_list}    ${product_price}
    #9
    Remove From Cart And Close Browser
