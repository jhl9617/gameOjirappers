package org.team404.gameOjirap.board.controller;

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
import org.team404.gameOjirap.board.model.service.BoardService;
import org.team404.gameOjirap.board.model.vo.BoardGen;
import org.team404.gameOjirap.common.FileNameChange;
import org.team404.gameOjirap.common.Paging;

@Controller
public class BoardController {
	private static final Logger logger = 
			LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
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
	// 게시글 페이지 단위로 목록보기 요청 처리용
	   @RequestMapping("blist.do")
	   public ModelAndView boardListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

	      int currentPage = 1;
	      if (page != null) {
	         currentPage = Integer.parseInt(page);
	      }
	      
	      int limit = 10; // 한 페이지에 출력할 목록 갯수
	      // 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
	      int listCount = boardService.selectListCount();
	      Paging paging = new Paging(listCount, currentPage, limit);
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
			@RequestParam(name="page", required=false) String page) {
		int currentPage = 1;
//		if(page != null) {
//			currentPage = Integer.parseInt(page);
//		}
		//boardService.updateBoardReadCount(board_no);  //조회수 1증가 처리
		
		BoardGen boardGen = boardService.selectOne(board_no); //해당 게시글 조회
		
		if(boardGen != null) {
			mv.addObject("boardGen", boardGen);
			mv.addObject("currentPage", currentPage);
			
			mv.setViewName("boardGen/boardDetailView");
		}else {
			mv.addObject("message", board_no + "번 글은 삭제된 게시글 입니다.");
			mv.setViewName("common/error");
		}
		
		return mv;
		
	}
	
	/*
	 * 게시글 삭제용(첨부파일 포함)
	 */
	@RequestMapping("bgdelete.do")
	public String deleteQuizMethod(@RequestParam("board_no") int board_no, 
						@RequestParam(name="rfile", required=false) String refile, HttpServletRequest request, Model model) {

        if(boardService.deleteBoard(board_no) > 0) {
        	
        	if(refile != null) {
				//공지사항 첨부파일 저장 폴더 경로 지정
        		String savePath = request.getSession()
						.getServletContext().getRealPath(
							"resources/boardGen_uploadfile");
				
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
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/boardGen_uploadfile");
		File renameFile = new File(savePath + "\\" + renameFileName);
		File originFile = new File(originalFileName);
		
		mv.setViewName("filedown");
		mv.addObject("renameFile", renameFile);
		mv.addObject("origin", originFile);
		
		return mv;
	}
	
	
	/*
	 * 게시글 등록 요청 처리용(첨부파일 기능 사용)
	 */
	@RequestMapping(value = "bginsert.do", method ={ RequestMethod.GET, RequestMethod.POST })
	public String boardInsertMethod(BoardGen boardGen, Model model, HttpServletRequest request,
								@RequestParam(name="upfile", required=false) MultipartFile mfile) {
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/boardGen_uploadfile");
		
		
//		if(!mfile.isEmpty()) {
//			
//			String fileName = mfile.getOriginalFilename(); //전송온 파일 이름 추출
//			
//			if(fileName != null && fileName.length() > 0) {
//				
//				String renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
//				
//				logger.info("첨부파일명 확인 : " + fileName + ", " + renameFileName);
//				
//				//폴더에 저장처리
//				try {
//					mfile.transferTo(new File(savePath + "\\" + renameFileName));
//				} catch (Exception e) {
//					e.printStackTrace();
//					model.addAttribute("message", "첨부파일 저장 실패");
//					return "common/error";
//				}
//				
//				boardGen.setBoard_orifile(fileName);
//				boardGen.setBoard_refile(renameFileName);
//			} //이름 바꾸기
//		} //새로운 첨부파일이 있을 때
		
		if(boardService.insertBoard(boardGen) > 0) {
			
			return "redirect:blist.do";
		} else {
			model.addAttribute("message", "새 게시글 등록 실패");
			return "common/error";
		}
	}
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
	 * 제목으로 게시글 검색용
	 */
	@RequestMapping(value="bgsearchTitle.do", method=RequestMethod.POST)
	public String searchByTitleMethod(@RequestParam("search") String search, Model model) {
		
		ArrayList<BoardGen> list = boardService.selectBoardByTitle(search);
		
		if(list != null && list.size() > 0) {
			
			model.addAttribute("list", list);
			return "boardGen/boardListView";
		}else {
			model.addAttribute("message", "제목으로 검색 실패");
			return "common/error";
		}
	}
	
	
	@RequestMapping("bfdown.do")
	public ModelAndView boardfileDownMethod(ModelAndView mv, HttpServletRequest request,
			@RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName) {
		// 공지사항 첨부파일 저장폴더에 대한 경로(path) 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/boardGen_uploadfile");

		// 저장 폴더에서 읽을 파일에 대한 파일 객체 생성함
		File renameFile = new File(savePath + "\\" + renameFileName);
		// 파일 다운시 내보낼 원래 이름의 파일 객체 생성함
		File originFile = new File(originalFileName);

		// 파일 다운로드 뷰로 전달할 정보 저장
		mv.setViewName("filedown"); // 등록된 파일다운로드 뷰의 id명
		mv.addObject("renameFile", renameFile);
		mv.addObject("originFile", originFile);

		return mv;
	}
}















