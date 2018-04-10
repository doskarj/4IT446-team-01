*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt
Resource    ../objects/objects_shop_process.txt

*** Test Cases ***
TC-08 Vyplneni kroku moznosti nakupu
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
    Page Should Contain Element    ${shop_cart_qty_1}
    Element Should Contain    ${shop_cart_total_price}    ${product_price}
    
    #6
    Click button     ${shop_cart_checkout}
    Check Header Menu
  
    
    
    #7
    Page Should Contain Element    ${step_one_title}   
    Page Should Contain Element    ${step_two_title}    
    Page Should Contain Element    ${step_three_title}
    Page Should Contain Element    ${step_four_title} 
    Page Should Contain Element    ${step_five_title}  
    Page Should Contain Element    ${step_six_title}  

    #8
    
    
    #9
    Click button    ${step_one_continue}
    
    #10
    
    Click button    ${step_one_continue}
    
