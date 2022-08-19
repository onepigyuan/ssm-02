package com.ckm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ckm.pojo.Curriculum;
import com.ckm.service.RootCurriculumServiceImpl;
import com.ckm.service.StudentCurriculumServiceImpl;
import com.ckm.utils.Constants;

@Controller
public class StudentCurriculumController {

	@Autowired
	private StudentCurriculumServiceImpl studentCurriculumServiceImpl;
	@Autowired
	private RootCurriculumServiceImpl rootCurriculumServiceImpl;

	// 全部
	@ResponseBody
	@RequestMapping(value = "/studentCurriculumJson", produces = "text/html;charset=utf-8")
	public String studentCurriculumJson(String limit, String page) {

		List<Curriculum> curriculums = rootCurriculumServiceImpl.curriculums();
		System.out.println(curriculums);

		// 获取前端的分页参数 来展示数据
		List<Curriculum> select = rootCurriculumServiceImpl.findPage(Integer.parseInt(limit),
				Integer.parseInt(page));
		System.out.println(select);
		int size = curriculums.size();
		System.out.println(size);

		// 将数据转换成json格式 以便前端接收展示
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(select));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}
	
	
	// 是否选择该课程？
	@ResponseBody
	@RequestMapping(value = "/studentSelectedCurriculum", produces = "text/html;charset=utf-8")
	public String studentSelectedCurriculum(HttpSession session, Curriculum curriculum) {

		String student_id = (String) session.getAttribute(Constants.STUDENT_USERNAME);
		curriculum.setStudent_id(student_id);
		List<Curriculum> curriculums = studentCurriculumServiceImpl.if_select(curriculum.getCurriculum_name(),curriculum.getCurriculum_teacher_id(),student_id);
		int curriculumsSize = curriculums.size();
		if (curriculumsSize==0) {
			int insertCurriculum = studentCurriculumServiceImpl.insert_selected_curriculum(curriculum);
			System.out.println(insertCurriculum);
			return "1";
		}
		return "505";
	}
	

	// 已选
	@ResponseBody
	@RequestMapping(value = "/selectedCurriculumJson", produces = "text/html;charset=utf-8")
	public String selectedCurriculumJson(HttpSession session, String limit, String page) {

		String student_id = (String) session.getAttribute(Constants.STUDENT_USERNAME);
		List<Curriculum> curriculums = studentCurriculumServiceImpl.selected_curriculum(student_id);
		System.out.println(curriculums);

		// 获取前端的分页参数 来展示数据
		List<Curriculum> select = studentCurriculumServiceImpl.selected_curriculum_findPage(Integer.parseInt(limit),
				Integer.parseInt(page), student_id);
		System.out.println(select);
		int size = curriculums.size();
		System.out.println(size);

		// 将数据转换成json格式 以便前端接收展示
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(select));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}
	
	// 已修
	@ResponseBody
	@RequestMapping(value = "/completeCurriculumJson", produces = "text/html;charset=utf-8")
	public String completeCurriculumJson(HttpSession session, String limit, String page) {

		String student_id = (String) session.getAttribute(Constants.STUDENT_USERNAME);
		List<Curriculum> curriculums = studentCurriculumServiceImpl.complete_curriculum(student_id);
		System.out.println(curriculums);

		// 获取前端的分页参数 来展示数据
		List<Curriculum> select = studentCurriculumServiceImpl.complete_curriculum_findPage(Integer.parseInt(limit),
				Integer.parseInt(page), student_id);
		System.out.println(select);
		int size = curriculums.size();
		System.out.println(size);

		// 将数据转换成json格式 以便前端接收展示
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(select));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}
	
	
}
