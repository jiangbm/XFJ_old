*** Settings ***
Documentation                           此文档是正文页评论接口文档
Resource                                ../App_Comments/CommentsCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     comments正文页评论
...                                     作者：江宝敏

*** Variables ***
${ARTICLEID}                            3641371034600448_cms_3641247222170624
${ARTICLEID1}                           3810047140873216_cms_3810047140873216
${RESULT}                               0
${RESULT1}                              1
${KEY}                                  comments

*** Test Cases ***
有评论的文章获取正文页评论，接口返回成功
    Get Detail Comments                 ${ARTICLEID}
    ${errorcode}                        Get From Dictionary         ${response_result}          errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain key       ${response_data}            ${KEY}

无评论的文章获取正文页评论，接口返回空
    Get Detail Comments                 ${ARTICLEID1}
    ${errorcode}                        Get From Dictionary         ${response_result}          errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT1}
    Should Be Empty                     ${response_data}
