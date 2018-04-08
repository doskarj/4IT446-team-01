*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_vydra.txt

*** Test Cases ***
TC-01 E2E test -pozitivni test zakladni funkcionality eshopu
    Open browser to Zoo eshop
    
    Navigate to souveniers/magnets    
    
    #product detail
    Wait Until Element Is Visible    ${vydra_url}
    Click Element    ${vydra_url}
    Element Should Contain    ${vydra_title}    ${productName}    
    Element Should Contain    ${vydra_price}    ${productPrice}    
    Page Should Contain Element    ${vydra_short_description}    
    Page Should Contain Element    ${vydra_qty}    
    Page Should Contain Element    ${vydra_add_to_cart}    
    
    #success message display
    Click Element    ${vydra_add_to_cart}
    Valid success message
    
    #step to shopping cart
    Step from success message to shopping cart
    Check header menu
    
    
    Element Should Contain    xpath=//table[@id='shopping-cart-table']/tbody/tr/td/h2/a    ${productName}
    Element Should Contain    xpath=//table[@id='shopping-cart-table']/tbody/tr/td/span[@class='cart-price']/span    ${productPrice}
    Page Should Contain Element    xpath=//table[@id='shopping-cart-table']/tbody/tr/td/div[@class='qty-holder']/input[@value=1]
    Element Should Contain    xpath=//table[@id='shopping-cart-totals-table']/tbody/tr/td/span[@class='price']    ${productPrice}
    
    Click Button    xpath=//div[@class='totals']//button[@title='K pokladně']
    Element Should Be Visible    xpath=//div[@id='checkout-step-login']
    Page Should Contain Element    xpath=//div[@id='checkout-step-login']//input[@id='login:guest']
    Page Should Contain Element    xpath=//div[@class='header']/div[@class='header-bottom']/div[@class='container']/div[@class='main-nav']
    
    Click Element    xpath=//div[@id='checkout-step-login']//input[@id='login:guest']
    
    Click Button    xpath=//button[@id='onepage-guest-register-button']
    Element Should Be Visible    xpath=//div[@id='checkout-step-billing']
    #Radio Button Should Be Set To    group_name    value
    Element Should Contain    xpath=//input[@checked='checked']/following-sibling::label   Zaslat Na Tuto Adresu    
    Element Should Contain    xpath=//label[@for='billing:firstname']    Jméno    
    Element Should Contain    xpath=//label[@for='billing:lastname']    Příjmení    
    Element Should Contain    xpath=//label[@for='billing:email']    Emailová Adresa    
    Element Should Contain    xpath=//label[@for='billing:street1']    Adresa    
    Element Should Contain    xpath=//label[@for='billing:city']    Město    
    Element Should Contain    xpath=//label[@for='billing:country_id']    Země    
    Element Should Contain    xpath=//label[@for='billing:telephone']    Telefon
    
    Input Text    xpath=//input[@id='billing:firstname']    ${firstName}
    Input Text    xpath=//input[@id='billing:lastname']    ${lastName}    
    Input Text    xpath=//input[@id='billing:email']    ${email}
    Input Text    xpath=//input[@id='billing:street1']    ${street}
    Input Text    xpath=//input[@id='billing:city']    ${city}
    Input Text    xpath=//input[@id='billing:telephone']    ${telephone}
    Click Button    xpath=//div[@id='billing-buttons-container']/button[@title='Pokračovat']
    Wait Until Element Is Visible    xpath=//div[@id='checkout-step-shipping_method']    
    Element Should Be Visible    xpath=//div[@id='checkout-step-shipping_method']
    
    Click Element    xpath=//input[@id='s_method_freeshipping_freeshipping']
    Click Button    xpath=//div[@id='shipping-method-buttons-container']/button
    Wait Until Element Is Visible    xpath=//div[@id='checkout-step-payment']    
    Element Should Be Visible    xpath=//div[@id='checkout-step-payment']
    
    Click Element    xpath=//input[@id='p_method_cashondelivery']
    Click Button    xpath=//div[@id='payment-buttons-container']/button
    Wait Until Element Is Visible    xpath=//div[@id='checkout-step-review']    
    Element Should Be Visible    xpath=//div[@id='checkout-step-review']
    
    Element Should Contain    xpath=//table[@id='checkout-review-table']/tbody/tr/td/h3    ${productName}    
    Element Should Contain    xpath=//table[@id='checkout-review-table']/tbody/tr/td//span[@class='price']    ${productPrice}
    Element Should Contain    xpath=//table[@id='checkout-review-table']/tfoot/tr[@class='grand-total last']/td//span[@class='price']    ${productPrice}
    Page Should Contain    Dopravné (Osobní odběr)
    Page Should Contain Element    xpath=//div[@id='review-buttons-container']/button        
    
    Close Browser
    
    
    
    
        
        
    
        
       