package com.elite.daangn;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.elite.service.MemberService;
import com.elite.vo.DaangnMemberVO;
import com.elite.vo.SessionVO;

@Controller
public class LoginController {
	
	@Resource(name="memberService")
	private MemberService memberService;

	@RequestMapping(value="/login.carrot", method=RequestMethod.GET)
	public String login(){
		return "/login/login";
	}
	
	@RequestMapping(value="/logout.carrot", method=RequestMethod.GET)
	public String loginout(HttpSession session){
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		if(svo != null) session.invalidate();
		
		return "redirect:/index.carrot";
	}
	
	@RequestMapping(value="/login_id_pass.carrot", method=RequestMethod.GET)
	public String login_id_pass(){
		
		return "/login/login_id_pass";
	}
	
	/* 아이디찾기 비밀번호찾기 핼야대!!! */
	@RequestMapping(value="/find_id.carrot", method=RequestMethod.GET)
	public ModelAndView find_id(){
		ModelAndView mv = new ModelAndView();
		//System.out.println("dd");
		mv.setViewName("/login/login_id_pass");
		return mv;
	}

	@RequestMapping(value="/login_proc.carrot", method=RequestMethod.POST)
	public ModelAndView login_proc(DaangnMemberVO vo, HttpSession session, String id) {
		
		ModelAndView mv = new ModelAndView();
		
		SessionVO  svo = memberService.getLoginResult(vo);
		
		SessionVO svo2 = (SessionVO)session.getAttribute("svo");
		
		/*DaangnMemberVO lock = memberService.getLoginAccountLock(id); //계정이 Yes or No 인지 확인*/
		SessionVO lock = memberService.getLoginlock(id);
		
		
		/*int a = Integer.parseInt(lock.getLatest_login_date());
		int b = Integer.parseInt(lock.getLatest_login_date()) + 10;*/

			if(svo != null ){

				//로그인 성공
				session.setAttribute("svo", svo);
				mv.addObject("id", svo.getId());
				mv.addObject("name", svo.getName());
				mv.setViewName("redirect:/index.carrot");
				
				if(svo.getWarn()>=3){
				/*	mv.setViewName("/login/login");*/
					/*mv.addObject("warn_msg","black");*/
					session.invalidate();
					mv.setViewName("/black_page");
				
				}else if(lock.getCnt() == 1){
					mv.addObject("lock", lock.getCnt());
					mv.setViewName("/login/login");
				}else{
					memberService.getLoginSuccess(id); //로그인 성공시 FailCount 리셋
				}
				
			}else{
				//로그인 실패
				int result = memberService.getLoginFailCount(id); //로그인 실패시 FailCount +1
				//아이디가 있는 경우
				if(result == 1){ 
					mv.setViewName("/login/login");
					mv.addObject("msg", "fail");

					memberService.getUpdateAccountLock(id);//로그인 5번 실패시 Lock = Yes	

					}else{
						//아이디가 없는 경우
						mv.setViewName("/login/login");
						mv.addObject("msg", "fail");

					}
				
				}	
			

			return mv;
		}	
	
		
	
	
}