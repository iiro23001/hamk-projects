*** Settings ***
Library    SeleniumLibrary
# Jimms testing...
*** Variables *** 
${URL}               http://www.jimms.fi

*** Test Cases ***
#Iiro Käki
OpeningTheWebsite_I0
    Set Screenshot Directory    /Users/User/ohjelmistotestaus24/projekti/kuvat
    [Documentation]    Opens the Jimms website and read the page title
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain    Jimms

SearchForCheapestAndMostExpensive_I1
    [Documentation]    Hae ja kuvakaappaa halvin ja kallein tuote dropdown valikon avulla
    Click Element    id:searchinput
    Sleep    1s
    Input Text    id:searchinput    Tietokoneet
    Sleep    1s
    Press Keys    id:searchinput    RETURN  
    Sleep    1s
    Click Element     xpath=/html/body/main/div[2]/div/div[2]/div[3]/div/div/div[1]/div/button/span
    Sleep    1s
    Click Element    xpath=/html/body/main/div[2]/div/div[2]/div[3]/div/div/div[1]/div/ul/li[7]
    Sleep    1s
    Capture Element Screenshot    xpath=/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]    EMBED
    Sleep    1s
    Click Element    xpath=/html/body/main/div[2]/div/div[2]/div[3]/div/div/div[1]/div/button/span
    Sleep    1s
    Click Element    xpath=/html/body/main/div[2]/div/div[2]/div[3]/div/div/div[1]/div/ul/li[8]/a
    Sleep    1s
    Capture Element Screenshot    xpath=/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]    EMBED
    Sleep    1s
    Close Browser

SearchWithSetPrice_I2
    [Documentation]    Aseta hintahaitariksi 20-30€ ja etsi sen tulokset.
    Open Browser    https://www.jimms.fi/fi/Product/List/000-0SD/pelaaminen--pelit    Chrome
    Maximize Browser Window
    Page Should Contain    Jimms
    Sleep    1s
    Click Element    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[1]/div/div[2]/div/ul/li[8]/ul/li/div/ul/li[4]
    Sleep    2s
    Scroll Element Into View    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[3]/div[1]/span
    Sleep    1s
    Click Element    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[1]/div/input
    Sleep    1s
    Input Text    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[1]/div/input    20
    Click Element    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[3]/div/input
    Scroll Element Into View    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[3]/div[1]/span
    Sleep    1s
    Input Text    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[3]/div/input    30
    Press Keys    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[3]/div/input    RETURN  
    Sleep    3s
    Capture Element Screenshot    xpath=/html/body/main/div[2]    EMBED
    Close Browser

TestDarkModeAndCatalog_I3
    [Documentation]    Muunnetaan sivusto listasta ruudukoksi, sitten vaihdetaan sivuston teeman väri. Testataan, että darkmode toimii eri näkymissä.
    Open Browser    https://www.jimms.fi/fi/Product/List/000-0SD/pelaaminen--pelit    Chrome
    Maximize Browser Window
    Sleep    1s
    Capture Page Screenshot
    Click Element    xpath=/html/body/main/div[2]/div/div[2]/div[4]/div[2]/list-view-toggler/div/button[1]
    Sleep    1s
    Click Element    xpath=/html/body/div[1]/div/div/span
    Sleep    1s
    Click Element    xpath=/html/body/div[1]/div/div/ul/li[2]/button
    Sleep    1s
    Capture Page Screenshot
    Sleep    1s
    Click Element    xpath=/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[1]/div/div[2]/div/ul/li[5]
    Sleep    1s
    Capture Page Screenshot
    Sleep    1s
    Click Element    xpath=/html/body/main/div[2]/div/div[2]/div[4]/div[4]/div[1]/div[1]/product-box/div[2]/div[2]/h5/a
    Sleep    1s
    Capture Page Screenshot
    Sleep    1s
    Close Browser