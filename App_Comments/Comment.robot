*** Settings ***
Documentation                           此文档是提交评论接口文档
Resource                                ../App_Comments/CommentsCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     comments提交评论
...                                     作者：江宝敏

*** Variables ***
${ARTICLEID}                            3775748498883584_cms_3775748498883584
${CONTENT}                              想去
${RESULT}                               0

*** Test Cases ***
提交正常评论，接口返回成功
    Comment Api                         ${ARTICLEID}
    ...                                 ${CONTENT}
    ${errorcode}                        Get From Dictionary         ${response_result}          errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}