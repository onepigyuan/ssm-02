package com.ckm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ckm.pojo.Curriculum;
import com.ckm.service.TeacherCurriculumServiceImpl;
import com.ckm.utils.Constants;

@Controller
public class TeacherCurriculumController {
	@Autowired
	private TeacherCurriculumServiceImpl teacherCurriculumServiceImpl;

	// ��ѯȫ��
	@ResponseBody
	@RequestMapping(value = "/myCurriculumJson", produces = "text/html;charset=utf-8")
	public String studentAll(HttpSession session, String limit, String page) {
		String teacherId = (String) session.getAttribute(Constants.TEACHER_USERNAME);
		System.out.println("���� �ҵĿγ�");
		// ��ȡ�������� �Ա�õ�size

		List<Curriculum> curriculums = teacherCurriculumServiceImpl.my_curriculum(teacherId);
		System.out.println(curriculums);

		// ��ȡǰ�˵ķ�ҳ���� ��չʾ����
		List<Curriculum> select = teacherCurriculumServiceImpl.my_curriculum_findPage(Integer.parseInt(limit),
				Integer.parseInt(page), teacherId);
		int size = curriculums.size();
		System.out.println(size);

		// ������ת����json��ʽ �Ա�ǰ�˽���չʾ
		JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(select));
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		return jsonObject;
	}
	

	// ��ѯ����γ�
	@ResponseBody
	@GetMapping(value = "/select_student_success", produces = "text/html;charset=utf-8")
	public String select_student_success(String limit, String page, String curriculum_teacher_id,
			String curriculum_name) {
		System.out.println(curriculum_teacher_id + " " + curriculum_name);

		// ��ȡ�������� �Ա�õ�size
		List<Curriculum> curriculum = teacherCurriculumServiceImpl.select_success(curriculum_teacher_id,curriculum_name);
		// ��ȡǰ�˵ķ�ҳ���� ��չʾ����
//            curriculum = teacherService.select_findPage_success(Integer.parseInt(pageLimit),Integer.parseInt(pageSize),curriculum_teacher_id,curriculum_name);
		int size = curriculum.size();

		// ������ת����json��ʽ �Ա�ǰ�˽���չʾ
		String jsonArray = JSONArray.parseArray(JSON.toJSONString(curriculum)).toString();
		String jsonData = "{'code':0,'msg':'','count':" + size + ",'data':" + jsonArray + "}";
		String jsonObject = JSON.parseObject(jsonData).toJSONString();
		System.out.println("���ݣ�����"+jsonObject);
		return jsonArray;
	}

}
