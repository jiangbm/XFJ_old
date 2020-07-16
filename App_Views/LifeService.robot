*** Settings ***
Documentation                           此文档是获取生活服务接口文档
Resource                                ../App_Views/ViewsCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Views生活服务
...                                     作者：江宝敏

*** Variables ***
${RESULT}                               0


*** Test Cases ***
获取生活服务信息，接口返回成功
    Life Service
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}