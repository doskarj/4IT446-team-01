*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_vydra.txt

*** Test Cases ***
TC-04 Prechod na detail produktu pres menu
    Open browser to Zoo eshop
    
    Navigate to souveniers/magnets

    Check for product in list
        
    Click Link    xpath=//a[@title='${productName}']
    ${url}=    Get Location
    Should Be Equal    ${url}    ${vydra_url}
    
    Element Text Should Be    xpath=//h1    ${productName}
    Page Should Contain Element    //p[@class='availability in-stock']
    Element Should Contain    //div[@class='price-box']//span[@id='price-including-tax-1361']    ${productPrice}
    Page Should Contain Element    //div[@class='qty-holder']/input[@id='qty']
    Page Should Contain Button    //button[@title='Přidat do košíku'] 
    Page Should Contain Element    //div[@class='short-description']
    Page Should Contain Element    //div[@class='block-related']                           
    
    Close Browser   