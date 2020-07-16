*** Settings ***
Documentation                           此文档是获取开机屏接口文档
Resource                                ../App_Views/ViewsCommon.robot
Suite Setup                             Create Session Common
Suite Teardown                          Delete All Sessions
Force Tags                              冒烟集-新福建APP     Views获取开机屏
...                                     作者：江宝敏

*** Variables ***
${PALTFORM1}                            android
${PALTFORM2}                            ios
${DEVICE_SIZE}                          2340x1080
${CLIENT_VER1}                          2.1.5
${CLIENT_VER2}                          3.2.0
${RESULT}                               0


*** Test Cases ***
获取2.1.5版本开机屏信息，接口返回800*480成功
    Cover Pages                         ${PALTFORM1}                ${DEVICE_SIZE}          ${CLIENT_VER1}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    ${image}                            Get From Dictionary         ${response_data}        image
    Dictionary Should Contain Item      ${image}                    height                  800
    Dictionary Should Contain Item      ${image}                    width                   480

获取3.2.0版本2340x1080开机屏信息，接口返回720*988成功
    Cover Pages                         ${PALTFORM2}                ${DEVICE_SIZE}          ${CLIENT_VER2}
    ${errorcode}                        Get From Dictionary         ${response_result}      errorCode
    Should Be Equal As Strings          ${errorcode}                ${RESULT}
    ${image}                            Get From Dictionary         ${response_data}[0]     image
    Dictionary Should Contain Item      ${image}                    height                  988
