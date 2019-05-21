package first.sample.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import first.sample.dao.CommentDAO;
import first.sample.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService {
	Logger log = LoggerFactory.getLogger(this.getClass());
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;

	@Resource(name = "commentDAO")
	private CommentDAO commentDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardList(map);
	}

	@Override
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		return commentDAO.selectCommentList(map);
	}

	@Override
	public List<Map<String, Object>> selectBoardListAll(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardListAll(map);
	}

	@Override
	public List<Map<String, Object>> selectBoardListSearch(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardListSearch(map);
	}

	@Override
	public List<Map<String, Object>> selectBoardListSearch0(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardListSearch0(map);
	}

	@Override
	public List<Map<String, Object>> selectStudyBoardList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectStudyBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		sampleDAO.insertBoard(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		sampleDAO.updateHitCnt(map);
		Map<String, Object> resultMap = sampleDAO.selectBoardDetail(map);
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception {
		sampleDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		sampleDAO.deleteBoard(map);
	}

	@Override
	public void insertStudyBoard(Map<String, Object> map) throws Exception {
		sampleDAO.insertStudyBoard(map);

	}

	@Override
	public List<Map<String, Object>> selectSidebarList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectSidebarList(map);
	}

	@Override
	public List<Map<String, Object>> selectSidebarListParentNull(Map<String, Object> map) throws Exception {
		return sampleDAO.selectSidebarListParentNull(map);
	}

	@Override
	public List<Map<String, Object>> selectSidebarListChild(Object map) throws Exception {
		return sampleDAO.selectSidebarListChild(map);

	}

	@Override
	public void insertCategory(Map<String, Object> map) throws Exception {
		sampleDAO.insertCategory(map);
	}

	@Override
	public void insertComment(Map<String, Object> map) throws Exception {
		sampleDAO.insertComment(map);
	}

	@Override
	public List<Map<String, Object>> infiniteScrollDown(Map<String, Object> map) throws Exception {

		return sampleDAO.infiniteScrollDown(map);
	}

	@Override
	public void insertCategory0(Map<String, Object> map) throws Exception {
		sampleDAO.insertCategory0(map);
	}

	@Override
	public List<Map<String, Object>> infiniteScrollUp(Map<String, Object> map) throws Exception {

		return sampleDAO.infiniteScrollUp(map);
	}
	@Override
	public Map<String, Object> deleteStudyBoard(Map<String, Object> map) throws Exception {
		log.debug("딜리트 했음!! 했다고 !!!"+map.get("STUDY_IDX"));

		sampleDAO.deleteStudyBoard(map);
		Map<String, Object> resultMap = sampleDAO.selectStudyBoardOne(map);
		return resultMap;
	}
	@Override
	public Map<String, Object> countComment(Map<String, Object> map) throws Exception {
		sampleDAO.deleteStudyBoard(map);
		Map<String, Object> resultMap = commentDAO.countComment(map);
		return resultMap;
	}
	@Override
	public Map<String, Object> selectCategoryName(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = sampleDAO.selectCategoryName(map);
		return resultMap;
	}
	@Override
	public void addReplyComment(Map<String, Object> map) throws Exception {
		//commentDAO.addReplyComment(map);
	}
	
	@SuppressWarnings("resource")
	public void communityFileUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		OutputStream out = null;
		PrintWriter printWriter = null;	
		String fileName = file.getOriginalFilename();
		byte[] bytes = file.getBytes();
		String FILE_URL = "D:/workspace/first/src/main/webapp/imageUpload/";
		String uploadPath = FILE_URL + fileName;
		
		System.out.println(uploadPath);
		out = new FileOutputStream(new File(uploadPath));
		out.write(bytes);
		String callback = request.getParameter("CKEditorFuncNum");
		printWriter = response.getWriter();
		String fileUrl = "/first/fileUpload/" + fileName;
		printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	               + callback
	               + ",'"
	               + fileUrl
	               + "','파일을 업로드 하였습니다.'"
	               + ")</script>");
	       printWriter.flush();
	}

}
