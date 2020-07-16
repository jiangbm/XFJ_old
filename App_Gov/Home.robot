*** Settings ***
Documentation                           此文档是获取政务大厅接口文档
Resource                                ../App_Gov/GovCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Gov政务大厅
...                                     作者：江宝敏

*** Variables ***
${type}                                 2
${RESULT}                               0
${KEY}                                  recommends
${KEY1}                                 orgs
${KEY2}                                 articles

*** Test Cases ***
获取本地大厅列表，接口返回成功
    Home
    ${errorcode}                        Get From Dictionary         ${response_result}          errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain Key       ${response_data}            ${KEY}
    Dictionary Should Contain Key       ${response_data}            ${KEY1}
    Dictionary Should Contain Key       ${response_data}            ${KEY2}

获取政务大厅列表，接口返回成功
    Home                                ${type}
    ${errorcode}                        Get From Dictionary         ${response_result}          errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain Key       ${response_data}            ${KEY}
    Dictionary Should Contain Key       ${response_data}            ${KEY1}
    Dictionary Should Contain Key       ${response_data}            ${KEY2}