/**
 * 版权所有 (C), 2019-2020, XXX有限公司
 * 楼宇名：com.autumn.mall.invest.controller
 * 文件名: BuildingController
 * 日期: 2020/3/15 13:22
 * 说明:
 */
package com.autumn.mall.invest.controller;

import com.autumn.mall.basis.client.OperationLogClient;
import com.autumn.mall.commons.model.QueryDefinition;
import com.autumn.mall.commons.response.CommonsResultCode;
import com.autumn.mall.commons.response.QueryResult;
import com.autumn.mall.commons.response.ResponseResult;
import com.autumn.mall.invest.client.BuildingApi;
import com.autumn.mall.invest.model.Building;
import com.autumn.mall.invest.service.BuildingService;
import com.autumn.mall.invest.service.StoreService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 楼宇控制器
 *
 * @author Anbang713
 * @create 2020/3/15
 */
@Api(value = "楼宇管理")
@RestController
@RequestMapping("/building")
public class BuildingController implements BuildingApi {

    @Autowired
    private BuildingService buildingService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private OperationLogClient operationLogClient;

    @PostMapping
    @ApiOperation(value = "新增或编辑楼宇", httpMethod = "POST")
    @ApiImplicitParam(name = "entity", value = "楼宇实体类", required = true, dataType = "Building")
    public ResponseResult<String> save(@Valid @RequestBody Building entity) {
        return new ResponseResult(CommonsResultCode.SUCCESS, buildingService.save(entity));
    }

    @Override
    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取实体对象", httpMethod = "GET")
    @ApiImplicitParam(name = "id", value = "楼宇id", required = true, dataType = "String", paramType = "path")
    public ResponseResult<Building> findById(@PathVariable("id") String id) {
        Building entity = buildingService.findById(id);
        entity.getOperationLogs().addAll(operationLogClient.findAllByEntityKey(buildingService.getCacheKeyPrefix() + id).getData());
        entity.setStore(storeService.findById(entity.getStoreId()));
        return new ResponseResult(CommonsResultCode.SUCCESS, entity);
    }

    @Override
    @PostMapping("/query")
    @ApiOperation(value = "根据查询定义查询楼宇", httpMethod = "POST")
    @ApiImplicitParam(name = "definition", value = "查询定义", required = true, dataType = "QueryDefinition")
    public ResponseResult<QueryResult<Building>> query(@RequestBody QueryDefinition definition) {
        return new ResponseResult(CommonsResultCode.SUCCESS, buildingService.query(definition));
    }
}