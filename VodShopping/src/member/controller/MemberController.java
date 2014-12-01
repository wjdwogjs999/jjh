package member.controller;

import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.service.MemberService;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import category.bean.Category;
import category.service.CategoryService;

@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberServie;
	@Autowired
	private  CategoryService categoryService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private static int errorCodeNumber;
	public static final int DATAACCESS_ERROR=666;
	
	public static int getErrorCodeNumber(){
		return errorCodeNumber;
	}

	public static void setErrorCodeNumber(int errorCodeNumber) {
		MemberController.errorCodeNumber = errorCodeNumber;
	}

	private List<Category> getMenu(){
		List<Category> list = categoryService.mainCategoryListGet();
		return list;
	}
	
	@RequestMapping("/joinForm")
	public ModelAndView memberWriteForm(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/member/joinForm.jsp");
		mav.addObject("categoryList", getMenu());
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/checkId")
	public @ResponseBody String check(String id){
		MemberDTO member=new MemberDTO();
		member.setId(id);
		   String result = null;
		   if(id != null) {
			   member = memberServie.memberGet(member);
		   }
		   if(member == null ) {
			   result="OK";
		   } else {
			   result="Fail";
		   }
		   return result; 
	}
	
	@RequestMapping("join")
	public ModelAndView join(@ModelAttribute MemberDTO memberDto, String datepicker){
		   ModelAndView mav = new ModelAndView();
		   mav.addObject("categoryList", getMenu());
		   mav.setViewName("/main/index");
		   if(Pattern.matches("\\d{4}/\\d{2}/\\d{2}", datepicker))
		   {
			   String[] birth = datepicker.split("/");
			   memberDto.setB_year(Integer.parseInt(birth[0]));
			   memberDto.setB_month(Integer.parseInt(birth[1]));
			   memberDto.setB_day(Integer.parseInt(birth[2]));
		   }else{
			   mav.addObject("display", "/error/datepickerError.jsp");
			   return mav;
		   }
		   //암호화해서 비밀번호 설정
		   memberDto.setPwd(bcryptPasswordEncoder.encode(memberDto.getPwd()));
		   memberServie.memberJoin(memberDto);
		   		  
		   if(MemberController.getErrorCodeNumber()==MemberController.DATAACCESS_ERROR){
			   //다시 초기화
			   MemberController.setErrorCodeNumber(0);
			   mav.addObject("display", "/error/dataAccessException.jsp");
			   return mav;
		   }else{
			 //메일처리
			   try{
				   HtmlEmail email = new HtmlEmail();
				   email.setHostName("smtp.gmail.com");
				   email.setSmtpPort(587);
				   email.setAuthenticator(new DefaultAuthenticator("wjdwogjs999@gmail.com", "gywls5935"));
				   email.setSSLOnConnect(true);
				   email.setCharset("UTF-8");
				 
				   email.addTo(memberDto.getEmail(), memberDto.getName());
				   email.setFrom("wjdwogjs999@gmail.com", "운영자");
				   email.setSubject("회원가입을 진심으로 축하드립니다.^^");
				   
				   email.setHtmlMsg("<html><body><div style='padding: 50px 100px;'>"
						   			+ "<div style='width:300px; height: 400px; text-align: center; padding: 50px; border: 1px solid black'>"
						   			+ "<br/><br/><br/><br/><br/><br/>"
						   			+ "<div>안녕하세요. <font color='blue'>CASTIS</font>입니다.<br/>"
						   			+ "<font color='blue'>"+memberDto.getName()+"("+memberDto.getId()+")</font> 고객님의 회원가입을 축하드립니다.<br/>	"
						   			+ "앞으로도 많은 관심 부탁드립니다!!<br/></div></div></div></body></html>");
				   email.send();
			       //여기까지 메일 구현
			   }catch(EmailException e){
				   e.printStackTrace();
				   mav.addObject("display", "/error/emailException.jsp");
				   return mav;
			   }		
			   mav.addObject("display", "/member/joinOk.jsp");
			   return mav;
		   } 
	   }
	
	@RequestMapping("/checkAddressForm")
	public ModelAndView checkAddressForm(){
		return new ModelAndView("/member/checkAddress");
	}
	
	@RequestMapping("/checkAddress")
	public ModelAndView checkAddress(String dong){
		List<ZipcodeDTO> list=memberServie.zipcodeListGet(dong);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/member/checkAddress");
		return mav;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(String id, String pwd,HttpSession session){
		MemberDTO member = new MemberDTO();
		member.setId(id);
		ModelAndView mav = new ModelAndView();
		MemberDTO user = memberServie.memberGet(member);
		//암호화
		if(user!=null){
			if(bcryptPasswordEncoder.matches(pwd, user.getPwd())==false)
				mav.setViewName("/member/loginFail");
			else{
				session.setAttribute("user", user);
				mav.setViewName("redirect:/main/index.do");
			}
		}else
			mav.setViewName("/member/loginFail");
		return mav;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("/member/logoutOk");
		return mav;
	}
	
	@RequestMapping("/idFindForm")
	public ModelAndView idFindForm(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/member/idFindForm.jsp");
		mav.addObject("categoryList", getMenu());
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/idFind")
	public ModelAndView idFind(@ModelAttribute MemberDTO member){
		String name = member.getName();
		member = memberServie.memberGet(member);
		ModelAndView mav = new ModelAndView();
		if(member!=null){
			mav.addObject("member", member);
			mav.addObject("display", "/member/idFindOk.jsp");
		}else{
			mav.addObject("name", name);
			mav.addObject("display", "/member/idFindFail.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/pwdFindForm")
	public ModelAndView pwdFindForm(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/member/pwdFindForm.jsp");
		mav.addObject("categoryList", getMenu());
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/member/modifyForm.jsp");
		mav.addObject("categoryList", getMenu());
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/modify")
	public ModelAndView modify(@ModelAttribute MemberDTO member, @RequestParam String datepicker){
		String[] birth = datepicker.split("/");
		member.setB_year(Integer.parseInt(birth[0]));
		member.setB_month(Integer.parseInt(birth[1]));
		member.setB_day(Integer.parseInt(birth[2]));
		member.setPwd(bcryptPasswordEncoder.encode(member.getPwd()));
		memberServie.memberUpdate(member);
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/member/modifyOk.jsp");
		mav.addObject("categoryList", getMenu());
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/pwdFind")
	public ModelAndView pwdFind(@ModelAttribute MemberDTO member){
		String name = member.getName();
		member=memberServie.memberGet(member);
		ModelAndView mav = new ModelAndView();
		if(member!=null){
			// 메일보내기
			HtmlEmail httpEmail = new HtmlEmail();
			httpEmail.setHostName("smtp.gmail.com");
			httpEmail.setSmtpPort(587);
			httpEmail.setAuthenticator(new DefaultAuthenticator(
					"wjdwogjs999@gmail.com", "gywls5935"));
			httpEmail.setSSLOnConnect(true);
			httpEmail.setCharset("UTF-8");		
			try {
				httpEmail.addTo(member.getEmail(), member.getName());
				httpEmail.setFrom("wjdwogjs999@gmail.com", "운영자");
				httpEmail.setSubject("회원님의 비밀번호입니다");
				String rnd_char = "";
				//랜덤 문자열 발생!!
				for (int i=0;i<=8;i++){
					int rnd=(int)(Math.random()*75)+48;//48~122
					if((rnd>=58 && rnd<=64) || (rnd>=91 && rnd<=96)){
						i--;
						continue;
					}else{
						rnd_char += (char)(rnd);
					}
				}
				member.setPwd(bcryptPasswordEncoder.encode(rnd_char));
				memberServie.memberPwdUpdate(member);
				httpEmail.setHtmlMsg("<html><body><div style='padding: 50px 100px;'>"
						+ "<div style='width:300px; height: 400px; text-align: center; padding: 50px; border: 1px solid black'>"
						+ "<div>안녕하세요."
						+ member.getName()
						+ "님 회원님의 임시비밀번호는 <font color='blue'>"
						+ rnd_char
						+ "</font>입니다.<br/>"
						+ "앞으로도 많은 관심 부탁드립니다!!<br/></div></div></div></body></html>");
				httpEmail.send();
			} catch (EmailException e) {
				e.printStackTrace();
			}
			mav.addObject("member", member);
			mav.addObject("display", "/member/pwdFindOk.jsp");
		}else{
			mav.addObject("name", name);
			mav.addObject("display", "/member/pwdFindFail.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping("/deleteMember")
	public ModelAndView deleteMember(String id){
		MemberDTO member = new MemberDTO();
		member.setId(id);
		memberServie.memeberDelete(member);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main/memberAdmin.do?pg=1");
		return mav;
	}
	
}
