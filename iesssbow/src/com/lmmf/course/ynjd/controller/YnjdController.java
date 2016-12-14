package com.lmmf.course.ynjd.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	/**
	 * 此方法用于前台新闻展示
	 */

	@RequestMapping(value="add",method = RequestMethod.POST)
	public String add(Ynjd ynjd){
//		try {
//			ynjd.setBiaoTi(new String(ynjd.getBiaoTi().getBytes("iso-8859-1"),"utf-8"));
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		this.ynjdServiceImpl.addYnjd(ynjd);
		return "formXWgg";
	}

	@RequestMapping(value = "edit",method = RequestMethod.GET)
	public String toEdit(@RequestParam("id_YN") int id_YN,HttpServletRequest request){
		Ynjd ynjd = this.ynjdServiceImpl.getYnjd(id_YN);
		HttpSession session = request.getSession();
		session.setAttribute("ynjd03",ynjd);
		session.setAttribute("action", "edit");
		return "formsXW";
	}
	
	@RequestMapping(value="edit",method = RequestMethod.POST)
	public String edit(Ynjd ynjd,HttpServletRequest request){
//		try {
//			String neiRongURL =ynjd.getNeiRongURL();
//			neiRongURL = new String(neiRongURL.getBytes("iso-8859-1"),"utf-8");
//			ynjd.setNeiRongURL(neiRongURL);
//		} catch (UnsupportedEncodingException e1) {
//			e1.printStackTrace();
//		}
		HttpSession session = request.getSession();
		Ynjd ynjd03 = (Ynjd)session.getAttribute("ynjd03");
		ynjd.setId_YN(ynjd03.getId_YN());
		this.ynjdServiceImpl.editYnjd(ynjd);
		return "formXW?action='edit'";
	}
	
	@RequestMapping(value ="delete_gg")
	public String delete_gg(
			@RequestParam("id_ynjd") int id_ynjd,
			HttpServletRequest request){
			this.ynjdServiceImpl.dropYnjd(id_ynjd);
			return "redirect:list_gg";
	}
	
	@RequestMapping(value="list")
	public String list_gg(@RequestParam(name="pageNum",defaultValue="1")int pageNum,
			@RequestParam(name="searchParam",defaultValue="")String searchParam,
			@RequestParam(name="count")String count,
			HttpServletRequest request,
			Model model){
		Page<Ynjd> page;
		try {
		count = new String(count.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
		e1.printStackTrace();
		}
		if(searchParam==null||"".equals(searchParam)){
			page=this.ynjdServiceImpl.listYnjd(pageNum,10,null,count);
		}else{
			page=this.ynjdServiceImpl.listYnjd(pageNum,10,new Object[]{searchParam},count);
		}			
		request.setAttribute("count", count);
		request.setAttribute("page",page);
		request.setAttribute("searchParam",searchParam);
		return "tableYN";
	}
}
