/**
 * 版权所有 (C), 2019-2020, XXX有限公司
 * 项目名：com.autumn.mall.invest.service
 * 文件名: BuildingService
 * 日期: 2020/3/15 13:12
 * 说明:
 */
package com.autumn.mall.invest.service;

import com.autumn.mall.commons.model.UsingState;
import com.autumn.mall.commons.service.CacheService;
import com.autumn.mall.commons.service.CrudService;
import com.autumn.mall.commons.service.SupportStateService;
import com.autumn.mall.invest.model.Building;

/**
 * 楼宇业务层接口
 *
 * @author Anbang713
 * @create 2020/3/15
 */
public interface BuildingService extends CrudService<Building>, CacheService, SupportStateService<UsingState> {

}