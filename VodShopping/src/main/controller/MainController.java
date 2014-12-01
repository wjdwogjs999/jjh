package main.controller;

import info.bean.InfoDTO;
import info.service.InfoService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import main.bean.IndexTestDTO;
import main.bean.OrderListGetByYear;
import member.service.MemberService;
import order.bean.OrderDTO;
import order.service.OrderService;

import org.hibernate.criterion.IlikeExpression;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import category.bean.Category;
import category.service.CategoryService;

import com.google.gson.Gson;

import content.bean.ContentDTO;
import content.service.ContentService;

@RequestMapping("/main")
public class MainController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private InfoService infoService;
	@Autowired
	private ContentService contentService;
	@Autowired
	private OrderService orderService;
	
	private List<Category> getMenu(){
		List<Category> list = categoryService.mainCategoryListGet();
		return list;
	}
	@RequestMapping("/index")
	public ModelAndView index(){
		List<InfoDTO> infoList=infoService.newInfoListGet();
		List<ContentDTO> bestContentList = contentService.bestContentGet();
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/main/main.jsp");
		mav.addObject("info", infoList);
		mav.addObject("bestList", bestContentList);
		mav.setViewName("/main/index");	
		return mav;
	}
	
	@RequestMapping("/loginForm")
	public ModelAndView loginForm(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/member/loginForm.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/search")
	public ModelAndView search(String sword){
		ContentDTO content = new ContentDTO();
		content.setSword(sword);
		content.setSearchType("all");
		List<ContentDTO> list=contentService.contentSearchListGet(content);
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/main/searchList.jsp");
		mav.addObject("contentList", list);
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/category")
	public ModelAndView category(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/main/category.jsp");
		mav.setViewName("/main/index");	
		return mav;
	}
	
	@RequestMapping("/categoryAdd")
	public @ResponseBody String categoryAdd(String category_name, HttpServletResponse response){
		Category category=new Category();
		category.setCategory_name(category_name);
		categoryService.categoryInsert(category);
		List<Category> list = categoryService.mainCategoryListGet();
		Gson gson = new Gson();
        String json = gson.toJson(list);
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/categoryEdit")
	public @ResponseBody String categoryEdit(@RequestParam String category_name,@RequestParam int category_seq, HttpServletResponse response){
		categoryService.categoryUpdate(category_seq,category_name);
		List<Category> list = categoryService.mainCategoryListGet();
		Gson gson = new Gson();
        String json = gson.toJson(list);
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/categoryDelete")
	public @ResponseBody String categoryDelete(@RequestParam int category_seq, HttpServletResponse response){
		Category category=categoryService.CategoryGet(category_seq);
		if(category.getCategory_son()>0) //자식이 존재하는 카테고리 삭제시 자식들도 같이삭제...
			categoryService.sonDelete(category_seq);
		categoryService.categoryDelete(category_seq);
		List<Category> list = categoryService.mainCategoryListGet();
		Gson gson = new Gson();
        String json = gson.toJson(list);
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/subCategoryAdd")
	public @ResponseBody String subCategoryAdd(@RequestParam int pseq, @RequestParam String category_name,HttpServletResponse response){
		System.out.println(pseq);
		Category pCategory = categoryService.CategoryGet(pseq);
		Category category=new Category();
		category.setCategory_name(category_name);
		category.setCategory_group(pCategory.getCategory_seq());
		category.setCategory_level(pCategory.getCategory_level()+1);
		categoryService.categoryStateUpdate(pseq, pCategory.getCategory_son()+1);
		categoryService.categoryInsert(category);
		
		List<Category> list = categoryService.subCategoryListGet(pseq);
		Gson gson = new Gson();
        String json = gson.toJson(list);
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/subCategoryGet")
	public @ResponseBody String subCategoryGet(@RequestParam int seq, HttpServletResponse response){
		List<Category> list = categoryService.subCategoryListGet(seq);
		Gson gson = new Gson();
        String json = gson.toJson(list);
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/contentWriteForm")
	public ModelAndView contentWriteForm(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/content/contentWriteForm.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/checkRelationSerch")
	public @ResponseBody String checkRelationSerch(String sword, HttpServletResponse response){
		ContentDTO content = new ContentDTO();
		content.setSword(sword);
		content.setSearchType("subject");
		content.setEndIndex(10);
		List<ContentDTO> list=contentService.contentSearchListGet(content);
		Gson gson = new Gson();
        String json = gson.toJson(list);
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
	}
	
	
	@RequestMapping("/memberAdmin")
	public ModelAndView memberAdmin(@RequestParam int pg){
		HashMap map = memberService.memberPagingGet(pg);
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/memberAdmin.jsp");
		mav.addObject("memberList", (List)map.get("memberList"));
		mav.addObject("categoryList", getMenu());
		mav.addObject("paging", (String)map.get("paging"));
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/contentAdmin")
	public ModelAndView contentAdmin(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/contentAdmin.jsp");
		mav.addObject("categoryList", getMenu());
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/salesGraph")
	public ModelAndView salesGraph(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/graph/salesGraph.jsp");
		mav.addObject("categoryList", getMenu());
		mav.setViewName("/main/index");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/monthlySalesListGet")
	public @ResponseBody void monthlySalesListGet(HttpServletResponse response){
		int currentYear =Calendar.getInstance().get(Calendar.YEAR);
		Long[] monthlySales1 = OrderListGetByYear.orderListGetByYear(orderService.orderListGetByYear(currentYear-1));
		Long[] monthlySales2 = OrderListGetByYear.orderListGetByYear(orderService.orderListGetByYear(currentYear));
		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("obj1", monthlySales1);
		obj.put("obj2", monthlySales2);
		arr.add(obj);
		JSONObject finalObj = new JSONObject();
		finalObj.put("finalValue", arr);
		Gson gson = new Gson();
		String monthlysalesJson = gson.toJson(finalObj);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(monthlysalesJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/buyCountByGeneration")
	public @ResponseBody void buyCountByGeneration(HttpServletResponse response){
		int currentYear =Calendar.getInstance().get(Calendar.YEAR);
		Float[] list = orderService.generationGet(currentYear);
		Gson gson = new Gson();
		String buyCountByGeneration = gson.toJson(list);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(buyCountByGeneration);
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
			
}

