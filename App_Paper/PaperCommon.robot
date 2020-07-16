*** Settings ***
Documentation                           新福建旧客户端Paper接口用例集
Resource                                ../Common/Common.robot


*** Variables ***
${PREPAPER_URI}                         /paper/prepaper          #报纸往期数据
${GETLIST_URI}                          /paper/getlist           #报纸列表页和版面

${PAGES_SIZE}                           640x240


*** Keywords ***
Prepaper
    [Documentation]                     报纸往期数据接口
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${PREPAPER_URI}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]

Get List
    [Documentation]                     报纸列表页和版面接口
    [Arguments]                         ${pages_size}=${PAGES_SIZE}
    ${params}                           Create Dictionary       pages_size=${pages_size}
    ${response}                         Get Request
    ...                                 ${API_ALIAS}
    ...                                 ${GETLIST_URI}
    ${jsondata}                         To Json                 ${response.content}
    Set Suite Variable                  ${response_data}        ${jsondata}[data]
    Set Suite Variable                  ${response_result}      ${jsondata}[result]