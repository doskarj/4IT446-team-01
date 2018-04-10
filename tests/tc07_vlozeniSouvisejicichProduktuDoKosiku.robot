*** Settings ***
Library    Selenium2Library    
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt

*** Test Cases ***
TC-07 Vlozeni Produktu Do Kosiku
     #1
    Open browser to Zoo eshop
    
    #2
    Navigate to souveniers/magnets
    
    #3
    Check for product in list
    
    #4
    
    