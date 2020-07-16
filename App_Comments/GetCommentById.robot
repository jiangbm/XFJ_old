*** Settings ***
Documentation                           该文档是获取评论详情接口
Resource                                ../App_Comments/CommentsCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     comments评论详情
...                                     作者：江宝敏

*** Variables ***
${COMMENTID}                            3024133
${COMMENTID1}                           900000000000000
${RESULT}                               0
${RESULT1}                              -3

*** Test Cases ***
获取存在的评论详情后，接口返回成功
    Get Comment By Id                   ${COMMENTID}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Dictionary Should Contain Item      ${response_data}            key=comment_id          value=${COMMENTID}

获取不存在的评论详情后，接口返回成功
    Get Comment By Id                   ${COMMENTID1}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT1}
    Should Be Empty                     ${response_data}