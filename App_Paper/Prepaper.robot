*** Settings ***
Documentation                           此文档是获取报纸往期数据接口文档
Resource                                ../App_Paper/PaperCommon.robot
Library                                 DateTime
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Paper报纸往期数据
...                                     作者：江宝敏

*** Variables ***
${RESULT}                               0


*** Test Cases ***
获取报纸往期数据信息，接口返回成功
    Prepaper
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    ${curdate}=                         Get Current Date            result_format=%Y-%m-%d
    Dictionary Should Contain Value     ${response_data}[0]         ${curdate}