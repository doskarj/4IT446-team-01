*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt

*** Test Cases ***
TC-05 Vložení produku do košíku z detailu produktu
    Open browser to Zoo eshop
    
    Navigate to souveniers/magnets
    
    Check for product in list
    
    Mouse Over    xpath=//div[@class='item-area' and //h2/a[@title='${productName}']]
    Click Link    xpath=//div[@class='item-area' and //h2/a[@title='${productName}']]//a[@title='Přidat do košíku']
    Valid success message
    
    Click Button    xpath=//div[@id='success-message-container']/button[@id='continue_shopping']
    Wait Until Element Is Not Visible    xpath=//div[@id='success-message-container']    
    
    Mouse Over    xpath=//div[@class='item-area' and //h2/a[@title='${productName}']]    
    Click Link    xpath=//div[@class='item-area' and //h2/a[@title='${productName}']]//a[@title='Přidat do košíku']
    Wait Until Element Is Visible    xpath=//div[@id='success-message-container']
    Element Should Contain    xpath=//div[@id='success-message-container']/div/div[@class='msg']/p    ${productName}
    Page Should Contain Element    xpath=//div[@id='success-message-container']/button[@id='finish_and_checkout']
    Page Should Contain Element    xpath=//div[@id='success-message-container']/button[@id='continue_shopping']
    
    Wait Until Element Is Not Visible    xpath=//div[@id='success-message-container']

    Mouse Over    xpath=//div[@class='item-area' and //h2/a[@title='${productName}']]
    Click Link    xpath=//div[@class='item-area' and //h2/a[@title='${productName}']]//a[@title='Přidat do košíku']
    Wait Until Element Is Visible    xpath=//div[@id='success-message-container']
    Element Should Contain    xpath=//div[@id='success-message-container']/div/div[@class='msg']/p    ${productName}
    Page Should Contain Element    xpath=//div[@id='success-message-container']/button[@id='finish_and_checkout']
    Page Should Contain Element    xpath=//div[@id='success-message-container']/button[@id='continue_shopping']
    
    Click Button    xpath=//div[@id='success-message-container']/button[@id='finish_and_checkout']
    Page Should Contain Element    xpath=//table[@id='shopping-cart-table']
    Page Should Contain Element    xpath=//div[@class='header']/div[@class='header-bottom']/div[@class='container']/div[@class='main-nav']
    
    Page Should Contain Element    //table[@id='shopping-cart-table']//tr[td/a[@title='${productName}']]//div[@class='qty-holder']/input[@value='3']
    ${number}=    Convert To Integer    ${productPrice}    
    ${totalPrice}=    Evaluate    ${number}*${3}
    ${totalPriceString}=    Convert To String    ${totalPrice}
    Element Should Contain    //table[@id='shopping-cart-totals-table']//tr[@class='grand-total']//span[@class='price']    ${totalPriceString}
    
    Click Link    //table[@id='shopping-cart-table']//tr[td/a[@title='${productName}']]//a[@title='Odstranit položku']
    Page Should Contain    V košíku nejsou žádné položky.       
   
    Close Browser
    