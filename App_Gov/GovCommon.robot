*** Settings ***
Documentation                           新福建旧客户端Gov接口用例集
Resource                                ../Common/Common.robot


*** Variables ***
${GOVLIST_URI}                          /gov/govlist             #机构列表页（首页）
${HOME_URI}                             /gov/home                #政务大厅
${ORGLIST_URI}                          /gov/orglist             #全部机构列表页
${GOVHOME_URI}                          /gov/govhome             #机构首页
${DETAIL_URI}                           /gov/detail              #政务详情页
${ORGINFO_URI}                          /gov/orginfo             #政务机构信息

${DEVICE_SIZE}                          1080x2340
${REFRESH_TYPE}                         0
${TYPE}                                 1

*** Keywords ***
Gov List
    [Documentation]                     机构列表页（首页）接口
    [Arguments]                         ${categoryid}
    ...                                 ${device_size}=${DEVICE_SIZE}
    ...                                 ${refresh_type}=${REFRESH_TYPE}
    ${params}                           Create Dictionary
    ...                                 categoryid=${categoryid}
    ...                                 device_size=${device_size}
    ...                                 refresh_type=${refresh_type}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${GOVLIST_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]
    Set Suite Variable                  ${response_orgs}        ${jsondata}[orgs]

Home
    [Documentation]                     政务大厅接口
    [Arguments]                         ${type}=${TYPE}
    ${params}                           Create Dictionary       type=${type}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${HOME_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Org List
    [Documentation]                     全部机构列表页接口
    [Arguments]                         ${type}=${TYPE}
    ${params}                           Create Dictionary       type=${type}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${ORGLIST_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Gov Home
    [Documentation]                     机构首页接口
    [Arguments]                         ${categoryid}
    ...                                 ${device_size}=${DEVICE_SIZE}
    ${params}                           Create Dictionary
    ...                                 categoryid=${categoryid}
    ...                                 device_size=${device_size}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${GOVHOME_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]
    Set Suite Variable                  ${response_orgs}        ${jsondata}[orgs]

Detail
    [Documentation]                     机构文章详情页接口
    [Arguments]                         ${articleid}
    ...                                 ${categoryid}=${CATEGORYID}
    ...                                 ${refresh_type}=${REFRESH_TYPE}
    ${params}                           Create Dictionary
    ...                                 articleid=${articleid}
    ...                                 categoryid=${categoryid}
    ...                                 refresh_type=${refresh_type}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${DETAIL_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                ${response.content}
    Set Suite Variable                  ${response_data}       ${jsondata}[data]
    Set Suite Variable                  ${response_result}     ${jsondata}[result]

Org Info
    [Documentation]                     政务机构信息接口
    [Arguments]                         ${id}
    ${params}                           Create Dictionary       id=${id}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${ORGINFO_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]