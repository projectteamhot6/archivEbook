package global.sesoc.archive.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.archive.vo.CommunityVO;
import global.sesoc.archive.vo.GroupBoardVO;
import global.sesoc.archive.vo.GroupReplyVO;

public interface GroupMapper {

	// 그룹 리스트
	public ArrayList<CommunityVO> groupList(RowBounds rb);

	// 그룹장 찾기
	public CommunityVO searchGm(String id);

	// 그룹 게시판
	public ArrayList<GroupBoardVO> groupBoard(int groupnum);

	// 그룹 게시판 글 읽기
	public GroupBoardVO groupBoardRead(int bnum_group);

	// 그룹 생성
	public int makeGroup(CommunityVO community);

	// Gu에 정보 넣기
	public int inputGu(CommunityVO community);

	// 그룹 글 쓰기
	public int write(GroupBoardVO board);

	// 그룹 이름 가져오기
	public String groupName(int groupnum);

	// 그룹 가입
	public int joinGroup(CommunityVO community);

	// 그룹에서 아이디로 가입한 그룹번호 가져오기
	public ArrayList<CommunityVO> getMember(String id);

	// 게시글 삭제
	public int groupDelete(GroupBoardVO board);

	// 게시글 수정
	public int groupUpdate(GroupBoardVO board);

	// 전체 글 갯수
	public int getTotal(int groupnum);

	// 페이지 네비게이터
	public ArrayList<GroupBoardVO> boardSelect(RowBounds rb);

	// 그룹번호 찾기
	public int searchGn(int bnum_group);

	// 리플 쓰기
	public int replyWrite(GroupReplyVO reply);

	// 리플 목록
	public ArrayList<GroupReplyVO> groupReplyList(int bnum_group);
	
	// 리플 삭제
	public int groupReplyDelete(GroupReplyVO reply);
	
	// 리플 번호 찾기 
	public int searchRn(String id, int bnum_group);

	public int getTotalList();

	public int searchBn(GroupReplyVO vo);

	public ArrayList<CommunityVO> getListuser(String id);

	public CommunityVO getMaster(int groupnum);
	
	// groupname으로 그룹번호 받아오기 
		public int getGroupNum(String groupname);

}
