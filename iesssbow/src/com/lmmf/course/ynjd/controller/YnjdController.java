package com.lmmf.course.ynjd.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lmmf.course.entity.Ynjd;
import com.lmmf.course.ynjd.service.YnjdServiceImpl;
import com.lmmf.framework.Page;

@Controller
@RequestMapping("ynjd")
public class YnjdController {
	@Resource
	private YnjdServiceImpl ynjdServiceImpl;
	
	@RequestMapping(value="index")
	public String index(@RequestParam(name="pageNum",defaultValue="1")int pageNum,
			@RequestParam(name="searchParam",defaultValue="")String searchParam,
			HttpServletRequest request,
			Model model){
		Page<Ynjd> page;
		if(searchParam==null||"".equals(searchParam)){
			page=this.ynjdServiceImpl.listYnjd(pageNum,10,null,"常见");
		}else{
			page=this.ynjdServiceImpl.listYnjd(pageNum,10,new Object[]{searchParam},"常见");
		}
		request.setAttribute("page",page);
		request.setAttribute("searchParam",searchParam);
		return "questionindex";
	}
	
	
	@RequestMapping(value="add",method = RequestMethod.POST)
	public String add(Ynjd ynjd,HttpServletRequest request){
		try {
			ynjd.setAnswer(new String(ynjd.getAnswer().getBytes("iso-8859-1"),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			ynjd.setAnswerURL(new String(ynjd.getAnswerURL().getBytes("iso-8859-1"),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			ynjd.setQuestion(new String(ynjd.getQuestion().getBytes("iso-8859-1"),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			ynjd.setLeiXing(new String(ynjd.getLeiXing().getBytes("iso-8859-1"),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		this.ynjdServiceImpl.addYnjd(ynjd);
		return "forward:list";
	}
	@RequestMapping(value = "edit",method = RequestMethod.GET)
	public String toEdit(@RequestParam("id_YN") int id_YN,HttpServletRequest request){
		Ynjd ynjd = this.ynjdServiceImpl.getYnjd(id_YN);
		HttpSession session = request.getSession();
		session.setAttribute("ynjd03",ynjd);
		session.setAttribute("action", "edit");
		return "formsYN";
	}
	@RequestMapping(value="edit",method = RequestMethod.POST)
	public String edit(Ynjd ynjd,HttpServletRequest request){
		try {
			String question =ynjd.getQuestion();
			question = new String(question.getBytes("iso-8859-1"),"utf-8");
			ynjd.setQuestion(question);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}		
		try {
			String answer =ynjd.getAnswer();
			answer = new String(answer.getBytes("iso-8859-1"),"utf-8");
			ynjd.setAnswer(answer);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}		
		try {
			String answerURL =ynjd.getAnswerURL();
			answerURL = new String(answerURL.getBytes("iso-8859-1"),"utf-8");
			ynjd.setAnswerURL(answerURL);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		try {
			String leiXing =ynjd.getLeiXing();
			leiXing = new String(leiXing.getBytes("iso-8859-1"),"utf-8");
			ynjd.setLeiXing(leiXing);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		HttpSession session = request.getSession();
		Ynjd ynjd03 = (Ynjd)session.getAttribute("ynjd03");
		ynjd.setId_YN(ynjd03.getId_YN());
		this.ynjdServiceImpl.editYnjd(ynjd);
		return "forward:list";
	}
	@RequestMapping(value ="delete")
	public String delete(
			@RequestParam("id_YN") int id_YN,
			@RequestParam("leiXing") String leiXing,
			HttpServletRequest request){
		 	System.out.println("delete");
			this.ynjdServiceImpl.dropYnjd(id_YN);
			return "forward:list";
	}
	
	@RequestMapping(value="list")
	public String list(@RequestParam(name="pageNum",defaultValue="1")int pageNum,
			@RequestParam(name="searchParam",defaultValue="")String searchParam,
			@RequestParam(name="leiXing")String leiXing,
			HttpServletRequest request,
			Model model){
		Page<Ynjd> page;
		try {
		leiXing = new String(leiXing.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
		e1.printStackTrace();
		}
		if(searchParam==null||"".equals(searchParam)){
			page=this.ynjdServiceImpl.listYnjd(pageNum,10,null,leiXing);
		}else{
			page=this.ynjdServiceImpl.listYnjd(pageNum,10,new Object[]{searchParam},leiXing);
		}			
		request.setAttribute("leiXing", leiXing);
		request.setAttribute("page",page);
		request.setAttribute("searchParam",searchParam);
		return "tableYN";
	}
	
	
	
	@RequestMapping(value="list_qt")
	public String list_qt(@RequestParam(name="pageNum",defaultValue="1")int pageNum,
			@RequestParam(name="searchParam",defaultValue="")String searchParam,
			HttpServletRequest request,
			Model model){
		Page<Ynjd> page;
		String leiXing = (String)request.getAttribute("leiXing");
		try {
		leiXing = new String(leiXing.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
		e1.printStackTrace();
		}
		if(searchParam==null||"".equals(searchParam)){
			page=this.ynjdServiceImpl.listYnjd(pageNum,10,null,leiXing);
		}else{
			page=this.ynjdServiceImpl.listYnjd(pageNum,10,new Object[]{searchParam},leiXing);
		}			
		request.setAttribute("leiXing", leiXing);
		request.setAttribute("page",page);
		request.setAttribute("searchParam",searchParam);
		return "questionlist";
	}
}
