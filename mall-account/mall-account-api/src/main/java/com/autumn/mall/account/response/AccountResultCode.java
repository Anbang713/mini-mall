/**
 * 版权所有 (C), 2019-2020, XXX有限公司
 * 项目名：com.autumn.mall.account.response
 * 文件名: AccountResultCode
 * 日期: 2020/3/15 19:29
 * 说明:
 */
package com.autumn.mall.account.response;

import com.autumn.mall.commons.response.ResultCode;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

/**
 * 账务微服务的响应操作码<p>
 * 该微服务下所有的操作码都以：3xxxx开头。
 *
 * @author Anbang713
 * @create 2020/3/15
 */
@Getter
@ToString
@AllArgsConstructor
public enum AccountResultCode implements ResultCode {

    CODE_IS_EXISTS(false, "30001", "代码已存在，禁止操作！"),
    CODE_IS_NOT_ALLOW_MODIFY(false, "30002", "代码不允许修改！"),
    ENTITY_IS_DISABLED(false, "30003", "已停用状态的资料，不允许修改！"),
    ENTITY_IS_EQUALS_TARGET_STATE(false, "30004", "资料已经是目标状态，禁止重复操作！");

    private boolean success;
    private String code;
    private String message;
}