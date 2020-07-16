*** Settings ***
Documentation                           此文档是获取全部机构列表接口文档
Resource                                ../App_Gov/GovCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Gov全部机构列表页
...                                     作者：江宝敏

*** Variables ***
${type}                                 2
${RESULT}                               0

*** Test Cases ***
获取一县一端机构列表，接口返回成功
    Org List
    ${errorcode}                        Get From Dictionary         ${response_result}          errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}

获取政务+新闻媒体机构列表，接口返回成功
    Org List                            ${type}
    ${errorcode}                        Get From Dictionary         ${response_result}          errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}