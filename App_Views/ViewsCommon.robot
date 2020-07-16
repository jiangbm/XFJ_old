*** Settings ***
Documentation                           新福建旧客户端Views接口用例集
Resource                                ../Common/Common.robot


*** Variables ***
${COUNTS_URI}                           /views/counts           #状态更新和所有数更新
${LIFESERVICE_URI}                      /views/lifeservice      #生活服务
${OVERALL_URI}                          /views/overall          #公共全局参数
${VERSION_URI}                          /views/version          #版本更新
${GETTAGLIST_URI}                       /menu/gettaglist        #菜单接口
${COVERPAGES_URI}                       /views/coverpages       #开屏-获取开机屏

${VERION}                               2.1.4

*** Keywords ***
Counts
    [Documentation]                     状态更新和所有数更新
    [Arguments]                         ${articleid}
    ${params}                           Create Dictionary       articleid=${articleid}
    ${headers}                          Create Dictionary       Content-Type=application/x-www-form-urlencoded
    ${response}                         Post Request
    ...                                 ${API_ALIAS}
    ...                                 ${COUNTS_URI}
    ...                                 params=${params}
    ...                                 headers=${headers}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Life Service
    [Documentation]                     生活服务
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${LIFESERVICE_URI}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Over All
    [Documentation]                     公共全局参数
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${OVERALL_URI}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Version
    [Documentation]                     版本更新
    [Arguments]                         ${platform}
    ...                                 ${appversion}
    ${params}                           Create Dictionary
    ...                                 platform=${platform}
    ...                                 appversion=${appversion}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${VERSION_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Get Tag List
    [Documentation]                     菜单接口
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${GETTAGLIST_URI}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Cover Pages
    [Documentation]                     获取开机屏
    [Arguments]                         ${platform}
    ...                                 ${device_size}
    ...                                 ${client_ver}=${VERION}
    ${params}                           Create Dictionary
    ...                                 platform=${platform}
    ...                                 device_size=${device_size}
    ...                                 client_ver=${client_ver}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${COVERPAGES_URI}
    ...                                 params=${params}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]