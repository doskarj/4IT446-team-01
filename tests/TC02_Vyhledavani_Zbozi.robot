*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_search.txt

Test Teardown    Close Browser

*** Test Cases ***
TC-02 Vyhledavani zbozi pres vyhledavaci listu - pozitivni test
    #1
    Open browser to Zoo eshop

    #2
    Click Link    ${class_search_icon}
    Input Text    ${input_search}    ${search_query}
    Wait Until Element Is Visible    ${input_search} 
    Click Button    ${button_search}
    ${url}=    Get Location
    Should Be Equal    ${url}    ${after_search_url}
    #3
    Page Should Contain    ${found_product_title1}
    Page Should Contain    ${found_product_title2}
    #4
    Page Should Contain Element    ${order_by_relevance}
    Page Should Contain Element    ${order_by_name}                
    Page Should Contain Element    ${order_by_price}                
    
  