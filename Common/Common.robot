*** Settings ***
Documentation                           该文档是新福建旧客户端接口关键字文档
Library                                 RequestsLibrary
Library                                 Collections
Library                                 String


*** Variables ***
#外网接口地址
${APP_URL}                               http://api.fjdaily.com
#${APP_URL}                               http://test1.mtrh.com.cn/fjrb

#alias
${API_ALIAS}                            api

*** Keywords ***
Create Session Common
    create session                      ${API_ALIAS}        ${APP_URL}

