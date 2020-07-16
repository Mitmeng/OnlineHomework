package com.meng.onlinehomework.Service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meng.onlinehomework.Service.StuHomeworklistService;
import com.meng.onlinehomework.dao.StuhomeworklistMapper;
import com.meng.onlinehomework.pojo.Stuhomeworklist;

@Service
@Transactional
public class StuHomeworklistServiceImpl implements StuHomeworklistService {

	@Autowired
	private StuhomeworklistMapper stuhomeworklistMapper;
	
	@Override
	public void addstuHomeworklist(Stuhomeworklist stuhomeworklist) {
		// TODO Auto-generated method stub
		stuhomeworklistMapper.insert(stuhomeworklist);
	}

	@Override
	public void deleByStuid(String stuid) {
		// TODO Auto-generated method stub
		stuhomeworklistMapper.deleteByStuid(stuid);
	}

}
