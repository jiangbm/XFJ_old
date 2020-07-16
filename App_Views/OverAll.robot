*** Settings ***
Documentation                           此文档是获取公共全局参数接口文档
Resource                                ../App_Views/ViewsCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Views公共全局参数
...                                     作者：江宝敏

*** Variables ***
${RESULT}                               0


*** Test Cases ***
获取公共全局参数信息，接口返回成功
    Over All
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain Key       ${response_data}            contract
