*** Settings ***
Documentation                           此文档是获取专题详情页接口文档
Resource                                ../App_Content/ContentCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     content专题详情页
...                                     作者：江宝敏

*** Variables ***
${CATEGORYID}                           58
${ARTICLEID}                            2501443495838720_topic_178
${ARTICLEID2}                           2501443495838720_topic_9999
${KEY}                                  focus
${RESULT}                               ok
${RESULT1}                              no result

*** Test Cases ***
专题存在时查看详情，接口返回成功
    Get List By TopicID                 ${CATEGORYID}
    ...                                 ${ARTICLEID}
    ${errorMsg}                         Get From Dictionary         ${response_result}      errorMsg
    Should Be Equal As Strings          ${errorMsg}                 ${RESULT}
    Should Not Be Empty                 ${response_data}
    Dictionary Should Contain Key       ${response_data}            ${KEY}

专题不存在或下线后查看详情，接口返回空
    Get List By TopicID                 ${CATEGORYID}
    ...                                 ${ARTICLEID2}
    ${errorMsg}                         Get From Dictionary         ${response_result}      errorMsg
    Should Be Equal As Strings          ${errorMsg}                 ${RESULT1}
    Should Be Empty                     ${response_data}