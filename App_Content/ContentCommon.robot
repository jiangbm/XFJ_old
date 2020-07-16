*** Settings ***
Documentation                           新福建旧客户端Content接口用例集
Resource                                ../Common/Common.robot


*** Variables ***
${GETCONTENTLIST_URI}                   /content/getcontentlist             #文章列表页
${GETDETAIL_URI}                        /content/getdetail                  #正文详情页
${GETLISTBYTOPICID_URI}                 /content/getlistbytopicid           #专题新闻列表
#${GETREPORTLIST_URI}                    /content/getreportlist
#${GETREPORTARTICLELIST_URI}             /content/getreportarticlelist       #报道集新闻列表
#${GETTOPICSLIST_URI}                    /content/gettopicslist              #所有专题列表
${SUPPORT_URI}                          /content/support                    #正文文章内容点赞
${ITEMRECOMMEND}                        /content/itemrecommend              #相关推荐
#${GETPUSHDETEAIL}                       /content/getpushdetail              #PUSH详情

${SYSTYPE}                              cms
${VERSION}                              3.2.0
${CATEGORYID}                           3
${DEVICE_SIZE}                          1080x2340
${TYPE}                                 normal
${USERID}                               3971136

*** Keywords ***
Get Contentlist
    [Documentation]                    文章列表页接口
    [Arguments]                         ${categoryid}
    ${params}                           Create Dictionary
    ...                                 categoryid=${categoryid}
    ...                                 systype=${SYSTYPE}
    ...                                 client_ver=${VERSION}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${GETCONTENTLIST_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Get Detail
    [Documentation]                     文章详情页接口
    [Arguments]                         ${articleid}
    ...                                 ${categoryid}=${CATEGORYID}
    ...                                 ${device_size}=${DEVICE_SIZE}
    ${params}                           Create Dictionary
    ...                                 articleid=${articleid}
    ...                                 categoryid=${categoryid}
    ...                                 device_size=${device_size}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${GETDETAIL_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                ${response.content}
    Set Suite Variable                  ${response_data}       ${jsondata}[data]
    Set Suite Variable                  ${response_result}     ${jsondata}[result]

Get List By TopicID
    [Documentation]                     专题详情页接口
    [Arguments]                         ${categoryid}
    ...                                 ${articleid}
    ...                                 ${device_size}=${DEVICE_SIZE}
    ${params}                           Create Dictionary
    ...                                 categoryid=${categoryid}
    ...                                 articleid=${articleid}
    ...                                 device_size=${device_size}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${GETLISTBYTOPICID_URI}
    ...                                 params=${params}
    ${jsondata}                         TO Json               ${response.content}
    Set Suite Variable                  ${response_data}      ${jsondata}[data]
    Set Suite Variable                  ${response_result}    ${jsondata}[result]

Support API
    [Documentation]                     详情点赞接口
    [Arguments]                         ${articleid}
    ...                                 ${type}=${TYPE}
    ...                                 ${userid}=${USERID}
    ${params}                           Create Dictionary
    ...                                 articleid=${articleid}
    ...                                 type=${type}
    ...                                 userid=${userid}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${SUPPORT_URI}
    ...                                 params=${params}
    ${jsondata}                         TO Json               ${response.content}
    Set Suite Variable                  ${response_data}      ${jsondata}[data]
    Set Suite Variable                  ${response_result}    ${jsondata}[result]

Item Recommend
    [Documentation]                     文章相关阅读接口
    [Arguments]                         ${articleid}
    ${params}                           Create Dictionary
    ...                                 articleid=${articleid}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${ITEMRECOMMEND}
    ...                                 params=${params}
    ${jsondata}                         TO Json               ${response.content}
    Set Suite Variable                  ${response_data}      ${jsondata}[data]
    Set Suite Variable                  ${response_result}    ${jsondata}[result]