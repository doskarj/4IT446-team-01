*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt

*** Test Cases ***
TC-08 Vyplneni kroku moznosti nakupu
    Open browser to Zoo eshop
    Navigate to souveniers/magnets
    
    Check for product in list
    Add product to shopping cart from product list
    
    #1
    Open Browser To Zoo Eshop
    
    #2
    Navigate To Souveniers/magnets
    
    #3
    Check For Product In List
    
    #4
    Add Product To Shopping Cart From Product List
    Valid Success Message
    
    #5
    Click button    ${success_msg_checkout}
    Check Header Menu
    
    #6
    Click button     ${shop_cart_checkout}
    Check Header Menu
    
    
    #7
    
    
    #8
    
    
    #9
    
    
    #10
    
    
    #11
