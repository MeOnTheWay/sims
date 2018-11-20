package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.QuerySignGenerateInfoParam;
import com.eva.classsystem.pojo.SimsSignGenerateInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SimsSignGenerateInfoMapper {
    int deleteByPrimaryKey(String signgenid);

    int insert(SimsSignGenerateInfo record);

    int insertSelective(SimsSignGenerateInfo record);

    SimsSignGenerateInfo selectByPrimaryKey(String signgenid);

    int updateByPrimaryKeySelective(SimsSignGenerateInfo record);

    int updateByPrimaryKeyWithBLOBs(SimsSignGenerateInfo record);

    int updateByPrimaryKey(SimsSignGenerateInfo record);

    void deleteSignGenerateInfoByStatuslishi(@Param("SIGNSTATUS") String SIGNSTATUS, @Param("COURSECODE") String COURSECODE, @Param("SIGNDATE") String SIGNDATE);

    void addSign(@Param("COURSECODE") String COURSECODE, @Param("SIGNTYPE") String SIGNTYPE, @Param("SIGNDATE") String SIGNDATE, @Param("SIGNCODE") String SIGNCODE, @Param("SIGNADDRESS") String SIGNADDRESS, @Param("SIGNSTATUS") String SIGNSTATUS, @Param("BEGINTIME") String BEGINTIME, @Param("VALIDTIME") String VALIDTIME, @Param("INPUTTIME") String INPUTTIME);

    void updateSignGenerateInfoStatus(@Param("SIGNSTATUS") String SIGNSTATUS, @Param("COURSECODE") String COURSECODE, @Param("SIGNDATE") String SIGNDATE);

    void deleteSignGenerateInfoByStatus(@Param("SIGNSTATUS") String SIGNSTATUS, @Param("COURSECODE") String COURSECODE);

    List<SimsSignGenerateInfo> selectIfSignGenrateInfo(QuerySignGenerateInfoParam querySignGenerateInfoParam);

    SimsSignGenerateInfo selectQianDaoBiaoByCode(@Param("coursecode") String coursecode);


}