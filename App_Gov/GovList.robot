*** Settings ***
Documentation                           此文档是获取机构列表页（首页）接口文档
Resource                                ../App_Gov/GovCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Gov机构列表页（首页）
...                                     作者：江宝敏

*** Variables ***
${CATEGORYID}                           78
${RESULT}                               0
${KEY}                                  name
${VALUE}                                福州

*** Test Cases ***
获取首页福州列表，接口返回成功
    Gov List                            ${CATEGORYID}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain Item      ${response_orgs}            key=${KEY}              value=${VALUE}


