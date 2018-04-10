*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_search.txt

*** Test Cases ***
TC-03 Vyhledavani zbozi pres vyhledavaci listu - negativni test
    Open browser to Zoo eshop
    ${page_title}=    Get Title
    Should Be Equal    ${page_title}    ${eshop_page_title}
    
    Click Link    ${class_search_icon}
    Input Text    ${input_search}    ${search_query}
    Select From List By Value    ${category_list_search}    ${search_category}    
    Click Button    ${button_search}
    ${url}=    Get Location
    Should Be Equal    ${url}    ${afterSearchWithCategoryURL}
    
    Element Text Should Be    ${search_msg_negative}    Hledání nenašlo žádné výsledky.        
    Page Should Not Contain Element    ${product_list_item} 
    #xpath=//li/div[@class='item-area']    
    
    Page Should Not Contain Element    ${search_sorter_element}
    
    Close Browser   