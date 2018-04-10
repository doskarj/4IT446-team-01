*** Settings ***
Library    Selenium2Library
Resource    ../keywords/keywords.txt
Resource    ../variables/variables.txt
Resource    ../objects/objects_shopping_cart.txt

*** Test Cases ***
TC-08 Vyplneni kroku moznosti nakupu
    Open browser to Zoo eshop
    Navigate to souveniers/magnets
    
    Check for product in list
    Add product to shopping cart from product list