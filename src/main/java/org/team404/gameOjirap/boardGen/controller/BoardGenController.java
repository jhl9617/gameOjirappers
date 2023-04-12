package org.team404.gameOjirap.boardGen.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.team404.gameOjirap.boardGen.model.service.BoardGenService;
import org.team404.gameOjirap.boardGen.model.service.CommentService;
import org.team404.gameOjirap.boardGen.model.vo.BoardGen;
import org.team404.gameOjirap.common.board.Comment;
import org.team404.gameOjirap.common.FileNameChange;
import org.team404.gameOjirap.common.Paging;

@Controller
public class BoardGenController {
	private static final Logger logger = LoggerFactory.getLogger(BoardGenController.class);
		
	@Autowired
	private BoardGenService boardService;
	
	@Autowired
	private CommentService commentService;  //댓글 서비스 의존성 주입
	

	/*
	 * 게시 원글 쓰기 페이지로 이동 처리용
	 */
	@RequestMapping("bgwriteform.do")
	public String moveBoardWriteForm() {
		return "boardGen/boardWriteForm";
	}
	
	/*
	 *게시글 페이지 단위로 목록보기 요청 처리용 
	 */
	    
	   @RequestMapping("blist.do")
	   public ModelAndView boardListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

	      int currentPage = 1;
	      if (page != null) {
	         currentPage = Integer.parseInt(page);
	      }
	      
	      int limit = 10; // 한 페이지에 출력할 목록 갯수
	      // 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
	      int listCount = boardService.selectListCount();
		   String url = "blist.do";
	      Paging paging = new Paging(listCount, currentPage, limit, url);
	      paging.calculator();

	      ArrayList<BoardGen> list = boardService.selectList(paging);

	      if (list != null && list.size() > 0) {
	         mv.addObject("list", list);
	         mv.addObject("paging", paging);

	         mv.setViewName("boardGen/boardListView");
	      } else {
	         mv.addObject("message", currentPage + " 페이지 목록 조회 실패!");
	         mv.setViewName("common/error");
	      }

	      return mv;
	   }
	
	/*
	 * 게시글 상세보기용
	 */
	@RequestMapping("boardDetailView.do")
	public ModelAndView boardDetailView(ModelAndView mv, @RequestParam("board_no") int board_no,
			@RequestParam(name="page", required=false) String page  
		                                            ) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		boardService.updateBoardReadCount(board_no);  //조회수 1증가 처리
		
		BoardGen boardGen = boardService.selectOne(board_no); //해당 게시글 조회
		
		ArrayList<Comment> comment = commentService.selectCommentList(board_no); //해당 댓글 조회
		
		if(boardGen != null) {
			mv.addObject("boardGen", boardGen);
			mv.addObject("currentPage", currentPage);
			
		}
		
		  if(comment != null) { 
	      mv.addObject("comment", comment);
	   
		}
		 
		
		if(mv.isEmpty()) {
			mv.addObject("message", board_no + "번 글은 삭제된 게시글 입니다.");
			mv.setViewName("common/error");
			return mv;
		}else {
			mv.setViewName("boardGen/boardDetailView");
			return mv;
			
		}
	}

	
	/*
	 * 게시글 삭제용(첨부파일 포함)
	 */
	@RequestMapping("bgdelete.do")
	public String deleteQuizMethod(@RequestParam("board_no") int board_no, 
						@RequestParam(name="board_refile", required=false) String refile, HttpServletRequest request, Model model) {

        if(boardService.deleteBoard(board_no) > 0) {
        	
        	if(refile != null) {
				//공지사항 첨부파일 저장 폴더 경로 지정
        		String savePath = request.getSession()
						.getServletContext().getRealPath(
							"resources/boardGen_upfiles");
				
				new File(savePath + "\\" + refile).delete();
        	}
        	
            return "redirect:blist.do";
        }else {
            model.addAttribute("message","다시 시도하여 주십시오.");
            return "common/error";
        }
    }
	
	/*
	 * 첨부파일 다운로드 요청 처리용
	 */
	@RequestMapping("bgfiledown.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request,
			@RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName) {
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/boardGen_upfiles");
		File renameFile = new File(savePath + "\\" + renameFileName);
		File originFile = new File(originalFileName);
		
		mv.setViewName("filedown");
		mv.addObject("renameFile", renameFile);
		mv.addObject("originFile", originFile);
		
		return mv;
	}
	
	
	/*
	 * 게시글 등록 요청 처리용(첨부파일 기능 사용)
	 */
	@RequestMapping(value = "bginsert.do", method =RequestMethod.POST)
	public String boardInsertMethod(BoardGen boardGen, Model model, HttpServletRequest request,
								@RequestParam(name="upfile", required=false) MultipartFile mfile) {
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/boardGen_upfiles");
		
		if(!mfile.isEmpty()) {
			
			String fileName = mfile.getOriginalFilename(); //전송온 파일 이름 추출
			
			if(fileName != null && fileName.length() > 0) {
				
				String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				
				logger.info("첨부파일명 확인 : " + fileName + ", " + renameFileName);
				
				//폴더에 저장처리
				try {
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "다시 시도하여 주십시오.");
					return "common/error";
				}
				
				boardGen.setBoard_orifile(fileName);
				boardGen.setBoard_refile(renameFileName);
			} //이름 바꾸기
		} //새로운 첨부파일이 있을 때
		
		if(boardService.insertBoard(boardGen) > 0) {
			
			return "redirect:blist.do";
		} else {
			model.addAttribute("message", "새 게시글 등록 실패");
			return "common/error";
		}
	}
	
	/*
	 * 수정 페이지로 이동 처리용
	 */
	@RequestMapping("bgupdate.do")
	public String boardUpdateMethod(@RequestParam("board_no") int board_no,
			@RequestParam("page") int currentPage, Model model) {
		
		BoardGen boardGen = boardService.selectOne(board_no);
		
		if(boardGen != null) {
			model.addAttribute("boardGen", boardGen);
			model.addAttribute("currentPage", currentPage);
			
			return "boardGen/boardUpdateForm";
		}else {
			model.addAttribute("message", board_no + "번 글 수정실패");
			return "common/error";
		}
	}
	
	/*
	 * 게시글 수정 요청 처리용 (파일첨부 기능 사용)
	 */
	@RequestMapping(value="bgoriginup.do", method=RequestMethod.POST)
	public String boardUpdateMethod(BoardGen boardGen, Model model, HttpServletRequest request
			,@RequestParam("page") int page 
			,@RequestParam(name="delfile", required = false) String delFile,
			@RequestParam(name="upfile", required = false) MultipartFile mfile) {
		logger.info("파일 첨부 성공" + boardGen);
		String savePath = request.getSession()
				.getServletContext().getRealPath("resources/boardGen_upfiles");

		// 첨부파일이 수정 처리된 경우 ---------------------------
		// 1. 원래 첨부파일이 있는데 '파일삭제'를 선택한 경우
		if (boardGen.getBoard_orifile() != null && delFile != null 
					&& delFile.equals("yes")) {
			// 저장 폴더에 있는 파일을 삭제함
			new File(savePath + "\\" + 
					boardGen.getBoard_refile()).delete();
			
			boardGen.setBoard_orifile(null);
			boardGen.setBoard_refile(null);
		}

		// 새로운 첨부파일이 있을때
		if (!mfile.isEmpty()) {
			// 2-1. 이전 첨부파일이 있을 때
			if (boardGen.getBoard_orifile() != null) {
				// 저장 폴더에 있는 이전 파일을 삭제함
				new File(savePath + "\\" + boardGen.getBoard_refile()).delete();
				// board 의 이전 파일 정보도 제거함
				boardGen.setBoard_orifile(null);
				boardGen.setBoard_refile(null);
			}

			// 2-2. 이전 첨부파일이 없을 때
			// 전송온 파일이름 추출함
			String fileName = mfile.getOriginalFilename();

			// 다른 게시글의 첨부파일과 파일명이 중복되어서
			// 덮어쓰기 되는것을 막기 위해, 파일명을 변경해서
			// 폴더에 저장하는 방식을 사용할 수 있음
			// 변경 파일명 : 년월일시분초.확장자
			if (fileName != null && fileName.length() > 0) {

				String renameFileName = 
						FileNameChange.change(
							fileName, "yyyyMMddHHmmss");

				logger.info("첨부 파일명 확인 : " + fileName + ", " + renameFileName);

				// 폴더에 저장 처리
				try {
					mfile.transferTo(new File(savePath + 
							"\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일 저장 실패!");
					return "common/error";
				}

				// board 객체에 첨부파일 정보 기록 저장
				boardGen.setBoard_orifile(fileName);
				boardGen.setBoard_refile(renameFileName);
			} // 이름바꾸기
		} // 새로운 첨부파일이 있을 때

		if (boardService.updateBoard(boardGen) > 0) {
			// 게시원글 수정 성공시 상세보기 페이지로 이동
			model.addAttribute("page", page);
			model.addAttribute("board_no", boardGen.getBoard_no());
			return "redirect:boardDetailView.do";
		} else {
			model.addAttribute("message", boardGen.getBoard_no()
					+ "번 공지 수정 실패!");
			return "common/error";
		}
	}

	//파일 다운용
	@RequestMapping("bfdown.do")
	public ModelAndView fileDown(ModelAndView mv, HttpServletRequest request,
								 @RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName){
		// 저장폴더 path 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/boardGen_upfiles");

		// 읽은 파일 이름에 대한 객체 생성
		File renameFile = new File(savePath + "//" + renameFileName);
		// 다운시 다시 원래이름으로 변경
		File originFile = new File(originalFileName);

		// 다운로드 뷰로 전달할 정보 저장
		mv.setViewName("filedown");
		mv.addObject("renameFile", renameFile);
		mv.addObject("originFile", originFile);
		return mv;
	}

		
		
	
	/*
	 * 제목으로 게시글 검색용
	 */
	@RequestMapping(value="bgsearchTitle.do", method=RequestMethod.POST)
	public String searchByTitleMethod(@RequestParam("search") String search, Model model) {
		
		ArrayList<BoardGen> list = boardService.selectBoardByTitle(search);
		
		if(list != null && list.size() > 0) {
			
			model.addAttribute("list", list);
			return "boardGen/boardListView";
		}else {
			model.addAttribute("message", "다시 시도하여 주십시오.");
			return "common/error";
		}
	}

	/*댓글 insert*/
	@RequestMapping(value="genReplyWrite.do", method=RequestMethod.POST)
	public ModelAndView insertReplyMethod(ModelAndView mv, @RequestParam("board_no") int board_no,
										  @RequestParam(name = "page", required = false) String page,
										  @RequestParam("user_id") String user_id, @RequestParam("reply_contents") String board_contents) {
		Comment comment = new Comment(board_contents, board_no, user_id);
		if(boardService.genReplyWrite(comment) > 0) {
			mv.addObject("board_no", board_no);
			mv.addObject("page", page);
			mv.addObject("user_id", user_id);
			mv.setViewName("redirect:boardDetailView.do");
		}else {
			mv.addObject("board_no", board_no);
			mv.addObject("page", page);
			mv.addObject("message", "댓글 등록에 실패했습니다.");
			mv.setViewName("redirect:boardDetailView.do");
		}
		return mv;
	}

}