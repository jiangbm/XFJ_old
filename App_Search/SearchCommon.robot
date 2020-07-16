*** Settings ***
Documentation                           新福建旧客户端search接口用例集
Resource                                ../Common/Common.robot

*** Variables ***
${SEARCH_URI}                           /search/search      #提交搜索
${HOTWORD_URI}                          /search/hotword     #默认搜索词
${INFO_URI}                             /search/info        #搜索关键字，热门新闻，机构订阅

*** Keywords ***
Search
    [Documentation]                     搜索接口
    [Arguments]                         ${keyword}
    ${params}                           Create Dictionary       keyword=${keyword}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${SEARCH_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Search HotWord
    [Documentation]                     默认搜索词接口
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${HOTWORD_URI}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Search Info
    [Documentation]                     搜索关键字，热门新闻，机构订阅接口
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${INFO_URI}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]