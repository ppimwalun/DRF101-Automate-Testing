***Settings***
Library         SeleniumLibrary
Library         DataDriver      file=C:/automate/jenkins/testdata/login_testdata01.csv
Test Setup      Open Jenkins Website
Test Teardown   Close Browser
Test Template   login testcase to jenkins

***Variables***
${Browser}      chrome
${URL}          http://www.doppio-tech.com:8080/login
${txtbox_username}     //*[@id="j_username"]
${txtbox_password}     xpath=/html/body/div/div/form/div[2]/input
${btn_signin}          xpath=/html/body/div/div/form/div[3]/input

***Keywords***
Open Jenkins Website
    Open Browser     ${URL}     ${Browser}
    Maximize Browser Window

login testcase to jenkins
    [Arguments]      ${USERNAME}   ${PASSWORD}   ${ERROR_MESSAGE_locator}     ${ERROR_MESSAGE}
    Input Text       ${txtbox_username}    ${USERNAME}
    Input Text       ${txtbox_password}    ${PASSWORD}
    Click Element    ${btn_signin}
    Wait Until Page Contains Element    ${ERROR_MESSAGE_locator}       
    Element Should Contain              ${ERROR_MESSAGE_locator}      ${ERROR_MESSAGE}

***Test Cases***
TC_login
    login testcase to jenkins  USERNAME  PASSWORD  ERROR_MESSAGE_locator  ERROR_MESSAGE