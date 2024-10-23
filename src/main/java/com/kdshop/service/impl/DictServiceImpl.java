package com.kdshop.service.impl;

import com.kdshop.mapper.DictMapper;
import com.kdshop.pojo.Area;
import com.kdshop.pojo.City;
import com.kdshop.pojo.Province;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("dictService")
public class DictServiceImpl implements com.kdshop.service.DictService {

	@Resource
	private DictMapper dictMapper;

	@Override
	public List<Province> getProvinces() {
		return dictMapper.getProvinces();
	}
	@Override
	public List<City> getCities(String provinceCode) {
		return dictMapper.getCities(provinceCode);
	}
	@Override
	public List<Area> getAreas(String cityCode) {
		return dictMapper.getAreas(cityCode);
	}

}
