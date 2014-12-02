package content.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import member.bean.MemberDTO;
import member.service.MemberService;
import order.bean.OrderDTO;
import order.bean.OrderItemDTO;
import order.service.OrderService;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import category.bean.Category;
import category.service.CategoryService;

import com.google.gson.Gson;

import content.bean.ContentDTO;
import content.bean.ContentPaging;
import content.service.ContentService;

@RequestMapping("/content")
public class ContentController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ContentService contentService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ContentPaging contentPaging;
	
	private List<Category> getMenu(){
		List<Category> list = categoryService.mainCategoryListGet();
		return list;
	}
	
	@RequestMapping("/contentList")
	public ModelAndView contentList(@RequestParam int category_seq, int pg){
		ModelAndView mav = new ModelAndView();
		List<Category> subCategoryList = categoryService.subCategoryListGet(category_seq);
		mav.addObject("categoryList", getMenu());
		mav.addObject("subCategoryList", subCategoryList);
		///////////////////////
		int startNum = pg*20-19;
		ContentDTO content = new ContentDTO();
		content.setStartIndex(startNum-1);
		content.setEndIndex(20);
		content.setCategory(category_seq+"");
		String paging = contentPaging.makePagingHTML(pg, 5, 20, contentService.contentCountGet(content),category_seq);	
		List<ContentDTO> contentList= contentService.contentListGet(content);
		mav.addObject("display", "/content/contentList.jsp");
		mav.addObject("list", contentList);
		mav.addObject("paging", paging);
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/subContentList")
	public ModelAndView subContentList(@RequestParam int category_seq, @RequestParam int subCategory_seq,@RequestParam int pg){
		ModelAndView mav = new ModelAndView();
		List<Category> subCategoryList = categoryService.subCategoryListGet(category_seq);
		mav.addObject("categoryList", getMenu());
		mav.addObject("subCategoryList", subCategoryList);
		int startNum = pg*20-19;
		ContentDTO content = new ContentDTO();
		content.setStartIndex(startNum-1);
		content.setEndIndex(20);
		content.setCategory(category_seq+"-"+subCategory_seq);
		String paging = contentPaging.makePagingHTML(pg, 5, 20, contentService.contentCountGet(content),category_seq,subCategory_seq);
		List<ContentDTO> contentList= contentService.contentListGet(content);
		mav.addObject("display", "/content/contentList.jsp");
		mav.addObject("list", contentList);
		mav.addObject("paging", paging);
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/contentView")
	public ModelAndView productview(@RequestParam int contentCode,HttpSession session){
		int overlap=0;
		MemberDTO member = (MemberDTO)session.getAttribute("user");
		List<OrderItemDTO> list= orderService.myOrderItemListGet(member);
		if(list!=null){
			for(int i=0;i<list.size();i++){
				if(list.get(i).getContent().getContentCode()==contentCode)
					overlap=1;
			}
		}
		ContentDTO content = contentService.contentGet(contentCode);
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", getMenu());
		mav.addObject("display", "/content/contentView.jsp");
		mav.addObject("overlap", overlap);
		mav.addObject("content", content);
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/contentInsert")
	public ModelAndView contentInsert(@RequestParam MultipartFile[] img,@ModelAttribute ContentDTO contentDto, 
			@RequestParam String mainCategory, @RequestParam String subCategory){
		//카테고리 합치기
		contentDto.setCategory(mainCategory+"-"+subCategory);
		//파일처리
		String filePath = "C:\\spring4_0_1\\workspace\\VodShopping\\WebContent\\storage";
		String fileName1 = img[0].getOriginalFilename();
		if(fileName1.length()!=0){
			File file1 = new File(filePath, fileName1);
			try {
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file1));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			contentDto.setContentImage(fileName1);
		}else{
			contentDto.setContentImage("");
		}
		
		String fileName2 = img[1].getOriginalFilename();
		if(fileName2.length()!=0){
			File file2 = new File(filePath, fileName2);
			try {
				FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file2));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			contentDto.setVod(fileName2);
		}else{
			contentDto.setVod("");
		}
		//파일처리 end
		
		if(!fileName1.equals("") && !fileName2.equals("")){
			//DB처리
			contentService.contentInsert(contentDto);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/content/contentWriteOK.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/videoStart")
	public ModelAndView videoStart(@RequestParam String vod, int contentCode,HttpSession session){
		float inheritTime =0;
		boolean aleadyViewed =false;
		MemberDTO member = (MemberDTO)session.getAttribute("user");
		List<OrderItemDTO> list= orderService.myOrderItemListGet(member);
		for(int i=0;i<list.size();i++){
			if(list.get(i).getContent().getContentCode()==contentCode){
				inheritTime = list.get(i).getInheritTime();
				if(inheritTime>0)
					aleadyViewed=true;
			}
		}
		System.out.println(inheritTime);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vod", vod);
		mav.addObject("aleadyViewed", aleadyViewed);
		mav.addObject("inheritTime", inheritTime);
		mav.setViewName("/content/videoStart");
		return mav;
	}
	
	@RequestMapping("/deleteContent")
	public ModelAndView deleteContent(@RequestParam int contentCode){
		ContentDTO content = new ContentDTO();
		content.setContentCode(contentCode);
		contentService.contentDelete(content);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main/contentAdmin.do?pg=1");
		return mav;
	}
	
	@RequestMapping("/modifyContentForm")
	public ModelAndView modifyContentForm(@RequestParam int contentCode){
		ContentDTO content = contentService.contentGet(contentCode);
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/content/modifyContentForm.jsp");
		mav.addObject("content", content);
		mav.addObject("categoryList", getMenu());
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("modifyContent")
	public ModelAndView modifyContent(@ModelAttribute ContentDTO content, @RequestParam String mainCategory, @RequestParam String subCategory
									,@RequestParam MultipartFile[] img){
		//카테고리 합치기
		content.setCategory(mainCategory+"-"+subCategory);
				//파일처리
				String filePath = "C:\\spring4_0_1\\workspace\\VodShopping\\WebContent\\storage";
				if(!img[0].getOriginalFilename().equals("")){
					String fileName1 = img[0].getOriginalFilename();
					if(fileName1.length()!=0){
						File file1 = new File(filePath, fileName1);
						try {
							FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file1));
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						content.setContentImage(fileName1);
					}else{
						content.setContentImage("");
					}
				}
				if(!img[1].getOriginalFilename().equals("")){
					String fileName2 = img[1].getOriginalFilename();
					if(fileName2.length()!=0){
						File file2 = new File(filePath, fileName2);
						try {
							FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file2));
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						content.setVod(fileName2);
					}else{
						content.setVod("");
					}
				}
				//파일처리 end
				//DB update
				contentService.contentUpdate(content);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main/index.do");
		return mav;
	} 
	
	@RequestMapping("/contentSearch")
	public @ResponseBody String contentSearch(String sword, HttpServletResponse response){
		ContentDTO content = new ContentDTO();
		content.setSword(sword);
		content.setSearchType("subject");
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
	
	@RequestMapping("/inheritTimeInsert")
	public @ResponseBody void inheritTimeInsert(float time, int contentCode,HttpServletResponse response,HttpSession session){
		MemberDTO member = (MemberDTO)session.getAttribute("user");
		List<OrderItemDTO> list= orderService.myOrderItemListGet(member);
		OrderItemDTO orderItem = null;
		for(int i=0;i<list.size();i++){
			if(list.get(i).getContent().getContentCode()==contentCode){
				orderItem=list.get(i);
				orderItem.setInheritTime(time);
			}
		}
		orderService.orderItemUpdate(orderItem);
		memberService.memberUpdate(member);
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write("ok");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/contentListGet")
	public @ResponseBody void contentListGet(HttpServletResponse response, @RequestParam(required=false)int iDisplayStart, 
			@RequestParam(required=false)int iDisplayLength, @RequestParam(required=false)String sSearch,
			String sEcho){
		System.out.println("시작 : "+iDisplayStart+", 페이지사이즈 : "+iDisplayLength+", 검색어 : "+sSearch);
		ContentDTO content = new ContentDTO();
		content.setStartIndex(iDisplayStart);
		content.setEndIndex(iDisplayLength);
		if(!sSearch.equals("")){
			content.setSearchType("search");
			content.setSword(sSearch);
		}
		int tot = contentService.contentCountGet(content);
		List<ContentDTO> contentListAll = contentService.contentListAllGet(content);
		JSONArray jsonArr = new JSONArray();
		for(int i=0;i<contentListAll.size();i++){
			Map<String,String> map = new HashMap<String, String>();
			map.put("contentCode", contentListAll.get(i).getContentCode()+"");
			map.put("contentName", contentListAll.get(i).getContentName());
			map.put("price", contentListAll.get(i).getPrice()+"");
			map.put("director", contentListAll.get(i).getDirector());
			jsonArr.add(map);
		}
		JSONObject obj =new JSONObject();
		obj.put("sEcho", sEcho);
		obj.put("iTotalRecords",tot);
		obj.put("iTotalDisplayRecords",tot);
		obj.put("aaData", jsonArr);
		String json = obj.toJSONString();
		System.out.println(json);
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
