package com.ckm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ckm.pojo.Curriculum;
import com.ckm.service.RootCurriculumServiceImpl;

@Controller
public class RootCurriculumController {

	@Autowired
	private RootCurriculumServiceImpl curriculumServiceImpl;

	@ResponseBody
	@RequestMapping(value = "/curriculumJson", produces = "text/html;charset=utf-8")
	public String curriculumAll() {

		// 获取所有数据 以便得到size
		List<Curriculum> selectAll = curriculumServiceImpl.curriculums();
		// 获取前端的分页参数 来展示数据
//	    List<Student> select = studentServiceImpl.findPage(Integer.parseInt(limit),Integer.parseInt(page));
		int size = selectAll.size();

		// 将数据转换成json格式 以便前端接收展示
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(selectAll));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}

	// 删除
	@ResponseBody
	@RequestMapping(value = "/curriculumDelete", produces = "text/html;charset=utf-8")
	public String curriculumDelete(int id) {
		int deleteId = curriculumServiceImpl.delete(id);
		if (deleteId != 1) {
			return "404";
		}
		return "1";
	}

	// 更新
	@ResponseBody
	@RequestMapping(value = "/curriculumUpdate", produces = "text/html;charset=utf-8")
	public String curriculumUpdate(Curriculum curriculum) {
		int updateData = curriculumServiceImpl.update(curriculum);
		if (updateData != 1) {
			return "404";
		}
		return "1";
	}

	// 增加
	@ResponseBody
	@RequestMapping(value = "/curriculumInsert", produces = "text/html;charset=utf-8")
	public String curriculumInsert(Curriculum curriculum) {
		int insertData = curriculumServiceImpl.insert(curriculum);
		if (insertData != 1) {
			return "404";
		}
		return "1";
	}

	// like
	@ResponseBody
	@RequestMapping(value = "/curriculum_select_filter", produces = "text/html;charset=utf-8")
	public String curriculum_select_filter(String query) {
		System.out.println(query);
		String queryLike = '%' + query + '%';
		List<Curriculum> curriculums = curriculumServiceImpl.selectFilter(queryLike);
		System.out.println(curriculums);
		// 将数据转换成json格式 以便前端接收展示
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(curriculums));
		String jsonData = "{'code':0,'msg':'','count':" + curriculums.size() + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}

}
