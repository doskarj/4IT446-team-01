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
    
TC-09 Vyplneni kroku kontaktni udaje  
    Wait Until Page Contains Element    ${step_two_active}    
    
    Check Fields For Contact Details
    Radio Button Should Be Set To    ${shop_process_two_radio_name}    ${shop_process_two_radio_value}    
    Invalid Continue Step Two Check   
    
    Input Text    ${step_two_first_name}    ${firstName}   
    Input Text    ${step_two_last_name}    ${lastName}     
    Invalid Continue Step Two Check 
    
    Input Text    ${step_two_email}    ${email_invalid_1}      
    Invalid Continue Step Two Check With Advice 
     
    Input Text    ${step_two_email}    ${email_invalid_2}  
    Invalid Continue Step Two Check With Advice 
     
    Input Text    ${step_two_email}    ${email}  
    Invalid Continue Step Two Check
    
    Input Text    ${step_two_street1}    ${street}         
    Input Text    ${step_two_city}    ${city}              
    Input Text    ${step_two_telephone}    ${telephone}    
    Click Button    ${step_two_continue}                   
    Wait Until Element Is Visible    ${step_four_content}  



TC-10 Vyplneni kroku Zpusobu dodani a platby - posta
    #1
    Wait Until Element Is Visible    ${step_four_content} 
    Page Should Contain Element    ${step_four_title}    
    
    #2
    Page Should Contain Element    ${step_four_freeshipping}        
    Page Should Contain Element    ${step_four_flatrate}
            
    
    #3
    Click Button    ${step_four_continue}        
    ${alert_message}=    Handle Alert 
    Should Be Equal    ${shop_process_four_alert}    ${alert_message}       
    Page Should Contain Element    ${step_four_content}
    
    #4
    Click Element    ${step_four_flatrate}    
    Click Button    ${step_four_continue}
    Page Should Contain Element    ${step_five_content}
    Page Should Contain Element    ${step_five_title}   
               
    #5
    #Page Should Contain Element    ${step_five_standard}
    #Page Should Contain Element    ${step_five_cash_on_delivery}    
    
    #6
    CLick Button    ${step_five_continue}
    ${alert_message}=    Handle Alert    
    Should Be Equal    ${shop_process_five_alert}    ${alert_message}
    Page Should Contain Element    ${step_five_content}        
    
    #7
    Click Element    ${step_five_standard}
    #zkontrolovat hlášku
    Page Should Contain Element    ${step_five_content}    
    
    #8
    Click Element    ${step_five_cash_on_delivery}
    #zkontrolovat hlášku
    Page Should Contain Element    ${step_five_content}  
    
    #9
    Click Button    ${step_five_continue}
    Page Should Contain Element    ${step_six_content}
    Page Should Contain Element    ${step_six_title}
               
    
    #10
    
TC-11 Vyplneni kroku Zpusob dodani a nasledny zpusob platby - osobni odber
    #1
    Wait Until Element Is Visible    ${step_four_content}
    Page Should Contain Element    ${step_four_title}
    #2
    Page Should Contain Element    ${step_four_shipping_flatrate_u}    ${step_four_shipping_flatrate_u_price}
    Page Should Contain Element    ${step_four_shipping_free_u}    ${step_four_shipping_free_u_price}
    #4
    Click Element    ${step_four_shipping_free_u}
    Click Element    ${step_four_continue_u}
    Page Should Contain Element    ${step_five_content}
    Page Should Contain Element    ${step_five_title}
    #5
    Wait Until Page Contains Element    ${step_five_pay_u_card}
    Page Should Contain Element    ${step_five_pay_u_card}
    Wait Until Page Contains Element    ${step_five_pay_u_cashondelivery}
    Page Should Contain Element    ${step_five_pay_u_cashondelivery}
    #6
    Wait Until Page Contains Element    ${step_five_continue_u}
    Page Should Contain Element    ${step_five_continue_u}
    #Click Element    ${step_five_continue_u}
    #7
    Wait Until Page Contains Element    ${step_five_pay_u_card}
    Page Should Contain Element    ${step_five_pay_u_card}
    Click Element    ${step_five_pay_u_card}
    Page Should Contain Element    ${step_five_radiobutton_u}    ${step_five_radiobutton_u_message}
    Page Should Contain Element    ${step_five_content}
    Page Should Contain Element    ${step_five_title}
    #8
    Wait Until Page Contains Element    ${step_five_pay_u_cashondelivery}
    Page Should Contain Element    ${step_five_pay_u_cashondelivery}
    Click Element    ${step_five_pay_u_cashondelivery}
    Wait Until Page Contains Element    ${step_five_continue_u}
    Page Should Contain Element    ${step_five_continue_u}
    Click Element    ${step_five_continue_u}
    Page Should Contain Element    ${step_six_title}
    Page Should Contain Element    ${step_six_content}
    #9
    Wait Until Page Contains Element    ${step_six_product_u}
    Page Should Contain Element    ${step_six_product_u}    ${product_name}
    Page Should Contain Element    ${step_six_product_u}    ${product_price}
    Wait Until Page Contains Element    ${step_six_delivery_u}
    Page Should Contain Element    ${step_six_delivery_u}    ${step_six_delivery_u_price}
    Wait Until Page Contains Element    ${step_six_altogether_u}
    Page Should Contain Element    ${step_six_altogether_u}    ${step_six_altogether_u_price}
    Page Should Not Contain    ${step_six_no_fee_u}
