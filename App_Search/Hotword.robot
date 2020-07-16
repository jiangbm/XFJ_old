*** Settings ***
Documentation                           该文档是获取默认搜索词接口
Resource                                ../App_Search/SearchCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Search默认搜索词
...                                     作者：江宝敏

*** Variables ***
${RESULT}                               0
${KEY}                                  hotword

*** Test Cases ***
获取默认搜索词后，接口返回成功
    Search HotWord
    ${errorcode}                        Get From Dictionary         ${response_result}        errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Dictionary Should Contain Key       ${response_data}            ${KEY}