*** Settings ***
Documentation                           此文档是获取版本更新接口文档
Resource                                ../App_Views/ViewsCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Views版本更新
...                                     作者：江宝敏

*** Variables ***
${PALTFORM}                             android
${APPVERSION}                           566
${RESULT}                               0
${KEY}                                  forceupdate
${VALUE}                                False

*** Test Cases ***
获取版本信息，接口返回成功
    Version                             ${PALTFORM}                 ${APPVERSION}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain Item      ${response_data}            ${KEY}                  ${VALUE}