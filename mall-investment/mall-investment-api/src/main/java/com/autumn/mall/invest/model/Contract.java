/**
 * 版权所有 (C), 2019-2020, XXX有限公司
 * 项目名：com.autumn.mall.invest.model
 * 文件名: Contract
 * 日期: 2020/3/16 19:36
 * 说明:
 */
package com.autumn.mall.invest.model;

import com.autumn.mall.account.model.Subject;
import com.autumn.mall.commons.model.BizState;
import com.autumn.mall.commons.model.IsEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 合同
 *
 * @author Anbang713
 * @create 2020/3/16
 */
@Data
@Entity
@Table(name = "invest_contract")
@ApiModel(description = "合同")
public class Contract implements IsEntity {

    @Id
    @ApiModelProperty(value = "唯一标识", dataType = "String")
    private String uuid;

    @NotBlank
    @ApiModelProperty(value = "合同号，客户端的业务主键", dataType = "String", readOnly = true)
    private String serialNumber;

    @NotBlank
    @ApiModelProperty(value = "店招", dataType = "String")
    private String signboard;

    @NotNull
    @Enumerated(value = EnumType.STRING)
    @ApiModelProperty(value = "业务状态", dataType = "BizState")
    private BizState bizState;

    @NotBlank
    @ApiModelProperty(value = "项目id", dataType = "String")
    private String storeId;

    @NotBlank
    @ApiModelProperty(value = "商户id", dataType = "String")
    private String tenantId;

    @NotBlank
    @ApiModelProperty(value = "楼宇id", dataType = "String")
    private String buildingId;

    @NotBlank
    @ApiModelProperty(value = "楼层id", dataType = "String")
    private String floorId;

    @NotBlank
    @ApiModelProperty(value = "铺位id", dataType = "String")
    private String positionId;

    @NotBlank
    @ApiModelProperty(value = "品牌id", dataType = "String")
    private String brandId;

    @NotBlank
    @ApiModelProperty(value = "业态id", dataType = "String")
    private String biztypeId;

    @NotNull
    @ApiModelProperty(value = "起始日期", dataType = "Date")
    private Date beginDate;

    @NotNull
    @ApiModelProperty(value = "截止日期", dataType = "Date")
    private Date endDate;

    @NotNull
    @ApiModelProperty(value = "月租金", dataType = "BigDecimal")
    private BigDecimal monthRent;

    @NotBlank
    @ApiModelProperty(value = "科目id", dataType = "String")
    private String subjectId;

    @NotNull
    @ApiModelProperty(value = "税率", dataType = "BigDecimal")
    private BigDecimal taxRate;

    @NotNull
    @ApiModelProperty(value = "销售提成率", dataType = "BigDecimal")
    private BigDecimal salesRate;

    @Length(max = 1024, message = "说明最大长度不超过64")
    @ApiModelProperty(value = "说明", dataType = "String")
    private String remark;

    //-------------------------------------------------
    @Transient
    private Store store;
    @Transient
    private Building building;
    @Transient
    private Floor floor;
    @Transient
    private Tenant tenant;
    @Transient
    private Position position;
    @Transient
    private Brand brand;
    @Transient
    private BizType bizType;
    @Transient
    private Subject subject;
}