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
    Step From Success Message To Shopping Cart
    Check Header Menu
    Shopping Cart Basic Check
    
    #6
    Click button     ${shop_cart_checkout}
    Check Header Menu
    ${url}=    Get Location
    Should Be Equal    ${url}    ${shop_process_url}
    
    
    #7
    Page Should Contain Element    ${step_one_title}
    Page Should Contain Element    ${step_one_title}   
    Page Should Contain Element    ${step_two_title}    
    Page Should Contain Element    ${step_three_title}
    Page Should Contain Element    ${step_four_title} 
    Page Should Contain Element    ${step_five_title}  
    Page Should Contain Element    ${step_six_title}  

    #8
    Page Should Contain Element    ${step_one_active}
    Page Should Contain Element    ${step_one_quest}
    Page Should Contain Element    ${step_one_register}        
    
    #9
    Click button    ${step_one_continue}
    ${alert_message}=    Handle Alert 
    Should Be Equal    ${shop_process_one_alert}    ${alert_message}       
    Page Should Contain Element    ${step_one_active}
    
    #10
    Click Element    ${step_one_quest}
    Click button    ${step_one_continue}
    Wait Until Page Contains Element    ${step_two_active}    
    
