*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt

Test Teardown    Close Browser
*** Test Cases ***
TC-05 Vložení produku do košíku z detailu produktu
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
    Check Product Detail Basic Info
    #5
    Click Button    ${vydra_add_to_cart}
    Valid success message
    #6
    Click Button    ${success_msg_continue}
    Wait Until Element Is Not Visible    ${success_msg_containter}   
    #7
    Click Element    ${vydra_add_to_cart}
    Valid success message
    #8
    Wait Until Element Is Not Visible    ${success_msg_containter} 
    #9
    Click Element    ${vydra_add_to_cart}
    Wait Until Element Is Visible    ${success_msg_containter} 
    #10
    Step from success message to shopping cart
    Check header menu
    #11
    Page Should Contain Element    ${shop_cart_table}//tr[td/a[@title='${product_name}']]//div[@class='qty-holder']/input[@value='${product_quantity_from_detail}']
    Check Price    ${shop_cart_total_price}    ${product_quantity_from_detail}    ${product_price}
    #12
    Remove From Cart And Close Browser
    