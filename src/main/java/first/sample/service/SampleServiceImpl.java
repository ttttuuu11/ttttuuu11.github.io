package first.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import first.sample.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService {
	Logger log = LoggerFactory.getLogger(this.getClass());
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardList(map);
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
	public void insertCategory0(Map<String, Object> map) throws Exception {
		sampleDAO.insertCategory0(map);
	}
	
	@Override
	public List<Map<String, Object>> infiniteScrollDown(Map<String,Object> map) throws Exception {

		return sampleDAO.infiniteScrollDown(map);
	}

	@Override
	public List<Map<String, Object>> infiniteScrollUp(Map<String,Object> map) throws Exception {

		return sampleDAO.infiniteScrollUp(map);
	}

}
