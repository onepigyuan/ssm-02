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

	// ��ѯȫ��
	@ResponseBody
	@RequestMapping(value = "/studentAll", produces = "text/html;charset=utf-8")
	public String studentAll(String limit, String page) {

		// ��ȡ�������� �Ա�õ�size
		List<Student> selectAll = studentServiceImpl.select();
		// ��ȡǰ�˵ķ�ҳ���� ��չʾ����
		List<Student> select = studentServiceImpl.findPage(Integer.parseInt(limit), Integer.parseInt(page));
		int size = selectAll.size();

		// ������ת����json��ʽ �Ա�ǰ�˽���չʾ
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(select));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}

	// ģ����ѯ
	@ResponseBody
	@RequestMapping(value = "/student_select_filter", produces = "text/html;charset=utf-8")
	public String student_select_filter(String query) {
		String queryLike = '%' + query + '%';
		List<Student> students = studentServiceImpl.selectFilter(queryLike);
		System.out.println(students);
		// ������ת����json��ʽ �Ա�ǰ�˽���չʾ
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(students));
		String jsonData = "{'code':0,'msg':'','count':" + students.size() + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}

	// ����
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

	// ����
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

	// ɾ��
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
