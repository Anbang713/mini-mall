/**
 * 版权所有 (C), 2019-2020, XXX有限公司
 * 项目名：com.autumn.mall.commons.exception
 * 文件名: MallExceptionCatch
 * 日期: 2020/3/14 16:38
 * 说明:
 */
package com.autumn.mall.commons.exception;

import cn.hutool.json.JSONUtil;
import com.autumn.mall.commons.response.CommonsResultCode;
import com.autumn.mall.commons.response.CustomResultCode;
import com.autumn.mall.commons.response.ResponseResult;
import com.autumn.mall.commons.response.ResultCode;
import com.google.common.collect.ImmutableMap;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 统一异常捕获类
 *
 * @author Anbang713
 * @create 2020/3/14
 */
@Slf4j
@RestControllerAdvice
public class MallExceptionCatch {

    //定义map，配置异常类型所对应的错误代码
    private static ImmutableMap<Class<? extends Throwable>, ResultCode> EXCEPTIONS;
    //定义map的builder对象，去构建ImmutableMap
    protected static ImmutableMap.Builder<Class<? extends Throwable>, ResultCode> builder = ImmutableMap.builder();

    /**
     * 捕获自定义异常
     *
     * @param exception
     * @return
     */
    @ExceptionHandler(MallException.class)
    public ResponseResult customException(MallException exception) {
        // 输出栈顶信息
        exception.printStackTrace();
        // 记录日志
        log.error("catch exception：{}", exception.getMessage());
        return new ResponseResult(exception.getResultCode());
    }

    /**
     * 捕获其它异常
     *
     * @param exception
     * @return
     */
    @ExceptionHandler(Exception.class)
    public ResponseResult exception(Exception exception) {
        exception.printStackTrace();
        //记录日志
        log.error("捕获到异常信息：{}", exception.getMessage());
        if (EXCEPTIONS == null) {
            EXCEPTIONS = builder.build();//EXCEPTIONS构建成功
        }
        //从EXCEPTIONS中找异常类型所对应的错误代码，如果找到了将错误代码响应给用户，如果找不到给用户响应99999异常
        ResultCode resultCode = EXCEPTIONS.get(exception.getClass());
        if (resultCode != null) {
            return new ResponseResult(resultCode);
        } else if (exception instanceof MethodArgumentNotValidException) {
            String errors = getErrorMsgIfMethodArgumentNotValidException((MethodArgumentNotValidException) exception);
            return new ResponseResult(new CustomResultCode(false, "-1", errors));
        } else {
            //返回99999异常
            return new ResponseResult(CommonsResultCode.SERVER_ERROR);
        }
    }

    private String getErrorMsgIfMethodArgumentNotValidException(MethodArgumentNotValidException exception) {
        Iterator iterator = exception.getBindingResult().getAllErrors().iterator();
        List<String> errors = new ArrayList<>();
        while (iterator.hasNext()) {
            ObjectError error = (ObjectError) iterator.next();
            errors.add(error.getDefaultMessage());
        }
        return JSONUtil.toJsonStr(errors);
    }

    static {
        //定义异常类型所对应的错误代码
        builder.put(HttpMessageNotReadableException.class, CommonsResultCode.INVALID_PARAM);
    }
}