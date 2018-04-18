*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt
Resource    ../objects/objects_shop_process.txt



*** Test Cases ***
TC-08 Vyplneni kroku moznosti nakupu
    #1 Otevreni stranky e-shopu
    Open Browser To Zoo Eshop
    
    #2 Vypis magnetek
    Navigate To Souveniers/magnets
    
    #3 Kontrola vyskytu testovaciho produktu
    Check For Product In List
    
    #4 Vlozeni do kosiku
    Add Product To Shopping Cart From Product List
    Valid Success Message
    
    #5 Prechod a nasledna kontrola kosiku
    Step From Success Message To Shopping Cart
    Check Header Menu
    Shopping Cart Basic Check
    
    #6 Prechod na proces nakupu
    Click button     ${shop_cart_checkout}
    Check Header Menu
    Check URL    ${shop_process_url}
        
    #7 Kontrola kroku procesu nakupu
    Page Should Contain Element    ${step_one_title}  
    Page Should Contain Element    ${step_two_title}    
    Page Should Contain Element    ${step_three_title}
    Page Should Contain Element    ${step_four_title} 
    Page Should Contain Element    ${step_five_title}  
    Page Should Contain Element    ${step_six_title}  

    #8 Kontrola kroku Moznosti nakupu
    Page Should Contain Element    ${step_one_active}
    Page Should Contain Element    ${step_one_quest}
    Page Should Contain Element    ${step_one_register}        
    
    #9 Zkouska pruchodu krokem bez vyplneni
    Click button    ${step_one_continue}
    Check Alert Message    ${shop_process_one_alert}    
    Page Should Contain Element    ${step_one_active}
    
    #10 Prechod do druheho kruku
    Click Element    ${step_one_quest}
    Click button    ${step_one_continue}
    Wait Until Page Contains Element    ${step_two_active}    
    
TC-09 Vyplneni kroku kontaktni udaje 
    #1 Uzivatel se vyskytuje v kroku Kontaktni udaje 
    Page Should Contain Element    ${step_two_active}    
    
    #2 Kontrola zadanych poli
    Check Fields For Contact Details
    Radio Button Should Be Set To    ${shop_process_two_radio_name}    ${shop_process_two_radio_value}
    Wait Until Element Is Visible    ${step_two_continue}
    Invalid Continue Step Two Check   
    
    #3 Vyplneni jmena a prijmeni
    Input Text    ${step_two_first_name}    ${first_name}   
    Input Text    ${step_two_last_name}    ${last_name}  
    Wait Until Element Is Visible    ${step_two_continue}       
    Invalid Continue Step Two Check 
    
    #4 Vyplneni nevalidniho e-mailu
    Input Text    ${step_two_email}    ${email_invalid_1}      
    Invalid Continue Step Two Check With Advice 
    
    #5 Vyplneni nevalidniho e-mailu
    Input Text    ${step_two_email}    ${email_invalid_2}  
    Invalid Continue Step Two Check With Advice 
     
    #6 Vyplneni validniho e-mailu
    Input Text    ${step_two_email}    ${email}  
    Invalid Continue Step Two Check
    
    #7 Vyplneni zbylych poli a prechod na dalsi krok
    Input Text    ${step_two_street1}    ${street}         
    Input Text    ${step_two_city}    ${city}              
    Input Text    ${step_two_telephone}    ${telephone}    
    Click Button    ${step_two_continue}                   
    Wait Until Element Is Visible    ${step_four_active}  


TC-10 Vyplneni kroku Zpusobu dodani a platby - posta
    #1 Kontrola ze se nachazime na korku Zpusom dodani
    Page Should Contain Element    ${step_four_active}
    Wait Until Element Is Visible    ${step_four_content} 
    Page Should Contain Element    ${step_four_title}            
    
    #2 Kontrola zpusobu platby
    Page Should Contain Element    ${step_four_freeshipping}    ${step_shipping_flatrate_price}
    Page Should Contain Element    ${step_four_flatrate}    ${step_shipping_free_price}
    
    #3 Kontrola nemoznosti pruchodu krokem bez vyplneni
    Click Button    ${step_four_continue}        
    Check Alert Message    ${shop_process_four_alert}       
    Page Should Contain Element    ${step_four_content}
    
    #4 Volba Ceske posty a nasledny prechod na dalsi krok
    Wait Until Element Is Visible    ${step_four_flatrate}   
    Execute Javascript    document.getElementById('s_method_flatrate_flatrate').click()     
    #Click Element    ${step_four_flatrate}    
    Click Button    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_active}       
               
    #5 Kontrola kroku Zpusob dodani A Zpusob plaby
    Wait Until Element Is Visible    ${step_five_standard}
    Wait Until Element Is Visible    ${step_five_cash_on_delivery}    
    
    #6 Kontrola nemoznosti pruchodu krokem bez vyplneni
    Page Should Contain Element    ${step_five_continue}
    CLick Button    ${step_five_continue}
    Check Alert Message    ${shop_process_five_alert}
    Page Should Contain Element    ${step_five_active}        
    
    #7 Volba Plaby kartou
    Execute Javascript    document.getElementById('p_method_gpwebpay_standard').click()
    #Click Element    ${step_five_standard}
    Page Should Contain Element    ${step_five_standard_message}    
    Page Should Contain Element    ${step_five_content}    
    
    #8 Volba dobirky
    Click Element    ${step_five_cash_on_delivery}
    Page Should Contain Element    ${step_five_cash_on_delivery_message}    
    Page Should Contain Element    ${step_five_content}  
    
    #9 Prechod na krok souhrnu objednavky
    Click Button    ${step_five_continue}
    Wait Until Element Is Visible    ${step_six_active}    
    Page Should Contain Element    ${step_six_content}
    Page Should Contain Element    ${step_six_title}         
    
    #10 Kontrola celkove ceny
    Step Six Basic Check    ${product_name}    ${product_price}    ${step_six_product_price_with_fee}
    Page Should Contain    ${step_six_shipping_method_with_fee}
    Page Should Contain    ${step_shipping_flatrate_price} 
       
TC-11 Vyplneni kroku Zpusob dodani a nasledny zpusob platby - osobni odber
    Execute Javascript    document.getElementById('opc-shipping_method').getElementsByTagName('h2')[0].click()
    #Click Element    ${step_four_title}
    #1 Kontrola ze aktualni krok je krok Zpusob dodani
    Wait Until Page Contains Element    ${step_four_active}
    Wait Until Element Is Visible    ${step_four_content}
    Page Should Contain Element    ${step_four_title}
    
    #2 Kontrola moznosti zpusobu dodani
    Page Should Contain Element    ${step_four_flatrate}    ${step_shipping_flatrate_price}
    Page Should Contain Element    ${step_four_freeshipping}    ${step_shipping_free_price}
    
    #3 Volba osobniho osdberu a prechod na dalsi krok
    Click Element    ${step_four_freeshipping}
    Click Element    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_active}
 
    #4 Kontrola moznosti platby
    Wait Until Page Contains Element    ${step_five_standard}
    Wait Until Page Contains Element    ${step_five_cash}
    
    #5 Kontrola nemoznosti prechodu bez volby platby
    Click Element    ${step_five_continue}
    Check Alert Message    ${shop_process_five_alert}
    Page Should Contain Element    ${step_five_active}

    #6 Kontrola hlasky pod platbou kartou
    Click Element    ${step_five_standard}
    Page Should Contain Element    ${step_five_standard_message}    
    Page Should Contain Element    ${step_five_content}
    Page Should Contain Element    ${step_five_active}
    
    #7 Volba platby na miste a pokracovani na dalsi krok
    Click Element    ${step_five_cash_on_delivery_free}
    Click Element    ${step_five_continue}
    Wait Until Element Is Visible    ${step_six_active}
    
    #8 Kontrola souhrnu objednavky
    Wait Until Element Is Visible    ${step_six_content}    
    Step Six Basic Check    ${product_name}    ${product_price}    ${product_price}
    Page Should Contain Element    ${step_six_delivery}    ${step_shipping_free_price}


    
    #Wait Until Page Contains Element    ${step_six_product_u}
    #Page Should Contain Element    ${step_six_product_u}    ${product_name}
    #Page Should Contain Element    ${step_six_product_u}    ${product_price}
    #Wait Until Page Contains Element    ${step_six_delivery_u}
    #Page Should Contain Element    ${step_six_delivery_u}    ${step_six_delivery_u_price}
    #Wait Until Page Contains Element    ${step_six_altogether_u}
    #Page Should Contain Element    ${step_six_altogether_u}    ${step_six_altogether_u_price}
    
TC-12 Prechod mezi kroky objednavky
    #1 Kontrola aktivniho kroku Souhrn Objednavky
    Page Should Contain Element    ${step_six_active}    
    Page Should Contain Element    ${step_six_content}  
    
    #2 Prechod na krok Kontaktni udaje
    Click Element    ${to_step_two}
    Wait Until Element Is Visible    ${step_two_active}
    
    #3 Zmena jmena a nasledny prechod na dalsi krok
    Clear Element Text    ${step_two_first_name}
    Input Text    ${step_two_first_name}    ${new_first_name}
    Click element    ${step_two_continue}
    Wait Until Element Is Visible    ${step_four_active}
    Wait Until Element Is Visible    ${changed_first_name}    
    
    #4 Prechod na krok kontaktni udaje z Zpusob dodani
    Click Element    ${to_step_two}
    Wait Until Element Is Visible    ${step_two_active}
    
    #5 Prechod na krok Zpusob dodani
    Click element    ${step_two_continue}
    Wait Until Element Is Visible    ${step_four_active}  
    
    #6 Prechod na krok pro volbu plaby
    Click Element    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_active}
    
    #7 Prechod na krok Zpusob dodani
    Click Element    ${to_step_four}
    Wait Until Element Is Visible    ${step_four_active}
    
    #8 Prechod na krok pro volbu platby
    Click Element    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_active}
    
    #9 Prechod na krok Souhrn objednavky a kontrola stavu
    Click Element    ${step_five_continue}
    Wait Until Element Is Visible    ${step_six_active}
    Step Six Basic Check    ${product_name}    ${product_price}    ${product_price}
    Page Should Contain    ${step_six_shipping_method_free}
    Page Should Contain Element    ${step_six_submit}   
    
    #10 Prechod do kosiku
    Click Element    ${step_six_forgot_item}
    Check URL    ${shopping_cart_url}
    
    #11 Vymazani obsahu kosiku
    Remove From Cart And Close Browser 
          