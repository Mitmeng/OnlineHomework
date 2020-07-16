package com.meng.onlinehomework.dao;

import com.meng.onlinehomework.pojo.Stuhomeworklist;

public interface StuhomeworklistMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Stuhomeworklist record);

    int insertSelective(Stuhomeworklist record);

    Stuhomeworklist selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Stuhomeworklist record);

    int updateByPrimaryKey(Stuhomeworklist record);

	void deleteByStuid(String stuid);
}