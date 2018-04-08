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
    
   Add product to shopping cart from product list
    Valid success message
    
    Click Button    ${success_msg_continue}
    Wait Until Element Is Not Visible    ${success_msg_containter}   
    
    Add product to shopping cart from product list
    Valid success message
    
    Wait Until Element Is Not Visible    ${success_msg_containter} 

    Add product to shopping cart from product list
    Wait Until Element Is Visible    ${success_msg_containter} 
    
    Step from success message to shopping cart
    Check header menu
    
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='3']
    ${number}=    Convert To Integer    ${product_price}    
    ${total_price}=    Evaluate    ${number}*${3}
    ${total_price_string}=    Convert To String    ${total_price}
    Element Should Contain    //table[@id='shopping-cart-totals-table']//tr[@class='grand-total']//span[@class='price']    ${total_price_string}
    
    Click Link    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//a[@title='Odstranit položku']
    Page Should Contain    V košíku nejsou žádné položky.       
   
    Close Browser
    