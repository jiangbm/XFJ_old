*** Settings ***
Documentation                           此文档是获取机构文章详情接口文档
Resource                                ../App_Gov/GovCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Gov机构文章详情
...                                     作者：江宝敏

*** Variables ***
${ARTICLEID}                            3086033210672128_gov_3086033210672128
${CATEGORYID}                           576
${RESULT}                               0


*** Test Cases ***
获取文脉颂中华下的某篇文章详情，接口返回成功
    Gov List                            ${CATEGORYID}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}
