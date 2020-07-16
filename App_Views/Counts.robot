*** Settings ***
Documentation                           此文档是获取状态更新和所有数更新接口文档
Resource                                ../App_Views/ViewsCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Views状态更新和所有数更新
...                                     作者：江宝敏

*** Variables ***
${ARTICLEID}                            3775748498883584_cms_3775748498883584
${RESULT}                               1


*** Test Cases ***
获取版本信息，接口返回成功
    Counts                              ${ARTICLEID}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Be Empty                     ${response_data}
