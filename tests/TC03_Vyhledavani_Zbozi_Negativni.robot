*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_search.txt

Test Teardown    Close Browser

*** Test Cases ***
TC-03 Vyhledavani zbozi pres vyhledavaci listu - negativni test
    #1 Otevreni strankz e-shopu
    Open browser to Zoo eshop
    
    #2 Vyhledavani pomoci lupy a vyberu kategorie
    Click Link    ${class_search_icon}
    Wait Until Element Is Visible    ${input_search}    
    Input Text    ${input_search}    ${search_query}
    Select From List By Value    ${category_list_search}    ${search_category}    
    Click Button    ${button_search}
    Check URL    ${after_search_with_category_url}
    
    #3 Kontrola chybove hlasky
    Element Text Should Be    ${search_msg_negative}    ${search_message}        
    Page Should Not Contain Element    ${product_list_item} 
   
    #4 Kontrola elementu pro razeni
    Page Should Not Contain Element    ${search_sorter_element}
   