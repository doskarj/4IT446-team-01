*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_search.txt

Test Teardown    Close Browser

*** Test Cases ***
TC-03 Vyhledavani zbozi pres vyhledavaci listu - negativni test
    #1
    Open browser to Zoo eshop
    #2
    Click Link    ${class_search_icon}
    Wait Until Element Is Visible    ${input_search}    
    Input Text    ${input_search}    ${search_query}
    Select From List By Value    ${category_list_search}    ${search_category}    
    Click Button    ${button_search}
    ${url}=    Get Location
    Should Be Equal    ${url}    ${after_search_with_category_url}
    #3
    Element Text Should Be    ${search_msg_negative}    ${search_message}        
    Page Should Not Contain Element    ${product_list_item} 
    #xpath=//li/div[@class='item-area']    
    #4
    Page Should Not Contain Element    ${search_sorter_element}
   