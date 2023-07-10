*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

 create session
   open browser  https://eg-stage.proandi.de/foerderfinderangebote/  chrome
   Maximize Browser Window
close session
    Close All Browsers

*** Variables ***


*** Test Cases ***

Überprüfen, ob die Filterfunktion korrekt funktioniert, wenn ein Schreibfilter angewendet wird
   create session
   Wait Until Element Is Visible  id=suche  timeout=10s
   Input Text  id=suche  nakopa
   Wait Until Element Is Visible  xpath=(//div[text()='Nakopa - Nachhaltige Kommunalentwicklung durch Partnerschaftsprojekte'])[1]  timeout=10s
   ${expectedText}=  Set Variable  Nakopa 
   Element Should Contain  xpath=(//div[text()='Nakopa - Nachhaltige Kommunalentwicklung durch Partnerschaftsprojekte'])[1]   ${expectedText}
   close session


Überprüfen, ob die Filterfunktion korrekt funktioniert, wenn auf einen Filterbereich geklickt wird
    create session
    Wait Until Element Is Visible  xpath=//span[text()='Landesförderprogramme NRW']  timeout=10s
    Click Element  xpath=//span[text()='Landesförderprogramme NRW']
    Wait Until Element Is Visible  xpath=(//div[text()='EpIB - Entwicklungspolitische Informations- und Bildungsarbeit'])[1]  timeout=10s
    ${expectedText}=  Set Variable  Entwicklungspolitische Informations- und Bildungsarbeit
    Element Should Contain  xpath=(//div[text()='EpIB - Entwicklungspolitische Informations- und Bildungsarbeit'])[1]   ${expectedText}
    ${expectedText2}=  Set Variable  Auslandsprojekte NRW
    Element Should Contain  (//div[text()='AP - Auslandsprojekte NRW'])[1]   ${expectedText2}
     close session


Überprüfen, ob der Startmenü-Button korrekt funktioniert
    create session
    Wait Until Element Is Visible  id=li_start  timeout=10s
    Click Element  id=li_start
    ${actualText}=  Get Text  xpath=//strong[text()='Herzlich willkommen bei der Förderprojektsoftware von Engagement Global']
    ${expectedText}=  Set Variable  Herzlich willkommen bei der Förderprojektsoftware von Engagement Global
    Should Be Equal  ${expectedText}   ${actualText}
    close session