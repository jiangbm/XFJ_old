*** Settings ***
Documentation                           该文档是提交搜索接口
Resource                                ../App_Search/SearchCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Search提交搜索
...                                     作者：江宝敏

*** Variables ***
${KEYWORD}                              福州
${RESULT}                               0

*** Test Cases ***
提交搜索后，接口返回成功
    Search                              ${KEYWORD}
    ${errorcode}                        Get From Dictionary         ${response_result}        errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}