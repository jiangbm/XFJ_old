*** Settings ***
Documentation                           新福建旧客户端Comments接口用例集
Resource                                ../Common/Common.robot

*** Variables ***
${COMMENT_URI}                          /comments/comment
${GETDETAILCOMMENTS_URI}                /comments/getdetailcomments
${HOTCOMMENTS_URI}                      /comments/hotcomments
${GETCOMMENTBYID_URI}                   /comments/getcommentbyid
${SUPPORT_URI}                          /comments/support
${COMMENTLIST_URI}                      /comments/commentlist

${UDID}                                 123     #iOS_d36309a414ced6d8c7c9aa35904c9112
${TYPE}                                 normal
${VERSION}                              3.2.0
${COUNT}                                20
${SESSIONID}                            EMPTY

*** Keywords ***
Comment Api
    [Documentation]                     提交评论接口
    [Arguments]                         ${articleid}
    ...                                 ${content}
    ...                                 ${type}=${TYPE}
    ...                                 ${udid}=${UDID}
    ${headers}                          Create Dictionary
    ...                                 Content-Type=multipart/form-data
#    ${body}                             Set Variable
#    ...                                 {articleid:${articleid},content:${content},type:${type},udid:${udid}}
    ${params}                           Create Dictionary
    ...                                 articleid=${articleid}
    ...                                 content=${content}
    ...                                 type=${type}
    ...                                 udid=${udid}
    ${response}                         Post Request
    ...                                 ${API_ALIAS}
    ...                                 ${COMMENT_URI}
    ...                                 params=${params}
    ...                                 headers=${headers}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Get Detail Comments
    [Documentation]                     查看正文页评论接口
    [Arguments]                         ${articleid}
    ...                                 ${count}=${COUNT}
    ...                                 ${client_ver}=${VERSION}
    ${params}                           Create Dictionary
    ...                                 articleid=${articleid}
    ...                                 client_ver=${client_ver}
    ...                                 count=${count}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${GETDETAILCOMMENTS_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Hot Comments
    [Documentation]                     热门评论接口
    [Arguments]                         ${articleid}
    ${params}                           Create Dictionary
    ...                                 articleid=${articleid}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${HOTCOMMENTS_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Get Comment By Id
    [Documentation]                     评论详情接口
    [Arguments]                         ${commentid}
    ...                                 ${sessionId}=${SESSIONID}
    ...                                 ${udid}=${UDID}
    ${params}                           Create Dictionary
    ...                                 commentid=${commentid}
    ...                                 sessionId=${sessionId}
    ...                                 udid=${udid}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${GETCOMMENTBYID_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Comment Support Api
    [Documentation]                     评论点赞接口
    [Arguments]                         ${articleid}
    ...                                 ${commentid}
#    ...                                 ${userid}=${USERID}
    ${body}                             Create Dictionary
    ...                                 articleid=${articleid}
    ...                                 commentid=${commentid}
#    ...                                 userid=${userid}
    ${headers}                          Create Dictionary
    ...                                 Content-Type=application/x-www-form-urlencoded
    ${response}                         Post Request
    ...                                 ${API_ALIAS}
    ...                                 ${SUPPORT_URI}
    ...                                 params=${body}
    ...                                 headers=${headers}
    ${jsondata}                         TO Json               ${response.content}
    Set Suite Variable                  ${response_data}      ${jsondata}[data]
    Set Suite Variable                  ${response_result}    ${jsondata}[result]

Comment List
    [Documentation]                     最新评论接口
    [Arguments]                         ${articleid}
    ${params}                           Create Dictionary
    ...                                 articleid=${articleid}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${COMMENTLIST_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]
