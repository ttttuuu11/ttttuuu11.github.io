package first.sample.dao;

import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;


@Repository("commentDAO")
public class CommentDAO extends AbstractDAO {
	protected Logger log = LoggerFactory.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectCommentList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> countComment(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectList("sample.countComment", map);
	}
	

}
