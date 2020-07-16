*** Settings ***
Documentation                           该文档是获取搜索关键字，热门新闻，机构订阅接口
Resource                                ../App_Search/SearchCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Search搜索关键字，热门新闻，机构订阅
...                                     作者：江宝敏

*** Variables ***
${RESULT}                               0
${KEY1}                                 keyword
${KEY2}                                 hotnews

*** Test Cases ***
获取搜索关键字，热门新闻后，接口返回成功
    Search Info
    ${errorcode}                        Get From Dictionary         ${response_result}        errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Dictionary Should Contain Key       ${response_data}            ${KEY1}
    Dictionary Should Contain Key       ${response_data}            ${KEY2}