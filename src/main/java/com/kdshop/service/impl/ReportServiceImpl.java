package com.kdshop.service.impl;

import com.kdshop.mapper.ReportMapper;
import com.kdshop.pojo.Report;
import com.kdshop.service.ReportService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("reportService")
public class ReportServiceImpl implements ReportService{

    @Resource
    private ReportMapper reportMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return reportMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Report record) {
        return reportMapper.insert(record);
    }

    @Override
    public Report selectByPrimaryKey(Integer id) {
        return reportMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Report> selectAll() {
        return reportMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Report record) {
        return reportMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Report> selectReportByGoodsPrimaryKey(Integer gid) {
        return reportMapper.selectReportByGoodsPrimaryKey(gid);
    }
}
