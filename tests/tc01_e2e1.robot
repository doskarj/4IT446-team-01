*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt

*** Test Cases ***
TC-01 E2E test -pozitivni test zakladni funkcionality eshopu
    Open browser to Zoo eshop
    
    Navigate to souveniers/magnets    
    
    Wait Until Element Is Visible    xpath=//a[@href='https://eshop.zoopraha.cz/suvenyry/magnetky-128/magnetka-vydra.html']
    Click Element    xpath=//a[@href='https://eshop.zoopraha.cz/suvenyry/magnetky-128/magnetka-vydra.html']
    Element Should Contain    xpath=//h1    ${productName}    
    Element Should Contain    xpath=//span[@id='price-including-tax-1361']    ${productPrice}    
    Page Should Contain Element    xpath=//div[@class='short-description']    
    Page Should Contain Element    xpath=//input[@id='qty']    
    Page Should Contain Element    xpath=//button[@title='Přidat do košíku']    
    
    Click Element    xpath=//button[@title='Přidat do košíku']
    Wait Until Element Is Visible    xpath=//div[@id='success-message-container']
    Element Should Contain    xpath=//div[@id='success-message-container']/div/div[@class='msg']/p    ${productName}
    Page Should Contain Element    xpath=//div[@id='success-message-container']/button[@id='finish_and_checkout']
    Page Should Contain Element    xpath=//div[@id='success-message-container']/button[@id='continue_shopping']
    
    Click Element    xpath=//div[@id='success-message-container']/button[@id='finish_and_checkout']
    Page Should Contain Element    xpath=//table[@id='shopping-cart-table']
    Page Should Contain Element    xpath=//div[@class='header']/div[@class='header-bottom']/div[@class='container']/div[@class='main-nav']
    
    
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
    
    
    
    
        
        
    
        
       