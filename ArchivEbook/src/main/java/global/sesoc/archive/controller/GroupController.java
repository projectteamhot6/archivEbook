package global.sesoc.archive.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.archive.dao.GroupDAO;
import global.sesoc.archive.vo.CommunityVO;
import global.sesoc.archive.vo.GroupBoardVO;
import global.sesoc.archive.vo.GroupReplyVO;
import global.sesoc.archive.util.PageNavigator;

@Controller
public class GroupController {

	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Autowired
	GroupDAO dao;

	// 게시판 관련 상수값들
	final int pagePerGroup = 5; // 페이지 이동 그룹 당 표시할 페이지 수
	
	final int GroupPerPage = 5; // 페이지 당 글 수

	@RequestMapping(value = "groupList", method = RequestMethod.GET)
	public String groupList(HttpSession session, Model model
			, @RequestParam(value="page", defaultValue="1") int page) {
		
		int total = dao.getTotalList();
		PageNavigator pageNavigator 
		= new PageNavigator(GroupPerPage, pagePerGroup, page, total);
		
		ArrayList<CommunityVO> list = null;
		list = dao.groupList(pageNavigator.getStartRecord(), pageNavigator.getCountPerPage());
		logger.debug("{}",list);
		String id = (String) session.getAttribute("loginId");
		CommunityVO vo = null;
		ArrayList<CommunityVO> vo2 = null;
		
		if(id != null && id.equals("")){
			vo = dao.searchGm(id);
			model.addAttribute("gm", vo);
			vo2 = dao.getMember(id);
		}

		if (vo != null) {
			session.setAttribute("groupname", vo.getGroupname());
		}

		for (int i = 0; i < list.size(); i++) {
			if (vo2 != null) {
				for (int j = 0; j < vo2.size(); j++) {
					if (list.get(i).getGroupnum() == vo2.get(j).getGroupnum()) {

						list.get(i).setNickname("O");

					}
				}
			}
		}
		session.setAttribute("navi3", pageNavigator);
		model.addAttribute("list_group", list);

		return "groupList";
	}

	@RequestMapping(value = "groupBoard", method = RequestMethod.GET)
	public String groupBoard(int groupnum, HttpSession session, Model model) {
		ArrayList<GroupBoardVO> boardList = null;
		boardList = dao.groupBoard(groupnum);
		model.addAttribute("boardList", boardList);
		String id = (String) session.getAttribute("loginId");
		ArrayList<CommunityVO> vo = null;
		vo = dao.getMember(id);
		if (vo != null) {

			for (int i = 0; i < vo.size(); i++) {
				if (vo.get(i).getGroupnum() == groupnum) {
					model.addAttribute("loginGroupNum", vo);
				}
			}
		}
		session.setAttribute("groupnum", groupnum);
		
		return "groupBoard";
	}

	@RequestMapping(value = "groupBoardRead", method = RequestMethod.GET)
	public String groupBoardRead(int bnum_group, HttpSession session, Model model) {

		GroupBoardVO result = null;
		result = dao.groupBoardRead(bnum_group);
		if (result != null) {
			model.addAttribute("boardId", result.getId());
			model.addAttribute("result", result);
		}

		ArrayList<GroupReplyVO> replylist = dao.groupReplyList(bnum_group);
		if (replylist != null) {
			model.addAttribute("replylist", replylist);
		}

		return "groupBoardRead";
	}

	@RequestMapping(value = "makeGroup", method = RequestMethod.GET)
	public String makeGroupForm(HttpSession session, Model model) {
		return "makeGroupForm";
	}

	@RequestMapping(value = "makeGroup", method = RequestMethod.POST)
	public String makeGroup(CommunityVO community, HttpSession session, Model model) {
		logger.debug("{}",community);
		String id = (String) session.getAttribute("loginId");
		String nickname = (String) session.getAttribute("loginNickname");
		int result2 = dao.checkMaster(id);
		if(result2 != 0){
			return "redirect : /";
		}
		community.setId(id);
		community.setNickname(nickname);

		int result = 0;
		result = dao.makeGroup(community);
		int res = 0;
		res = dao.inputGu(community);

		return "redirect:groupList";
	}
	
	@ResponseBody
	@RequestMapping(value="checkMaster", method=RequestMethod.GET)
	public String checkMaster(HttpSession session){
		int result = 0;
		String id = (String)session.getAttribute("loginId");
		result = dao.checkMaster(id);
		return ""+result;
	}

	@RequestMapping(value = "joinGroup", method = RequestMethod.GET)
	public String joinGroupForm(CommunityVO community, int groupnum, HttpSession session, Model model) {

		String id = (String) session.getAttribute("loginId");
		String nickname = (String) session.getAttribute("loginNickname");
		String groupname = dao.groupName(groupnum);

		community.setId(id);
		community.setNickname(nickname);
		community.setGroupnum(groupnum);
		community.setGroupname(groupname);

		int result = 0;
		result = dao.joinGroup(community);

		return "redirect:groupList";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String groupWriteForm(HttpSession session, Model model) {
		return "groupWriteForm";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(GroupBoardVO board, HttpSession session, Model model) {
		String id = (String) session.getAttribute("loginId");

		int groupnum = (int) session.getAttribute("groupnum");

		String nickname = (String) session.getAttribute("loginNickname");

		String groupname = dao.groupName(groupnum);
		board.setId(id);
		board.setGroupnum(groupnum);
		board.setGroupname(groupname);
		board.setNickname(nickname);

		int result = 0;
		result = dao.write(board);
		return "redirect:groupBoard?groupnum=" + groupnum;
	}

	@RequestMapping(value = "groupDelete", method = RequestMethod.GET)
	public String groupDelete(int bnum_group, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		int groupnum = (int) session.getAttribute("groupnum");
		GroupBoardVO board = new GroupBoardVO();
		board.setId(id);
		board.setBnum_group(bnum_group);
		int result = dao.groupDelete(board);
		return "redirect:groupBoard?groupnum=" + groupnum;
	}

	@RequestMapping(value = "groupUpdate", method = RequestMethod.GET)
	public String groupUpdateForm(int bnum_group, Model model) {
		model.addAttribute("updateBoard", dao.groupBoardRead(bnum_group));
		return "groupUpdateForm";
	}

	@RequestMapping(value = "groupUpdate", method = RequestMethod.POST)
	public String groupUpdate(GroupBoardVO board, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		int groupnum = (int) session.getAttribute("groupnum");
		board.setId(id);
		int result = dao.groupUpdate(board);
		return "redirect:groupBoard?groupnum=" + groupnum;
	}

	@RequestMapping(value = "replyWrite", method = RequestMethod.POST)
	public String replyWrite(GroupReplyVO reply, int bnum_group, Model model, HttpSession session) {
		int groupnum = dao.searchGn(bnum_group);
		String groupname = dao.groupName(groupnum);
		String id = (String) session.getAttribute("loginId");
		String nickname = (String) session.getAttribute("loginNickname");
		reply.setGroupnum(groupnum);
		reply.setId(id);
		reply.setNickname(nickname);

		int result = dao.replyWrite(reply);
		if (result == 0) {
			return "redirect:groupBoard?groupnum=" + groupnum;
		} else {
			return "redirect:groupBoardRead?bnum_group=" + reply.getBnum_group();
		}
	}

	@RequestMapping(value = "groupReplyDelete", method = RequestMethod.GET)
	public String groupReplyDelete(int rnum_group, HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		GroupReplyVO vo = null;
		vo.setId(id);
		vo.setRnum_group(rnum_group);
		int bnum_group = dao.searchBn(vo);
		
		GroupReplyVO reply = new GroupReplyVO();
		reply.setId(id);
		reply.setBnum_group(bnum_group);
		reply.setRnum_group(rnum_group);
		
		int result = dao.groupReplyDelete(reply);
		return "redirect:groupBoardRead?bnum_group=" + bnum_group;
	}
}