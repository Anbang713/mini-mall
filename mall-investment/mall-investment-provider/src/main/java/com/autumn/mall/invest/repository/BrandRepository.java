/**
 * 版权所有 (C), 2019-2020, XXX有限公司
 * 项目名：com.autumn.mall.invest.repository
 * 文件名: BrandRepository
 * 日期: 2020/3/15 15:31
 * 说明:
 */
package com.autumn.mall.invest.repository;

import com.autumn.mall.commons.repository.BaseRepository;
import com.autumn.mall.invest.model.Brand;

import java.util.Optional;

/**
 * @author Anbang713
 * @create 2020/3/15
 */
public interface BrandRepository extends BaseRepository<Brand> {

    /**
     * 根据代码查找
     *
     * @param code
     * @return
     */
    Optional<Brand> findByCode(String code);
}