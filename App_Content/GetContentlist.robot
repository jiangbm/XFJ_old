*** Settings ***
Documentation                           此文档是获取文章列表接口文档
Resource                                ../App_Content/ContentCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     content文章列表页
...                                     作者：江宝敏

*** Variables ***
${CATEGORYID}                           3
${CATEGORYID1}                          9999
${RESULT}                               0
${RESULT1}                              1

*** Test Cases ***
查看头条栏目文章列表，接口返回成功
    Get Contentlist                     ${CATEGORYID}
    Should Be Equal As Strings          ${response_result}[errorCode]       ${RESULT}
    ${groupdata} =                      Get From Dictionary                 ${response_data}[0]     group_data
    ${categoryid}                       Get From Dictionary                 ${groupdata}[0]         category_id
    Should Be Equal As Strings          ${categoryid}                       ${CATEGORYID}
#    Dictionary Should Contain Value     ${groupdata}[0]            ${CATEGORYID}

查看栏目不存在时，接口返回为空
    Get Contentlist                     ${CATEGORYID1}
    Should Be Equal As Strings          ${response_result}[errorCode]       ${RESULT1}
    Should Be Empty                     ${response_data}