package com.kdshop.service;

import com.kdshop.pojo.Area;
import com.kdshop.pojo.City;
import com.kdshop.pojo.Province;

import java.util.List;

public interface DictService {
	List<Province> getProvinces();
	List<City> getCities(String provinceCode);
	List<Area> getAreas(String cityCode);

}







