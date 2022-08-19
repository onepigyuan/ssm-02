package com.ckm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ckm.pojo.Teacher;
import com.ckm.service.RootTeacherServiceImpl;

@Controller
public class RootTeacherController {
	@Autowired
	private RootTeacherServiceImpl rootTeacherServiceImpl;

	// ��ѯȫ��
	@ResponseBody
	@RequestMapping(value = "/teacherJson", produces = "text/html;charset=utf-8")
	public String studentAll(String limit, String page) {
		System.out.println("��������");
		System.out.println(limit + " " + page);

		// ��ȡ�������� �Ա�õ�size
		List<Teacher> selectAll = rootTeacherServiceImpl.select();
		System.out.println(selectAll);
		// ��ȡǰ�˵ķ�ҳ���� ��չʾ����
		List<Teacher> select = rootTeacherServiceImpl.findPage(Integer.parseInt(limit), Integer.parseInt(page));
		int size = selectAll.size();

		System.out.println(select);
		// ������ת����json��ʽ �Ա�ǰ�˽���չʾ
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(select));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}

	
	// ģ����ѯ
		@ResponseBody
		@RequestMapping(value = "/teacher_select_filter", produces = "text/html;charset=utf-8")
		public String student_select_filter(String query) {
			String queryLike = '%' + query + '%';
			List<Teacher> students = rootTeacherServiceImpl.selectFilter(queryLike);
			System.out.println(students);
			// ������ת����json��ʽ �Ա�ǰ�˽���չʾ
			JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(students));
			String jsonData = "{'code':0,'msg':'','count':" + students.size() + ",'data':" + jsonArray + "}";
			String jsonObject = JSON.parseObject(jsonData).toJSONString();
			return jsonObject;
		}

		// ����
		@ResponseBody
		@RequestMapping(value = "/teacherInsert", produces = "text/html;charset=utf-8")
		public String insert(Teacher teacher) {
			System.out.println("insert!!!");
			int insertStudent = rootTeacherServiceImpl.insert(teacher);
			System.out.println(insertStudent);
			if (insertStudent != 1) {
				return "404";
			}
			return "1";
		}

		// ����
		@ResponseBody
		@RequestMapping(value = "/teacherUpdate", produces = "text/html;charset=utf-8")
		public String update(Teacher teacher) {
			int insertStudent = rootTeacherServiceImpl.update(teacher);
			System.out.println(insertStudent);
			if (insertStudent != 1) {
				return "404";
			}
			return "1";
		}

		// ɾ��
		@ResponseBody
		@RequestMapping(value = "/teacherDelete", produces = "text/html;charset=utf-8")
		public String delete(int id) {
			int insertStudent = rootTeacherServiceImpl.delete(id);
			System.out.println(insertStudent);
			if (insertStudent != 1) {
				return "404";
			}
			return "1";
		}
}
