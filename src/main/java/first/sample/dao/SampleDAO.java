package first.sample.dao;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO {
	protected Logger log = LoggerFactory.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectBoardList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardListAll(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectBoardListAll", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardListSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectBoardListSearch", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardListSearch0(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectBoardListSearch0", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectStudyBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectStudyBoardList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSidebarList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectSidebarList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSidebarListParentNull(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectSidebarListParentNull", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSidebarListChild(Object map) throws Exception {
		log.debug("map은 ???:"+map);
		return (List<Map<String, Object>>) selectList("sample.selectSidebarListChild", map);
	}	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> infiniteScrollDown(Map<String,Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.infiniteScrollDown", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> infiniteScrollUp(Map<String,Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.infiniteScrollUp", map);
	}
	
	
	
	public void insertCategory(Map<String, Object> map) throws Exception {
		insert("sample.insertCategory", map);
	}
	public void insertCategory0(Map<String, Object> map) throws Exception {
		insert("sample.insertCategory0", map);
	}
	public void insertComment(Map<String, Object> map) throws Exception {
		insert("sample.insertComment", map);
	}
	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("sample.insertBoard", map);
	}

	
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("sample.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("sample.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception {
		update("sample.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("sample.deleteBoard", map);
	}

	public void insertStudyBoard(Map<String, Object>map) throws Exception{
		insert("sample.insertStudyBoard", map);
	}
}
