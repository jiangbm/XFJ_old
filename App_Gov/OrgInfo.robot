*** Settings ***
Documentation                           此文档是获取政务机构信息接口文档
Resource                                ../App_Gov/GovCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Gov政务机构信息
...                                     作者：江宝敏

*** Variables ***
${ID}                                   22
${RESULT}                               0
${KEY}                                  name
${VALUE}                                连江县

*** Test Cases ***
获取连江县机构信息，接口返回成功
    Org Info                            ${ID}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Dictionary Should Contain Item      ${response_data}            key=${KEY}              value=${VALUE}