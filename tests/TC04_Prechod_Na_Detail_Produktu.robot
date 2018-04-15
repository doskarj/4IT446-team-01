*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_vydra.txt
Test Teardown    Close Browser

*** Test Cases ***
TC-04 Prechod na detail produktu pres menu
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
    #5
    Check Product Detail Basic Info
    Page Should Contain Element    ${vydra_related}                           
    
  