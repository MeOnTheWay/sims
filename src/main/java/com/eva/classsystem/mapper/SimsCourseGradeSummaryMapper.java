package com.eva.classsystem.mapper;

import com.eva.classsystem.pojo.SimsCourseGradeSummary;
import com.eva.classsystem.pojo.SimsCourseGradeSummaryKey;

public interface SimsCourseGradeSummaryMapper {
    int deleteByPrimaryKey(SimsCourseGradeSummaryKey key);

    int insert(SimsCourseGradeSummary record);

    int insertSelective(SimsCourseGradeSummary record);

    SimsCourseGradeSummary selectByPrimaryKey(SimsCourseGradeSummaryKey key);

    int updateByPrimaryKeySelective(SimsCourseGradeSummary record);

    int updateByPrimaryKey(SimsCourseGradeSummary record);
}