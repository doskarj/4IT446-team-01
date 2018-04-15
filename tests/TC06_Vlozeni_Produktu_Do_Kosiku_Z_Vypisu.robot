*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt

Test Teardown    Close Browser
*** Test Cases ***
TC06 - Vlozeni produktu do kosiku z vypisu
    #1 Otevreni stranky e-shopu
    Open browser to Zoo eshop
    
    #2 Prichod na stranku s magnetkami
    Navigate to souveniers/magnets
    
    #3 Kontrola zda se na nic vyskytuje testovaci produkt
    Check for product in list
    
    #4 Vlozeni do kosiku z vypisu
    Add product to shopping cart from product list
    Valid success message
    
    #5 Kliknuti na tlaciko Pokracovat
    Click Button    ${success_msg_continue}
    Wait Until Element Is Not Visible    ${success_msg_containter}  
     
    #6 Kontrola ceny a mnozstvi ve vyskakujicim okne u kosiku
    Check price    ${shop_cart_price_mouseover}    ${product_quantity_from_list}    ${product_price}
    
    #7 Prechod do kosiku
    Mouse Over	${shop_cart_mouseover}
    Click Element     ${shop_cart_to_cart}
    Check URL    ${shopping_cart_url}
    Check header menu
    
    #8 Kontrola ceny a poctu kusu v kosiku
    Shopping Cart Basic Check
    
    #9 Smazani obsahu kosiku
    Remove From Cart And Close Browser
