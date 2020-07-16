*** Settings ***
Documentation                           该文档是获取文章详情点赞接口
Resource                                ../App_Content/ContentCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     content正文文章内容点赞
...                                     作者：江宝敏

*** Variables ***
${ARTICLEID}                            3641371034600448_cms_3641247222170624
${RESULT}                               0

*** Test Cases ***
正文文章内容点赞后，接口返回成功
    Support API                         ${ARTICLEID}
    ${errorcode}                        Get From Dictionary         ${response_result}        errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
