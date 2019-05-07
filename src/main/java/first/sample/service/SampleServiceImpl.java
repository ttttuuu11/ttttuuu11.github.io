package first.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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

}
