*** Settings ***
Documentation                           此文档是获取菜单接口接口文档
Resource                                ../App_Views/ViewsCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Views菜单接口
...                                     作者：江宝敏

*** Variables ***
${RESULT}                               0
${VALUE}                                头条

*** Test Cases ***
获取公共全局参数信息，接口返回成功
    Get Tag List
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain Value     ${response_data}[0]         ${VALUE}