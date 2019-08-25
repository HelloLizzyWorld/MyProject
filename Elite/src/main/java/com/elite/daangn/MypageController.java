package com.elite.daangn;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.elite.service.MypageService;
import com.elite.service.PageService;
import com.elite.service.ProductService;
import com.elite.vo.DaangnMemberVO;
import com.elite.vo.DaangnProductVO;
import com.elite.vo.DaangnReviewVO;
import com.elite.vo.SessionVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class MypageController {

	@Resource(name = "mypageService")
	private MypageService mypageService;

	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "pageService")
	private PageService pageService;

	@RequestMapping(value = "/mypage.carrot", method = RequestMethod.GET)
	public String mypage() {
		return "/mypage/mypage";
	}

	@RequestMapping(value = "/box.carrot", method = RequestMethod.GET)
	public ModelAndView box(HttpSession session, DaangnMemberVO vo) {
		ModelAndView mv = new ModelAndView("/mypage/mypage_box");
		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();
		DaangnMemberVO vo2 = mypageService.getBox(uid, vo);
		mv.addObject("vo2", vo2);
		mv.addObject("svo", svo.getId());
		mv.addObject("address", vo2.getAddress());
		mv.addObject("name", svo.getName());
		mv.setViewName("/mypage/mypage_box");

		return mv;
	}

	@RequestMapping(value = "/mypage_profile_proc.carrot", method = RequestMethod.POST)
	@ResponseBody
	public String profile_update_proc(HttpSession session, DaangnMemberVO vo, HttpServletRequest request)
			throws Exception {
		String pro = "";
		SessionVO svo = (SessionVO) session.getAttribute("svo");
		vo.setId(svo.getId());

		boolean result = mypageService.getUpdate(vo, request);
		if (result != false) {
			pro = vo.getMfile();
		}
		return pro;
	}

	@RequestMapping(value = "/mypage_info_pass_check.carrot")
	public ModelAndView mypage_info_pass_check(HttpSession session, DaangnMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		/* box */
		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();
		DaangnMemberVO vo2 = mypageService.getBox(uid, vo);
		mv.addObject("vo2", vo2);
		/* box */
		mv.addObject("svo", svo.getId());
		mv.addObject("name", svo.getName());
		mv.setViewName("/mypage/mypage_info");

		return mv;
	}

	@RequestMapping(value = "/pass_check.carrot", method = RequestMethod.POST)
	@ResponseBody
	public String pass_check(String id, String pass) {

		int result = mypageService.getPass_check(id, pass);

		return String.valueOf(result);
	}

	@RequestMapping(value = "/mypage_info.carrot", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView mypage_info(String id, HttpSession session) {

		ModelAndView mv = new ModelAndView();

		DaangnMemberVO vo = mypageService.getInfo(id);

		mv.addObject("vo", vo);

		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();
		DaangnMemberVO vo2 = mypageService.getBox(uid, vo);
		mv.addObject("vo2", vo2);
		mv.addObject("svo", svo.getId());
		mv.addObject("address", vo2.getAddress());
		mv.addObject("name", svo.getName());

		mv.setViewName("/mypage/mypage_info2");
		return mv;
	}

	@RequestMapping(value = "/mypage_info3.carrot", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView mypage_infoupdate(String id, String nick, String pass, String gender, String birth,
			String email, String name, String phone, String address, HttpSession session, DaangnMemberVO vo3) {
		ModelAndView mv = new ModelAndView();
		/* box */
		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();
		DaangnMemberVO vo2 = mypageService.getBox(uid, vo3);
		mv.addObject("vo2", vo2);
		/* box */
		mv.addObject("svo", svo.getId());
		mv.addObject("name", svo.getName());
		DaangnMemberVO vo = mypageService.getInfo(id);
		mv.addObject("vo", vo);

		vo.setPass(pass);
		vo.setGender(gender);
		vo.setEmail(email);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setGender(gender);
		vo.setNick(nick);
		vo.setBirth(birth);
		vo.setAddress(address);

		int val = mypageService.getInfoUpdate(vo);

		if (val != 0)

			mv.setViewName("/mypage/mypage_info2");

		return mv;
	}

	@RequestMapping(value = "/mypage_info_cancel.carrot")
	public String cancel(String id, HttpSession session) {

		int result = mypageService.getInfoCancel(id);

		if (result != 0) {
			session.invalidate();
		}

		return "/index";
	}

	@RequestMapping(value = "/mypage_cart.carrot", method = RequestMethod.GET)
	public ModelAndView mypage_box(HttpSession session, DaangnMemberVO vo, String rpage) {
		ModelAndView mv = new ModelAndView();
		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();

		ArrayList<DaangnProductVO> list = (ArrayList<DaangnProductVO>) pageService.getPageList(rpage, "cart", uid)
				.get("list");
		/* box */
		DaangnMemberVO vo2 = mypageService.getBox(uid, vo);
		mv.addObject("vo2", vo2);
		/* box */
		mv.addObject("list", list);
		mv.addObject("svo", svo.getId());
		mv.addObject("name", svo.getName());
		mv.addObject("dbCount", pageService.getDbCount());
		mv.addObject("pageSize", pageService.getPageSize());
		mv.addObject("rpage", pageService.getReqPage());
		mv.setViewName("/mypage/mypage_cart");
		return mv;

	}

	@RequestMapping(value = "/mypage_cart2.carrot", method = RequestMethod.GET)
	@ResponseBody
	public String mypage_cart2(String pid, HttpSession session) {
		String result = "";
		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();
		int choice = mypageService.getChoice(pid, uid);
		if (choice != 0) {

			boolean del_cart = mypageService.delLike(pid, uid);
			if (del_cart != false) {
				result = "false";
			}

		} else {
			boolean cart = mypageService.getLike(pid, uid);
			if (cart != false) {
				result = "success";
			}
		}

		return result;
	}

	@RequestMapping(value = "/mypage_delete.carrot", method = RequestMethod.GET)
	public String delete(String cid) {
		String pname = "";
		boolean result = mypageService.getDelete(cid);
		if (result)
			pname = "redirect:/mypage_cart.carrot";
		return pname;

	}

	/*
	 * @RequestMapping(value = "/mypage_delete_proc.carrot", method =
	 * RequestMethod.GET) public String mypage_delete(String cid) { String pname
	 * = ""; boolean result = mypageService.getDelete(cid); if (result) { pname
	 * = "redirect:mypage_cart.carrot"; } return "/mypage/mypage_cart"; }
	 */

	// 내가 판매한 상품 목록
	@RequestMapping(value = "/mypage_sales.carrot", method = RequestMethod.GET)
	public ModelAndView mypage_sales(HttpSession session, DaangnMemberVO vo, String rpage) {
		ModelAndView mv = new ModelAndView();
		ArrayList<DaangnProductVO> list = new ArrayList<DaangnProductVO>();

		/* mypage box - 마이페이지 상단에 있는 개인정보 */
		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();
		DaangnMemberVO vo2 = mypageService.getBox(uid, vo);
		mv.addObject("vo2", vo2);
		/* mypage box */

		list = (ArrayList<DaangnProductVO>) pageService.getPageList(rpage, "sales", uid).get("list");

		mv.addObject("dbCount", pageService.getDbCount());
		mv.addObject("pageSize", pageService.getPageSize());
		mv.addObject("rpage", pageService.getReqPage());

		mv.addObject("svo", svo.getId());
		mv.addObject("name", svo.getName());
		mv.addObject("list", list);

		mv.setViewName("/mypage/mypage_sales");
		return mv;

	}

	@RequestMapping(value = "/mypage_purchase.carrot", method = RequestMethod.GET)
	public ModelAndView mypage_purchase(HttpSession session, DaangnMemberVO vo) {

		ModelAndView mv = new ModelAndView();
		/* box */
		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();
		DaangnMemberVO vo2 = mypageService.getBox(uid, vo);
		mv.addObject("vo2", vo2);

		String id = svo.getId();
		ArrayList<DaangnProductVO> list = new ArrayList<DaangnProductVO>();

		list = mypageService.getPurchaseList(id);

		/*
		 * System.out.println(list.get(0).getPid()); list 안에 value가 있나 확인하는 방법!
		 */

		/* box */
		mv.addObject("id", svo.getId());
		mv.addObject("name", svo.getName());
		mv.addObject("list", list);
		mv.setViewName("/mypage/mypage_purchase");

		return mv;
	}

	@RequestMapping(value = "/mypage_review.carrot", produces = "application/text; charset=utf8")
	@ResponseBody
	public String mypage_review(String pid) {

		DaangnProductVO pvo = mypageService.getReview(pid);

		Gson gson = new GsonBuilder().create();
		String json = "";
		json = gson.toJson(pvo);
		/* System.out.println(json.toString()); */

		return json;
	}

	@RequestMapping(value = "/review.carrot", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String mypage_review_insert(String state, String chkArray, String detail, String pid, HttpSession session) {

		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();

		int result = mypageService.getReviewInsert(state, chkArray, detail, uid, pid);

		return String.valueOf(result);
	}

	@RequestMapping(value = "/review_waiting.carrot")
	public ModelAndView review_waiting(HttpSession session, String pid, DaangnMemberVO vo) {

		ModelAndView mv = new ModelAndView();

		// box
		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();
		DaangnMemberVO vo2 = mypageService.getBox(uid, vo);
		mv.addObject("vo2", vo2);
		// box

		int d_result = mypageService.getOrderDelete(pid);

		int i_result = mypageService.getOrderInsert(pid, uid);

		ArrayList<DaangnProductVO> list = new ArrayList<DaangnProductVO>();
		list = mypageService.getPurchaseList(svo.getId());
		/* DaangnProductVO pvo = mypageService.getReview(pid); */

		mv.addObject("list", list);
		mv.addObject("vo", vo);
		mv.addObject("svo", svo.getId());

		mv.setViewName("/mypage/mypage_purchase");

		return mv;
	}

	@RequestMapping(value = "/review_finish.carrot")
	public ModelAndView review_finish(HttpSession session, DaangnMemberVO vo, String pid) {
		ModelAndView mv = new ModelAndView();

		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String uid = svo.getId();
		DaangnMemberVO vo2 = mypageService.getBox(uid, vo);
		mv.addObject("vo2", vo2);

		String id = svo.getId();
		ArrayList<DaangnProductVO> list = new ArrayList<DaangnProductVO>();

		list = mypageService.getPurchaseListFinish(id);

		/* box */
		mv.addObject("id", svo.getId());
		mv.addObject("name", svo.getName());
		mv.addObject("list", list);

		mv.setViewName("/mypage/mypage_purchase2");

		return mv;
	}

	@RequestMapping(value = "/my_review.carrot", produces = "application/text; charset=utf8")
	@ResponseBody
	public String my_review(String pid, HttpSession session, HttpServletResponse response) {

		response.setContentType("text/html;charset=UTF-8");

		SessionVO svo = (SessionVO) session.getAttribute("svo");
		String id = svo.getId();

		DaangnReviewVO vo = mypageService.getReviewFinish(id, pid);

		Gson gson = new GsonBuilder().create();
		String json = "";
		json = gson.toJson(vo);

		return json;
	}
}