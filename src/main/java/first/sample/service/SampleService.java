package first.sample.service;

import java.util.List;
import java.util.Map;

public interface SampleService {
	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectBoardListAll(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectBoardListSearch(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectBoardListSearch0(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectStudyBoardList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectSidebarList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectSidebarListParentNull(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectSidebarListChild(Object map) throws Exception;
	
	List<Map<String, Object>> infiniteScrollDown(Map<String,Object> map) throws Exception;
	
	List<Map<String, Object>> infiniteScrollUp(Map<String,Object> map) throws Exception;
	
	void insertStudyBoard(Map<String, Object> map) throws Exception;
	
	void insertBoard(Map<String, Object> map) throws Exception;

	void insertCategory(Map<String, Object> map) throws Exception;
	
	void insertCategory0(Map<String, Object> map) throws Exception;

	void insertComment(Map<String, Object> map) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String, Object> map) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

}