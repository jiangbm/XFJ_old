*** Settings ***
Documentation                           本文档是获取稿件详情接口文档
Resource                                ../App_Content/ContentCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     content文章详情页
...                                     作者：江宝敏

*** Variables ***
${ARTICLEID}                            3646486996222976_cms_3646486996222976
${ARTICLEID1}                           3808293231723520_cms_3808293231723520
${KEY}                                  category_id
${RESULT}                               ok
${RESULT1}                              can't find the news，please check

*** Test Cases ***
稿件存在时查看稿件详情，接口成功返回数据
    Get Detail                          ${ARTICLEID}
    ${errorMsg}                         Get From Dictionary         ${response_result}      errorMsg
    Should Be Equal As Strings          ${errorMsg}                 ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain Key       ${response_data}            ${KEY}

稿件下线时查看稿件详情，接口返回为空
    Get Detail                          ${ARTICLEID1}
    ${errorMsg}                         Get From Dictionary         ${response_result}      errorMsg
    Should Be Equal As Strings          ${errorMsg}                 ${RESULT1}
    Should Be Empty                     ${response_data}