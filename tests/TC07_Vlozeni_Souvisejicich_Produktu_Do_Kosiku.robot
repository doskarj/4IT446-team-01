*** Settings ***
Library    Selenium2Library    
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt

Test Teardown    Close Browser
*** Test Cases ***
TC-07 Vlozeni Produktu Do Kosiku
     #1 Nacteni stranky e-shopu
    Open browser to Zoo eshop
    
    #2 Prechod na vypis magnetek
    Navigate to souveniers/magnets
    
    #3 Kontrola testovaciho produktu na vypise
    Check for product in list
    
    #4 Prechod na detail produktu
    Click Element    ${vydra_url}
    Check URL    ${product_page_vydra}
    
    #5 Kontrola obsahu detailu produktu
    Check Product Detail Basic Info
    Page Should Contain Element    ${vydra_short_description}        
    Page Should Contain Element    ${vydra_related}   
    
    #6 Zaskrtnuti jednoho souvisejiciho produktu
    Page Should Contain Checkbox    ${vydra_related_products}
    Execute Javascript    document.getElementById(${vydra_related_products_js}).click()
    
    #7 Vlozeni hlavniho produktu do kosiku
    Click Element    ${vydra_add_to_cart}
    Valid Success Message
    
    #8 Prechod do kosiku
    Step from success message to shopping cart
    Check URL    ${shopping_cart_url}
    Check header menu
    
    #9 Kontrola obsahu kosiku
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_list}']
    Page Should Contain Element    ${shop_cart_first_price}
    Check Price    ${shop_cart_first_price}    ${product_quantity_from_list}    ${product_price}        
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@href='${related_product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_list}']
    Page Should Contain Element    ${shop_cart_second_price}
    Check Price    ${shop_cart_second_price}  ${product_quantity_from_list}  ${related_product_price}  
    
    #10 Zmena poctu kusu nejprve hlavniho a pak souvisejiciho produktu
    Click Element    ${shop_cart_first_plus}
    Click Element    ${shop_cart_first_plus}
    
    Click Element    ${shop_cart_second_minus}
    
    #11 Aktualizace kosiku a nasledna kontrola
    Click Element    ${shop_cart_update}
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_detail}']
    Check Price    ${shop_cart_total_price}    ${product_quantity_from_detail}    ${product_price}
    Page Should Not Contain    ${shop_cart_table}//tr[td/a[@href='${related_product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_list}']    
    
