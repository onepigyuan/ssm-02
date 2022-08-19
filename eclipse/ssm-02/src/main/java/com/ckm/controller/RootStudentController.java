package com.ckm.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import com.ckm.pojo.Student;
import com.ckm.service.RootStudentServiceImpl;

@Controller
public class RootStudentController {

	@Autowired
	private RootStudentServiceImpl studentServiceImpl;

	// 查询全部
	@ResponseBody
	@RequestMapping(value = "/studentAll", produces = "text/html;charset=utf-8")
	public String studentAll(String limit, String page) {

		// 获取所有数据 以便得到size
		List<Student> selectAll = studentServiceImpl.select();
		// 获取前端的分页参数 来展示数据
		List<Student> select = studentServiceImpl.findPage(Integer.parseInt(limit), Integer.parseInt(page));
		int size = selectAll.size();

		// 将数据转换成json格式 以便前端接收展示
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(select));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}

	// 模糊查询
	@ResponseBody
	@RequestMapping(value = "/student_select_filter", produces = "text/html;charset=utf-8")
	public String student_select_filter(String query) {
		String queryLike = '%' + query + '%';
		List<Student> students = studentServiceImpl.selectFilter(queryLike);
		System.out.println(students);
		// 将数据转换成json格式 以便前端接收展示
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(students));
		String jsonData = "{'code':0,'msg':'','count':" + students.size() + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}

	// 增加
	@ResponseBody
	@RequestMapping(value = "/studentInsert", produces = "text/html;charset=utf-8")
	public String insert(Student student) {
		System.out.println("insert!!!");
		System.out.println(student.getStudent_college());
		int insertStudent = studentServiceImpl.insert(student);
		System.out.println(insertStudent);
		if (insertStudent != 1) {
			return "404";
		}
		return "1";
	}

	// 更新
	@ResponseBody
	@RequestMapping(value = "/studentUpdate", produces = "text/html;charset=utf-8")
	public String update(Student student) {
		System.out.println(student.getPassword());
		int insertStudent = studentServiceImpl.update(student);
		System.out.println(insertStudent);
		if (insertStudent != 1) {
			return "404";
		}
		return "1";
	}

	// 删除
	@ResponseBody
	@RequestMapping(value = "/studentDelete", produces = "text/html;charset=utf-8")
	public String delete(int id) {
		int insertStudent = studentServiceImpl.delete(id);
		System.out.println(insertStudent);
		if (insertStudent != 1) {
			return "404";
		}
		return "1";
	}
}
