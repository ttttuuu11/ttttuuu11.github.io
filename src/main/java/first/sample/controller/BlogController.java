package first.sample.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.pg.service.KakaoPay;
import first.sample.service.BlogService;
import lombok.Setter;

@Controller
@RequestMapping(value="/sample")
public class BlogController {
	protected Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "blogService")
	private BlogService sampleService;

	@Setter(onMethod_ = @Autowired)
	private KakaoPay kakaopay;

	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {
		log.debug("kakaoPay get...");
	}
	
	@PostMapping("/kakaoPay")
	public String kakaoPay() {
		log.debug("kakaoPay post............................................");

		return "redirect:" + kakaopay.kakaoPayReady();
	}

	@GetMapping("/kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		log.info("kakaoPaySuccess get............................................");
		log.info("kakaoPaySuccess pg_token : " + pg_token);
	}

	@RequestMapping(value = "/openIndex.do")
	public ModelAndView openIndex(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/index");
		List<Map<String, Object>> list = sampleService.selectBoardList(commandMap);
		List<Map<String, Object>> studyList = sampleService.selectStudyBoardList(commandMap);
		List<Map<String, Object>> sidebarListParentNull = sampleService.selectSidebarListParentNull(commandMap);
		int index = 0;
		for (Map<String, Object> map : sidebarListParentNull) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {

				String key = entry.getKey();
				Object value = entry.getValue();
				if (key.equals("CATEGORY_IDX")) {
					List<Map<String, Object>> sidebarListChild = sampleService.selectSidebarListChild(value);
					String tempName = "sidebarListChild" + index;
					mv.addObject(tempName, sidebarListChild);
					// sidebarListChild length 받아보기
					index = index + 1;

				}
			}
		}
		mv.addObject("list", list);
		mv.addObject("studyList", studyList);
		mv.addObject("sidebarListParentNull", sidebarListParentNull);
		return mv;
	}

	@RequestMapping(value = "/StudyWrite.do")
	public ModelAndView StudyWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/sample/openIndex.do");
		sampleService.insertStudyBoard(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/AddCategory.do")
	public ModelAndView AddCategory(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/sample/openIndex.do");
		if (commandMap.get("addParentCategoryIdx").toString() == "0") {
			sampleService.insertCategory0(commandMap.getMap());
		} else {
			sampleService.insertCategory(commandMap.getMap());
		}
		return mv;
	}

	@RequestMapping(value = "/AddComment.do")
	public ModelAndView AddComment(CommandMap commandMap, @RequestParam("IDX") Object IDX) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/sample/viewDetail.do");
		commandMap.put("IDX", IDX);
		sampleService.insertComment(commandMap.getMap());
		List<Map<String, Object>> commentList = sampleService.selectCommentList(commandMap.getMap());
		Map<String, Object> boardDetail = sampleService.selectBoardDetail(commandMap.getMap());
		mv.addObject("commentList", commentList);
		mv.addObject("boardDetail", boardDetail);
		mv.addObject("IDX", IDX);
		return mv;
	}

	// 카테고리 별 게시글 리스트
	@RequestMapping(value = "/viewList.do")
	public ModelAndView viewList(Map<String, Object> commandMap, @RequestParam("c") Object CATEGORY_IDX)
			throws Exception {
		ModelAndView mv = new ModelAndView("/sample/viewList");
		commandMap.put("CATEGORY_IDX", CATEGORY_IDX);
		List<Map<String, Object>> listAll = sampleService.selectBoardListAll(commandMap);
		List<Map<String, Object>> sidebarListParentNull = sampleService.selectSidebarListParentNull(commandMap);
		int index = 0;

		// 카테고리
		for (Map<String, Object> map : sidebarListParentNull) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				if (key.equals("CATEGORY_IDX")) {
					List<Map<String, Object>> sidebarListChild = sampleService.selectSidebarListChild(value);
					String tempName = "sidebarListChild" + index;
					mv.addObject(tempName, sidebarListChild);
					index = index + 1;

				}
			}
		}
		Map<String, Object> categoryName = sampleService.selectCategoryName(commandMap);
		mv.addObject("listAll", listAll);
		mv.addObject("CATEGORY_NAME", categoryName.get("CATEGORY_NAME"));
		mv.addObject("sidebarListParentNull", sidebarListParentNull);

		return mv;
	}

	// 검색어+카테고리 별 리스트
	@RequestMapping(value = "/viewListSearch.do")
	public ModelAndView viewListSearch(Map<String, Object> commandMap, @RequestParam("c") Object CATEGORY_IDX,
			@RequestParam("s") String SEARCH_WORD) throws Exception {

		ModelAndView mv = new ModelAndView("/sample/viewList");
		List<Map<String, Object>> listSearch;

		commandMap.put("CATEGORY_IDX", CATEGORY_IDX);
		commandMap.put("SEARCH_WORD", SEARCH_WORD);

		if (((String) CATEGORY_IDX).equals("0")) { // object 형 자료형 비교
			listSearch = sampleService.selectBoardListSearch0(commandMap);
		} else {
			listSearch = sampleService.selectBoardListSearch(commandMap);
		}
		List<Map<String, Object>> sidebarListParentNull = sampleService.selectSidebarListParentNull(commandMap);
		int index = 0;
		for (Map<String, Object> map : sidebarListParentNull) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				if (key.equals("CATEGORY_IDX")) {
					List<Map<String, Object>> sidebarListChild = sampleService.selectSidebarListChild(value);
					String tempName = "sidebarListChild" + index;
					mv.addObject(tempName, sidebarListChild);
					index = index + 1;
				}
			}
		}
		mv.addObject("listAll", listSearch);
		mv.addObject("CATEGORY_IDX", CATEGORY_IDX.toString());
		mv.addObject("sidebarListParentNull", sidebarListParentNull);

		return mv;
	}

	@RequestMapping(value = "/viewDetail.do")
	public ModelAndView viewDetail(Map<String, Object> commandMap, @RequestParam("IDX") Object IDX) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/viewDetail");
		commandMap.put("IDX", IDX);
		List<Map<String, Object>> commentList = sampleService.selectCommentList(commandMap);
		Map<String, Object> boardDetail = sampleService.selectBoardDetail(commandMap);
		mv.addObject("boardDetail", boardDetail);
		mv.addObject("IDX", IDX);
		mv.addObject("commentList", commentList);
		return mv;
	}

	@RequestMapping(value = "/viewMypage.do")
	public ModelAndView viewMypage(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/trashTest");

		return mv;
	}

	@RequestMapping(value = "/viewWrite.do")
	public ModelAndView viewWrite(Map<String, Object> commandMap, @RequestParam("c") Object CATEGORY_IDX)
			throws Exception {
		ModelAndView mv = new ModelAndView("/sample/viewWrite");
		commandMap.put("CATEGORY_IDX", CATEGORY_IDX);
		log.debug("write페이지에서의 카테고리 인덱스 :" + CATEGORY_IDX.toString());
		mv.addObject("CATEGORY_IDX", CATEGORY_IDX.toString());
		return mv;
	}

	@RequestMapping(value = "/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardList");

		if (commandMap.isEmpty() == false) {
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ",\tvalue : " + entry.getValue());
			}
		}
		return mv;
	}

	@RequestMapping(value = "/openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap, @RequestParam("c") Object CATEGORY_IDX) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardWrite");
		commandMap.put("CATEGORY_IDX", CATEGORY_IDX);

		mv.addObject("CATEGORY_IDX", CATEGORY_IDX.toString());
		return mv;
	}

	@RequestMapping(value = "/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(
				"redirect:/sample/viewList.do?c=" + commandMap.get("CATEGORY_IDX").toString());
		sampleService.insertBoard(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/openBoardDetail.do")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardDetail");
		Map<String, Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}

	@RequestMapping(value = "/openBoardUpdate.do")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardUpdate");
		Map<String, Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}

	@RequestMapping(value = "/updateBoard.do")
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
		sampleService.updateBoard(commandMap.getMap());
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}

	@RequestMapping(value = "/deleteBoard.do")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(
				"redirect:/sample/viewList.do?c=" + commandMap.get("CATEGORY_IDX").toString());
		log.debug("delete에서 의 카테고리인덱스 : " + commandMap.get("CATEGORY_IDX").toString());

		sampleService.deleteBoard(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/deleteStudy.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteStudy(@RequestBody Map<String, Object> commandMap) throws Exception {
		commandMap.put("STUDY_IDX", commandMap.get("STUDY_IDX").toString());

		Map<String, Object> studyBoard = sampleService.deleteStudyBoard(commandMap);
		return studyBoard;
	}

	@RequestMapping(value = "/infiniteScrollDown.do", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> infiniteScrollDownPost(@RequestBody Map<String, Object> commandMap)
			throws Exception {
		Integer bnoToStart = (Integer.parseInt((String) commandMap.get("bno"))) - 1;

		commandMap.put("bnoToStart", bnoToStart);

		List<Map<String, Object>> listAll = sampleService.infiniteScrollDown(commandMap);

		return listAll;
	}

	@RequestMapping(value = "/infiniteScrollUp.do", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> infiniteScrollUpPost(@RequestBody Map<String, Object> commandMap)
			throws Exception {
		Integer bnoToStart = (Integer.parseInt((String) commandMap.get("bno"))) + 1;

		commandMap.put("bnoToStart", bnoToStart);
		List<Map<String, Object>> listAll = sampleService.infiniteScrollUp(commandMap);

		return listAll;
	}

	@RequestMapping(value = "/imageUpload.do", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) {

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = "D:/workspace/first/src/main/webapp/imageUpload/" + fileName;// 저장경로

			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String callback = request.getParameter("CKEditorFuncNum");

			printWriter = response.getWriter();
			String fileUrl = "/first/imageUpload/" + fileName;
			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback
					+ ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	@RequestMapping(value = "/fileUpload.do", method = RequestMethod.POST)
	public void communityFileUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset-utf-8");
		try {
			sampleService.communityFileUpload(request, response, upload);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
