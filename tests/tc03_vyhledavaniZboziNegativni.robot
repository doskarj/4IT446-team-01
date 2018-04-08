*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt

*** Test Cases ***
TC-03 Vyhledavani zbozi pres vyhledavaci listu - negativni test
    Open browser to Zoo eshop
    ${pageTitle}=    Get Title
    Should Be Equal    ${pageTitle}    ${eshopPageTitle}
    
    Click Link    xpath=//a[@class='search-icon']
    Input Text    xpath=//input[@id='search']    ${searchQuery}
    Select From List By Value    xpath=//select[@id='cat']    ${searchCategory}    
    Click Button    xpath=//button[@title='Hledat']
    ${url}=    Get Location
    Should Be Equal    ${url}    ${afterSearchWithCategoryURL}
    
    Element Text Should Be    xpath=//p[@class='note-msg']    Hledání nenašlo žádné výsledky.        
    Page Should Not Contain Element    xpath=//li/div[@class='item-area']    
    
    Page Should Not Contain Element    xpath=//div[@class='sorter']/div[@class='sort-by']
    
    Close Browser   