*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_vydra.txt
Resource    ../objects/objects_shop_process.txt

Test Teardown    Close Browser
*** Test Cases ***
TC-01 E2E test -pozitivni test zakladni funkcionality eshopu
    #1 Otevreni stranky e-shopu
    Open browser to Zoo eshop
    
    #2 Vypis senamu produktu
    Navigate to souveniers/magnets    
    
    #3 Zobrazeni detailu produktu
    Wait Until Element Is Visible    ${vydra_url}
    Click Element    ${vydra_url}
    Check Product Detail Basic Info
    Page Should Contain Element    ${vydra_add_to_cart}    
    
    #4 Pridani produktu do kosiku
    Click Element    ${vydra_add_to_cart}
    Valid success message
    
    #5 Prechod do kosiku
    Step from success message to shopping cart
    Check header menu
    
    #6 Kontrola obsahu kosiku
    Shopping Cart Basic Check
    
    #7 Krok Moznosti nakupu
    Click Button    ${shop_cart_checkout}
    Element Should Be Visible    ${step_one_content}
    Page Should Contain Element    ${step_one_quest}
    Check header menu
   
    #8 Volba nakupu bez registrace
    Click Element    ${step_one_quest}
    
    #9 Kontrola kroku Kontaktni udaje
    Click Button    ${step_one_continue}
    Element Should Be Visible    ${step_two_content}
    #Radio Button Should Be Set To    group_name    value
    Element Should Contain    ${step_two_radio_btn}   ${step_two_radio_lb}    
    Element Should Contain    ${step_two_first_name_lb}    ${step_two_fn_lb}    
    Element Should Contain    ${step_two_last_name_lb}    ${step_two_ln_lb}    
    Element Should Contain    ${step_two_email_lb}    ${step_two_mail_lb}    
    Element Should Contain    ${step_two_street1_lb}    ${step_two_addr_lb}    
    Element Should Contain    ${step_two_city_lb}    ${step_two_ct_lb}    
    Element Should Contain    ${step_two_country_id_lb}    ${step_two_cnr_lb}    
    Element Should Contain    ${step_two_telephone_lb}    ${step_two_phon_lb}
    
    #10 Vyplneni kontaktnich udaju
    Input Text    ${step_two_first_name}    ${firstName}
    Input Text    ${step_two_last_name}    ${lastName}    
    Input Text    ${step_two_email}    ${email}
    Input Text    ${step_two_street1}    ${street}
    Input Text    ${step_two_city}    ${city}
    Input Text    ${step_two_telephone}    ${telephone}
    Click Button    ${step_two_continue}
    Wait Until Element Is Visible    ${step_four_content}    
    
    #11 Vyber zpusobu dodani
    Wait Until Element Is Visible    ${step_four_freeshipping}  
    Execute Javascript    document.getElementById(${step_four_freeshipping_js}).click()  
    #Click Element    ${step_four_freeshipping}
    Click Button    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_content}    

    #12 Vyber zpusobu plaby
    Click Element    ${step_five_cash}
    Click Button    ${step_five_continue}
    Wait Until Element Is Visible    ${step_six_content}     
    
    #13 Kontrola shrnuti objednavky
    Step Six Basic Check    ${product_name}    ${product_price}    ${product_price}
    Page Should Contain    ${step_six_shipping_method_free}
            
    
    #Close Browser
    
    
    
    
        
        
    
        
       