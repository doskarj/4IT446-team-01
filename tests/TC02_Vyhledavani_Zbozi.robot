*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_search.txt

*** Test Cases ***
TC-02 Vyhledavani zbozi pres vyhledavaci listu - pozitivni test
    Open browser to Zoo eshop
    ${page_title}=    Get Title
    Should Be Equal    ${page_title}    ${eshop_page_title}
    
    Click Link    ${class_search_icon}
    Input Text    ${input_search}    ${search_query}
    Click Button    ${button_search}
    ${url}=    Get Location
    Should Be Equal    ${url}    ${after_search_url}
    
    Page Should Contain    ${found_product_title1}
    Page Should Contain    ${found_product_title2}
    
    Page Should Contain Element    ${order_by_relevance}
    Page Should Contain Element    ${order_by_name}                
    Page Should Contain Element    ${order_by_price}                
    
    Close Browser   