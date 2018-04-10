*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_vydra.txt
Resource    ../objects/objects_shop_process.txt

*** Test Cases ***
TC-01 E2E test -pozitivni test zakladni funkcionality eshopu
    Open browser to Zoo eshop
    
    Navigate to souveniers/magnets    
    
    #product detail
    Wait Until Element Is Visible    ${vydra_url}
    Click Element    ${vydra_url}
    Check Product Detail Basic Info
    Page Should Contain Element    ${vydra_add_to_cart}    
    
    #success message display
    Click Element    ${vydra_add_to_cart}
    Valid success message
    
    #step to shopping cart
    Step from success message to shopping cart
    Check header menu
    
    
    Element Should Contain    ${shop_cart_title}    ${product_name}
    Element Should Contain    ${shop_cart_price}    ${product_price}
    Page Should Contain Element    ${shop_cart_qty_1}
    Element Should Contain    ${shop_cart_total_price}    ${product_price}
    
    Click Button    ${shop_cart_checkout}
    Element Should Be Visible    ${step_one_content}
    Page Should Contain Element    ${step_one_quest}
    Check header menu
    
    Click Element    ${step_one_quest}
    
    Click Button    ${step_one_continue}
    Element Should Be Visible    ${step_two_content}
    #Radio Button Should Be Set To    group_name    value
    Element Should Contain    ${step_two_radio_btn}   Zaslat Na Tuto Adresu    
    Element Should Contain    ${step_two_first_name_lb}    Jméno    
    Element Should Contain    ${step_two_last_name_lb}    Příjmení    
    Element Should Contain    ${step_two_email_lb}    Emailová Adresa    
    Element Should Contain    ${step_two_street1_lb}    Adresa    
    Element Should Contain    ${step_two_city_lb}    Město    
    Element Should Contain    ${step_two_country_id_lb}    Země    
    Element Should Contain    ${step_two_telephone_lb}    Telefon
    Input Text    ${step_two_first_name}    ${firstName}
    Input Text    ${step_two_last_name}    ${lastName}    
    Input Text    ${step_two_email}    ${email}
    Input Text    ${step_two_street1}    ${street}
    Input Text    ${step_two_city}    ${city}
    Input Text    ${step_two_telephone}    ${telephone}
    Click Button    ${step_two_continue}
    Wait Until Element Is Visible    ${step_four_content}    
    
    Wait Until Element Is Visible    ${step_four_freeshipping}    
    Click Element    ${step_four_freeshipping}
    Click Button    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_content}    

    
    Click Element    ${step_five_cash}
    Click Button    ${step_five_continue}
    Wait Until Element Is Visible    ${step_six_content}     
    
    Element Should Contain    ${step_six_product}    ${product_name}    
    Element Should Contain    ${step_six_price}    ${product_price}
    Element Should Contain    ${step_six_total_price}    ${productPrice}
    Page Should Contain    Dopravné (Osobní odběr)
    Page Should Contain Element    ${step_six_submit}        
    
    Close Browser
    
    
    
    
        
        
    
        
       