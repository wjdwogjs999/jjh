package info.controller;

import info.bean.InfoDTO;
import info.bean.InfoPaging;
import info.service.InfoService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import category.bean.Category;
import category.service.CategoryService;

@RequestMapping("/info")
public class InfoController {
	@Autowired
	private CategoryService categoryService;;
	@Autowired
	private InfoService infoService;
	@Autowired
	private InfoPaging infoPaing;
	
	private List<Category> getMenu(){
		List<Category> list = categoryService.mainCategoryListGet();
		return list;
	}
	
	@RequestMapping("/infoList")
	public ModelAndView infoList(@RequestParam int pg){
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/info/infoList.jsp");
		mav.addObject("pg", pg);
		mav.addObject("tot", infoService.totGet());
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/infoListGet")
	public @ResponseBody void infoListGet(HttpServletResponse response,int startParam,int limitParam){
		System.out.println(startParam+" , "+limitParam);
		InfoDTO info = new InfoDTO();
		info.setStartIndex(startParam);
		info.setEndIndex(limitParam);
		List<InfoDTO> infoList = infoService.infoListGet(info);
		JSONArray jsonArr = makeInfoList(infoList);
		System.out.println(jsonArr.toString());
		response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(jsonArr.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/infoWriteForm")
	public ModelAndView infoWriteForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/info/infoWriteForm");
		return mav;
	}
	
	@RequestMapping("/infoWrite")
	public ModelAndView infoWrite(@ModelAttribute InfoDTO infoDTO){
		infoService.infoInsert(infoDTO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/info/infoWriteOk");
		return mav;
	}
	
	@RequestMapping("/infoView")
	public ModelAndView infoView(@RequestParam int pg, @RequestParam int infoCode){
		InfoDTO info = new InfoDTO();
		info.setInfoCode(infoCode);
		info = infoService.infoGet(info);
		infoService.hitUpdate(info);
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/info/infoView.jsp");
		mav.addObject("info", info);
		mav.addObject("pg", pg);
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/infoModifyForm")
	public ModelAndView infoModifyForm(@RequestParam int infoCode){
		InfoDTO info = new InfoDTO();
		info.setInfoCode(infoCode);
		info = infoService.infoGet(info);
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", info);
		mav.setViewName("/info/infoModifyForm");
		return mav;
	}
	
	@RequestMapping("/infoModify")
	public ModelAndView infoModify(@ModelAttribute InfoDTO info){
		//info.setInfoCode(infoCode);
		infoService.infoUpdate(info);
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/info/infoModifyOk.jsp");
		mav.setViewName("/main/index");
		return mav;
	}

	@RequestMapping("/infoDelete")
	public ModelAndView infoDelete(@RequestParam int infoCode, @RequestParam int pg){
		//info.setInfoCode(infoCode);
		InfoDTO info = new InfoDTO();
		info.setInfoCode(infoCode);
		infoService.infoDelete(info);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/info/infoList.do?pg="+pg);
		return mav;
	}
	
	public JSONArray makeInfoList(List<InfoDTO> list){
		JSONArray jsonArr = new JSONArray();
		for(int i=0;i<list.size();i++){
			JSONArray arr = new JSONArray();
			Map<String, String> map = new HashMap<String, String>();
			map.put("infoCode", list.get(i).getInfoCode()+"");
			map.put("infoSubject", list.get(i).getInfoSubject());
			map.put("infoContent", list.get(i).getInfoContent());
			map.put("logtime", list.get(i).getLogtime().toString());
			map.put("hit", list.get(i).getHit()+"");
			jsonArr.add(map);
		}
		return jsonArr;
	}
}
