package com.ckm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ckm.pojo.Teacher;
import com.ckm.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ckm.pojo.Curriculum;
import com.ckm.service.TeacherCurriculumServiceImpl;

@Controller
public class TeacherCurriculumController {
	@Autowired
	private TeacherCurriculumServiceImpl teacherCurriculumServiceImpl;

	// 查询全部
	@ResponseBody
	@RequestMapping(value = "/myCurriculumJson", produces = "text/html;charset=utf-8")
	public String studentAll(HttpSession session, String limit, String page) {
		String teacherId = (String) session.getAttribute(Constants.TEACHER_USERNAME);
		System.out.println("进入 我的课程");
		// 获取所有数据 以便得到size

		List<Curriculum> curriculums = teacherCurriculumServiceImpl.my_curriculum(teacherId);
		System.out.println(curriculums);

		// 获取前端的分页参数 来展示数据
		List<Curriculum> select = teacherCurriculumServiceImpl.my_curriculum_findPage(Integer.parseInt(limit),
				Integer.parseInt(page), teacherId);
		int size = curriculums.size();
		System.out.println(size);

		// 将数据转换成json格式 以便前端接收展示
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(select));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}
	

	// 查询点击课程
	@ResponseBody
	@GetMapping(value = "/select_student_success", produces = "text/html;charset=utf-8")
	public String select_student_success(String limit, String page, String curriculum_teacher_id,
			String curriculum_name) {
		System.out.println(curriculum_teacher_id + " " + curriculum_name);

		// 获取所有数据 以便得到size
		List<Curriculum> curriculum = teacherCurriculumServiceImpl.select_success(curriculum_teacher_id,curriculum_name);
		// 获取前端的分页参数 来展示数据
//            curriculum = teacherService.select_findPage_success(Integer.parseInt(pageLimit),Integer.parseInt(pageSize),curriculum_teacher_id,curriculum_name);
		int size = curriculum.size();
		// 将数据转换成json格式 以便前端接收展示
		String jsonArray = JSONArray.parseArray(JSON.toJSONString(curriculum)).toString();
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		System.out.println("数据！！："+jsonObject);
		return jsonArray;
	}


	// 打分
	@ResponseBody
	@PostMapping (value = "/select_student_success", produces = "text/html;charset=utf-8")
	public String select_student_success(String id,String curriculum_name,String curriculum_teacher_id,
										 String curriculum_date,String curriculum_place,String curriculum_week,
										 String curriculum_type,String curriculum_credit,String curriculum_student_success,
										 String curriculum_student_id) {

		//将参数封装到实体类
		Curriculum curriculum = new Curriculum(Integer.parseInt(id),curriculum_name,curriculum_teacher_id,curriculum_date,curriculum_place,curriculum_week,curriculum_type,curriculum_credit,curriculum_student_id,curriculum_student_success);

		int i = teacherCurriculumServiceImpl.success_update(curriculum);
		if (i==1){
			return "1";
		}
		return "404";
	}
}
