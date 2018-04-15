*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_vydra.txt
Resource    ../objects/objects_shop_process.txt

Test Teardown    Close Browser
*** Test Cases ***
TC-01 E2E test -pozitivni test zakladni funkcionality eshopu
    #1
    Open browser to Zoo eshop
    #2
    Navigate to souveniers/magnets    
    
    #3
    Wait Until Element Is Visible    ${vydra_url}
    Click Element    ${vydra_url}
    Check Product Detail Basic Info
    Page Should Contain Element    ${vydra_add_to_cart}    
    
    #4
    Click Element    ${vydra_add_to_cart}
    Valid success message
    
    #5
    Step from success message to shopping cart
    Check header menu
    
    #6
    Shopping Cart Basic Check
    
    #7
    Click Button    ${shop_cart_checkout}
    Element Should Be Visible    ${step_one_content}
    Page Should Contain Element    ${step_one_quest}
    Check header menu
    #8
    Click Element    ${step_one_quest}
    #9
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
    #10
    Input Text    ${step_two_first_name}    ${firstName}
    Input Text    ${step_two_last_name}    ${lastName}    
    Input Text    ${step_two_email}    ${email}
    Input Text    ${step_two_street1}    ${street}
    Input Text    ${step_two_city}    ${city}
    Input Text    ${step_two_telephone}    ${telephone}
    Click Button    ${step_two_continue}
    Wait Until Element Is Visible    ${step_four_content}    
    #11
    Wait Until Element Is Visible    ${step_four_freeshipping}  
    Execute Javascript    document.getElementById(${step_four_freeshipping_js}).click()  
    #Click Element    ${step_four_freeshipping}
    Click Button    ${step_four_continue}
    Wait Until Element Is Visible    ${step_five_content}    

    #12
    Click Element    ${step_five_cash}
    Click Button    ${step_five_continue}
    Wait Until Element Is Visible    ${step_six_content}     
    #13
    Step Six Basic Check    ${product_name}    ${product_price}    ${product_price}
    Page Should Contain    ${step_six_shipping_method_free}
            
    
    #Close Browser
    
    
    
    
        
        
    
        
       