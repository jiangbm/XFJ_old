*** Settings ***
Documentation                           此文档是获取机构首页接口文档
Resource                                ../App_Gov/GovCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Gov机构首页
...                                     作者：江宝敏

*** Variables ***
${CATEGORYID}                           576
${RESULT}                               0
${KEY}                                  name
${VALUE}                                文脉颂中华

*** Test Cases ***
获取文脉颂中华机构信息，接口返回成功
    Gov Home                            ${CATEGORYID}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain Item      ${response_orgs}            key=${KEY}              value=${VALUE}