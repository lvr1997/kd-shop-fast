package com.kdshop.mapper;

import com.kdshop.pojo.Area;
import com.kdshop.pojo.City;
import com.kdshop.pojo.Province;

import java.util.List;

public interface DictMapper {

	List<Province> getProvinces();
	List<City> getCities(String provinceCode);
	List<Area> getAreas(String cityCode);
	String  getProvinceByCode(String code);
	String  getCityByCode(String code);
	String  getAreaByCode(String code);
}









