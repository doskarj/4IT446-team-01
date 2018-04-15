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
    Wait Until Element Is Visible    ${step_four_active}  



TC-10 Vyplneni kroku Zpusobu dodani a platby - posta
    #1
    Wait Until Element Is Visible    ${step_four_content} 
    Page Should Contain Element    ${step_four_title} 
    Page Should Contain Element    ${step_four_active}       
    
    #2
    Page Should Contain Element    ${step_four_freeshipping}    ${step_shipping_flatrate_price}
    Page Should Contain Element    ${step_four_flatrate}    ${step_shipping_free_price}
            
    
    #3
    Click Button    ${step_four_continue}        
    ${alert_message}=    Handle Alert 
    Should Be Equal    ${shop_process_four_alert}    ${alert_message}       
    Page Should Contain Element    ${step_four_content}
    
    #4
    Click Element    ${step_four_flatrate}    
    Click Button    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_active}       
               
    #5
    Wait Until Element Is Visible    ${step_five_standard}
    Wait Until Element Is Visible    ${step_five_cash_on_delivery}    
    
    #6
    Wait Until Element Is Visible    ${step_five_continue}
    CLick Button    ${step_five_continue}
    ${alert_message}=    Handle Alert    
    Should Be Equal    ${shop_process_five_alert}    ${alert_message}
    Page Should Contain Element    ${step_five_content}        
    
    #7
    Click Element    ${step_five_standard}
    Page Should Contain Element    ${step_five_standard_message}    
    Page Should Contain Element    ${step_five_content}    
    
    #8
    Click Element    ${step_five_cash_on_delivery}
    Page Should Contain Element    ${step_five_cash_on_delivery_message}    
    Page Should Contain Element    ${step_five_content}  
    
    #9
    Click Button    ${step_five_continue}
    Page Should Contain Element    ${step_six_content}
    Page Should Contain Element    ${step_six_title}
               
    
    #10
    Wait Until Element Is Visible    ${step_six_active}    
    Wait Until Element Is Visible    ${step_six_content} 
    Step Six Basic Check    ${product_name}    ${product_price}    ${step_six_product_price_with_fee}
    Page Should Contain    ${step_six_shipping_method_with_fee}
    Page Should Contain    ${step_shipping_flatrate_price}    
TC-11 Vyplneni kroku Zpusob dodani a nasledny zpusob platby - osobni odber
    Click Element    ${to_step_four}
    #1
    Wait Until Page Contains Element    ${step_four_title}
    Page Should Contain Element    ${step_four_active}
    Click Element    ${step_four_title}
    Wait Until Element Is Visible    ${step_four_content}
    Page Should Contain Element    ${step_four_title}
    
    #2
    Page Should Contain Element    ${step_four_shipping_flatrate_u}    ${step_shipping_flatrate_price}
    Page Should Contain Element    ${step_four_shipping_free_u}    ${step_shipping_free_price}
    
    #4
    Click Element    ${step_four_shipping_free_u}
    Click Element    ${step_four_continue_u}
    Wait Until Element Is Visible    ${step_five_active}
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
    Click Element    ${step_five_continue_u}
    ${alert_message}=    Handle Alert
    Should Be Equal    ${shop_process_five_alert}    ${alert_message}
    Page Should Contain Element    ${step_five_active}

    #7
    Wait Until Page Contains Element    ${step_five_pay_u_card}
    Page Should Contain Element    ${step_five_pay_u_card}
    Click Element    ${step_five_pay_u_card}
    Page Should Contain Element    ${step_five_radiobutton_u}    ${step_five_radiobutton_u_message}
    Page Should Contain Element    ${step_five_active}
    
    #8
    Wait Until Page Contains Element    ${step_five_pay_u_cashondelivery}
    Click Element    ${step_five_pay_u_cashondelivery}
    Wait Until Page Contains Element    ${step_five_continue}
    Page Should Contain Element    ${step_five_continue}
    Click Element    ${step_five_continue}
    Wait Until Element Is Visible    ${step_six_active}
    
    #9
    Wait Until Element Is Visible    ${step_six_content}    
    Step Six Basic Check    ${product_name}    ${product_price}    ${product_price}
    Wait Until Page Contains Element    ${step_six_delivery_u}
    Page Should Contain Element    ${step_six_delivery_u}    ${step_shipping_free_price}


    
    #Wait Until Page Contains Element    ${step_six_product_u}
    #Page Should Contain Element    ${step_six_product_u}    ${product_name}
    #Page Should Contain Element    ${step_six_product_u}    ${product_price}
    #Wait Until Page Contains Element    ${step_six_delivery_u}
    #Page Should Contain Element    ${step_six_delivery_u}    ${step_six_delivery_u_price}
    #Wait Until Page Contains Element    ${step_six_altogether_u}
    #Page Should Contain Element    ${step_six_altogether_u}    ${step_six_altogether_u_price}
    
TC-12 Prechod mezi kroky objednavky
    #1
    Page Should Contain Element    ${step_six_active}    
    Page Should Contain Element    ${step_six_content}  
    
    #2
    Click Element    ${to_step_two}
    Wait Until Element Is Visible    ${step_two_active}
    
    #3
    Clear Element Text    ${step_two_first_name}
    Input Text    ${step_two_first_name}    ${new_first_name}
    Click element    ${step_two_continue}
    Wait Until Element Is Visible    ${step_four_active}
    Wait Until Element Is Visible    ${changed_first_name}    
    
    #4
    Click Element    ${to_step_two}
    Wait Until Element Is Visible    ${step_two_active}
    
    #5
    Click element    ${step_two_continue}
    Wait Until Element Is Visible    ${step_four_active}  
    
    #6
    Click Element    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_active}
    
    #7
    Click Element    ${to_step_four}
    Wait Until Element Is Visible    ${step_four_active}
    
    #8
    Click Element    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_active}
    
    #9
    Click Element    ${step_five_continue}
    Wait Until Element Is Visible    ${step_six_active}
    Step Six Basic Check    ${product_name}    ${product_price}    ${product_price}
    Page Should Contain    ${step_six_shipping_method_free}
    Page Should Contain Element    ${step_six_submit}   
    
    #10
    Click Element    ${step_six_forgot_item}
     ${url}=    Get Location
    Should Be Equal    ${url}    ${shopping_cart_url}
    
    #11
    Remove From Cart And Close Browser 
          