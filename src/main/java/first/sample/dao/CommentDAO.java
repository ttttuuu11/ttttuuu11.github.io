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
	
/*
	//�θ� ��� ����
	public int selectParentReplyId(Map<String, Object> map) {
		int state=0;
		try {
			conn = DBConnUtil.getConnection();
			//todo..
			
			String sql = "SELECT parentReplyId FROM comment WHERE comment_id=?";
			ps = conn.prepareStatement(sql);
			ps.setLong(1, commentDTO.getCommentId());
			
			rs = ps.executeQuery();
			rs.next();
			
			state = rs.getInt(1);
			//todo..			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnUtil.close(conn, ps, rs);
		}
		return state;
	}
	
	//�ִ� ���� �ѹ� �� ��������
	public int selectMaxOrderNoByParentReplyId(CommentDTO commentDTO) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int state = 0;
		try {
			conn = DBConnUtil.getConnection();
			//todo..
			
			String sql = "SELECT MAX(orderNo) FROM comment START WITH comment_id=?"
					+ "CONNECT BY PRIOR comment_id=parentReplyId"
					+ "ORDER BY orderNo DESC";
			ps = conn.prepareStatement(sql);
			ps.setLong(1, commentDTO.getCommentId());		
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				state= rs.getInt(1);
			}
			//todo..			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnUtil.close(conn, ps, rs);
		}
		return state;
	}
	
	//�ִ� ���� �ѹ�
	public int selectLatestOrderNoByParentReplyId(CommentDTO commentDTO) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int state=0;
		try {
			conn = DBConnUtil.getConnection();
			//todo..
			
			String sql = "SELECT orderNo FROM comment WHERE comment_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, commentDTO.getParentReplyId());
			
			rs = ps.executeQuery();
			rs.next();
			
			state = rs.getInt(1);
			//todo..			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnUtil.close(conn, ps,rs);
		}
		return state;
	}
	
	//������Ʈ ���� �ѹ�
	public void updateOrderByGroupId(CommentDTO commentDTO) {
		Connection conn = null;
		PreparedStatement ps = null;
		int maxOrderNoSameParent=0;
		try {
			conn = DBConnUtil.getConnection();
			//todo..
			if(countOrderNoSameParent(commentDTO)>0) {
				maxOrderNoSameParent=selectMaxOrderNoSameParentReplyId(commentDTO);
				commentDTO.setOrderNo(maxOrderNoSameParent+1);
			}
			String sql = "UPDATE comment SET orderNo = orderNo+1 WHERE orderNo>=? AND board_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, commentDTO.getOrderNo());
			ps.setLong(2, commentDTO.getBoardId());
			ps.executeQuery();
			
			//todo..			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnUtil.close(conn, ps);
		}
	}
	
	//�Խñ��� �ְ� orderNo
	public int selectMaxOrderNo(CommentDTO commentDTO) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int state = 0;
		try {
			conn = DBConnUtil.getConnection();
			//todo..
			
			String sql = "SELECT MAX(orderNo) FROM comment WHERE board_id=?";
			ps = conn.prepareStatement(sql);			
			ps.setLong(1, commentDTO.getBoardId());
			rs = ps.executeQuery();
			
			if(rs.next()) {
				state= rs.getInt(1);
			}
			//todo..			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnUtil.close(conn, ps, rs);
		}
		return state;
	}
	
	
	public int selectMaxOrderNoSameParentReplyId(CommentDTO commentDTO) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int state = 0;
		try {
			conn = DBConnUtil.getConnection();
			//todo..
			
			String sql = "SELECT MAX(orderNo) FROM comment WHERE parentReplyId=?";
			ps = conn.prepareStatement(sql);			
			ps.setLong(1, commentDTO.getParentReplyId());
			rs = ps.executeQuery();
			
			if(rs.next()) {
				state= rs.getInt(1);
			}
			//todo..			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnUtil.close(conn, ps, rs);
		}
		return state;
	
	}

	//���� �θ� �� �ڽ��� ī��Ʈ
	public int countOrderNoSameParent(CommentDTO commentDTO) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int state = 0;
		try {
			conn = DBConnUtil.getConnection();
			//todo..
			
			String sql = "SELECT COUNT(*) FROM comment WHERE parentReplyId=?";
			ps = conn.prepareStatement(sql);			
			ps.setLong(1, commentDTO.getParentReplyId());
			rs = ps.executeQuery();
			
			if(rs.next()) {
				state= rs.getInt(1);
			}
			//todo..			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnUtil.close(conn, ps, rs);
		}
		return state;
	}
	
	public void addReplyComment(Map<String, Object> map) throws Exception {
		int orderIDX = getNewOrderNo(map);
		map.put("ORDER_IDX",orderIDX);
		
		if(orderIDX > 0) {
			updateOrderByGroupId(map);
		}
		
		
		insert("sample.insertCategory", map);
		
		return insertReply(map)>0;

	}
	
	//orderNo
	private int getNewOrderNo(Map<String, Object> map) {
		int maxOrderNo=0;
		//부모댓글 ID값 가져옴 부모댓글이 있을경우
		if((int)map.get("PARENT_IDX")>0) {
			//부모답글  orderNo MAX(orderNo) // 계층 구조 ... 
			/*
			 *  1
			 * 	  1-2
			 * 		1-3
			 * 	  +여기 추가할 때 ... 순방향 조회 필요.
			 */
		/*	
			int newOrderNo = selectMaxOrderNoByParentReplyId(map);
			return newOrderNo+1;
		}
		//부모댓글이0 (답글이 아닐경우)
		else {
			maxOrderNo=selectMaxOrderNo(map);

			//부모가 있을경우
			if(map.getParentReplyId() != 0 ) {
				//현재 나의 orderNo
				int newOrderNo= selectLatestOrderNoByParentReplyId(map);
				return newOrderNo +1;
				//부모 없는 일반댓글일 경우
				return maxOrderNo +1;

			}
		} //첫번째댓글
		return 0;
	}
	*/
}
