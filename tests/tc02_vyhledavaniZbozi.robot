*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt

*** Test Cases ***
TC-02 Vyhledavani zbozi pres vyhledavaci listu - pozitivni test
    Open browser to Zoo eshop
    ${pageTitle}=    Get Title
    Should Be Equal    ${pageTitle}    ${eshopPageTitle}
    
    Click Link    xpath=//a[@class='search-icon']
    Input Text    xpath=//input[@id='search']    ${searchQuery}
    Click Button    xpath=//button[@title='Hledat']
    ${url}=    Get Location
    Should Be Equal    ${url}    ${afterSearchURL}
    
    Page Should Contain    ${foundProductTitle1}
    Page Should Contain    ${foundProductTitle2}
    
    Page Should Contain Element    xpath=//select/option[@value='https://eshop.zoopraha.cz/catalogsearch/result/index/?cat=&dir=asc&order=relevance&q=Pexeso' and @selected='selected']
    Page Should Contain Element    xpath=//select/option[@value='https://eshop.zoopraha.cz/catalogsearch/result/index/?cat=&dir=asc&order=name&q=Pexeso']                
    Page Should Contain Element    xpath=//select/option[@value='https://eshop.zoopraha.cz/catalogsearch/result/index/?cat=&dir=asc&order=price&q=Pexeso']                
    
    Close Browser   