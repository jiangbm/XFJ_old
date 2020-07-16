*** Settings ***
Documentation                           该文档是获取文章相关阅读接口
Resource                                ../App_Content/ContentCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     content文章相关阅读
...                                     作者：江宝敏

*** Variables ***
${ARTICLEID}                            3817190605325312_cms_3817190605325312
${ARTICLEID1}                           3815367438779392_cms_3815367438779392
${RESULT}                               0


*** Test Cases ***
有相关阅读的文章查看相关阅读，接口返回成功
    Item Recommend                      ${ARTICLEID}
    ${errorcode}                        Get From Dictionary             ${response_result}          errorCode
    Should Be Equal As Strings          ${errorcode}                    ${RESULT}
    Should Not Be Empty                 ${response_data}

无相关阅读的文章查看相关阅读，接口返回数据为空
    Item Recommend                      ${ARTICLEID1}
    ${errorcode}                        Get From Dictionary             ${response_result}          errorCode
    Should Be Equal As Strings          ${errorcode}                    ${RESULT}
    Should Be Empty                     ${response_data}