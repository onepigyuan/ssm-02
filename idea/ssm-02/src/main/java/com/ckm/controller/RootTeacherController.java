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

	// 查询全部
	@ResponseBody
	@RequestMapping(value = "/teacherJson", produces = "text/html;charset=utf-8")
	public String studentAll(String limit, String page) {
		System.out.println("进入请求！");
		System.out.println(limit + " " + page);

		// 获取所有数据 以便得到size
		List<Teacher> selectAll = rootTeacherServiceImpl.select();
		System.out.println(selectAll);
		// 获取前端的分页参数 来展示数据
		List<Teacher> select = rootTeacherServiceImpl.findPage(Integer.parseInt(limit), Integer.parseInt(page));
		int size = selectAll.size();

		System.out.println(select);
		// 将数据转换成json格式 以便前端接收展示
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(select));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}

	
	// 模糊查询
		@ResponseBody
		@RequestMapping(value = "/teacher_select_filter", produces = "text/html;charset=utf-8")
		public String student_select_filter(String query) {
			String queryLike = '%' + query + '%';
			List<Teacher> students = rootTeacherServiceImpl.selectFilter(queryLike);
			System.out.println(students);
			// 将数据转换成json格式 以便前端接收展示
			JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(students));
			String jsonData = "{'code':0,'msg':'','count':" + students.size() + ",'data':" + jsonArray + "}";
			String jsonObject = JSON.parseObject(jsonData).toJSONString();
			return jsonObject;
		}

		// 增加
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

		// 更新
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

		// 删除
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
