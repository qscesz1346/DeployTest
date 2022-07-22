package com.korea.controller.board;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.dto.ReplyDTO;
import com.korea.service.BoardService;

public class BoardReplylistController implements SubController{

	BoardService service = BoardService.getInstance();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		//읽고 있는 게시물의 모든 댓글 출력
		HttpSession session = req.getSession();
		BoardDTO dto = (BoardDTO)session.getAttribute("dto");
		
		ArrayList<ReplyDTO> list = service.getReplylist(dto.getNo());		
		
		
		try {
			PrintWriter out = resp.getWriter();
			
			for(int i=0;i<list.size();i++) {
				
				out.println(list.get(i).getWriter()+" ");
				out.println(list.get(i).getRegdate()+" ");
				out.println(list.get(i).getContent()+"\n");
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
