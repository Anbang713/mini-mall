/**
 * 版权所有 (C), 2019-2020, XXX有限公司
 * 项目名：com.autumn.mall.invest.repository
 * 文件名: PositionRepository
 * 日期: 2020/3/15 15:00
 * 说明:
 */
package com.autumn.mall.invest.repository;

import com.autumn.mall.commons.repository.BaseRepository;
import com.autumn.mall.invest.model.Position;

import java.util.Optional;

/**
 * @author Anbang713
 * @create 2020/3/15
 */
public interface PositionRepository extends BaseRepository<Position> {

    Optional<Position> findByStoreUuidAndBuildingUuidAndFloorUuidAndCode(String storeUuid, String buildingUuid, String floorUuid, String code);
}