*** Settings ***
Library    Selenium2Library    
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt

*** Test Cases ***
TC-07 Vlozeni Produktu Do Kosiku
     #1
    Open browser to Zoo eshop
    
    #2
    Navigate to souveniers/magnets
    
    #3
    Check for product in list
    
    #4
    Click Element    ${vydra_url}
    ${url}=    Get Location
    Should Be Equal    ${url}    ${product_page_vydra}
    
    #5
    Check Product Detail Basic Info
    Page Should Contain Element    ${vydra_related}   
    
    #6
    Page Should Contain Checkbox    ${vydra_related_products}
    Execute Javascript    document.getElementById('related-checkbox740').click()
    
    #7
    Click Element    ${vydra_add_to_cart}
    Valid Success Message
    
    #8
    Step from success message to shopping cart
    ${url_cart}=    Get Location
    Should Be Equal    ${url_cart}    ${shopping_cart_url}
    Check header menu
    
    #9
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_list}']
    Page Should Contain Element    ${shop_cart_first_price}
    Check Price    ${shop_cart_first_price}    ${product_quantity_from_list}    ${product_price}        
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@href='${related_product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_list}']
    Page Should Contain Element    ${shop_cart_second_price}
    Check Price    ${shop_cart_second_price}  ${product_quantity_from_list}  ${related_product_price}  
    
    #10
    Click Element    ${shop_cart_first_plus}
    Click Element    ${shop_cart_first_plus}
    
    Click Element    ${shop_cart_second_minus}
    
    #11
    Click Element    ${shop_cart_update}
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_detail}']
    Check Price    ${shop_cart_total_price}    ${product_quantity_from_detail}    ${product_price}
    Page Should Not Contain    ${shop_cart_table}//tr[td/a[@href='${related_product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_list}']    
    
     #12
     Remove From Cart And Close Browser