*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt

Test Teardown    Close Browser
*** Test Cases ***
TC-05 Vlozeni produku do kosiku z detailu produktu
    #1 otevreni stranky e-shopu
    Open browser to Zoo eshop
    
    #2 Prechod na vypis se suvenyry
    Navigate to souveniers/magnets
    
    #3 Kontrola testovaciho produktu ve vypise
    Check for product in list
    
    #4 Prechod na detail produktu a nasledna kontrola
    Click Element    ${vydra_url}
    Check URL    ${product_page_vydra}
    Check Product Detail Basic Info
    
    #5 Pridani do kosiku a kontrola vyskakujiciho okna
    Click Button    ${vydra_add_to_cart}
    Valid success message
    
    #6 Kliknuti na Pokracovat
    Click Button    ${success_msg_continue}
    Wait Until Element Is Not Visible    ${success_msg_containter}   
    
    #7 Pridani do kosiku a kontrola vyskakujiciho okna
    Click Element    ${vydra_add_to_cart}
    Valid success message
    
    #8 Neudelani nic
    Wait Until Element Is Not Visible    ${success_msg_containter} 
    
    #9 Pridani do kosiku a kontrola vyskakujiciho okna
    Click Element    ${vydra_add_to_cart}
    Wait Until Element Is Visible    ${success_msg_containter} 
    
    #10 Prechod do kosiku
    Step from success message to shopping cart
    Check header menu
    
    #11  Kontrola stavu v kosiku
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_detail}']
    Check Price    ${shop_cart_total_price}    ${product_quantity_from_detail}    ${product_price}
    
    #12 Smazani z kosku
    Remove From Cart And Close Browser
    