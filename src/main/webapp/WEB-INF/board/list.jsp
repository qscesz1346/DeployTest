<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="/resources/includes/link.jsp" %>
<link rel="stylesheet" href="resources/css/common.css" >

</head>
<body>

	<div class="container-md" id=wrapper style="margin:100px auto;">
		<!-- TopMenu -->
		<%@include file="/resources/includes/topmenu.jsp" %>
			
		<!-- NAV -->
		<%@include file="/resources/includes/nav.jsp" %>
		
		<!-- MainContents -->
		<div id=maincontents style=margin-top:15px;">
			
			<!-- PagePath -->
			<div>
				<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
					<ol class="breadcrumb">
					    <li class="breadcrumb-item"><a href="#">Home</a></li>
					    <li class="breadcrumb-item active" aria-current="page">Board</li>
					</ol>
				</nav>
			</div>
			
			<h1>자유 게시판</h1>
			
			<%
				//list구성에 사용되는 변수들 
				
				int totalcount=0;	//전체 게시물 수
				int numPerPage=10;	//페이지당 표시할 게시물 수
				
				int totalPage=0;	//전체 페이지 수
				int nowPage=1;		//현재 페이지 번호
				
				int start=1;		//게시물 읽을때 사용되는 시작 값
				int end =10;		//게시물 읽을때 사용되는 끝 값
				
				int pagePerBlock=15;	//블럭당 표시할 페이지 수
				int totalBlock=0;		//전체 페이징 블럭 수 
				int nowBlock=1;			//현재 페이징 블럭 수 
			%>
			
			<%
				totalcount = (int)request.getAttribute("tcnt");	//전체 게시물 수 받기
				totalPage = (int)Math.ceil(totalcount/numPerPage);	//전체 페이지 수 계산 
				
				//전체 블럭수 계산
				totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
				//현재 블럭숫자 계산 
				nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);
			%>
			
			
			
			<!-- 현재페이지/전체페이지 -->
			<table class="table">
				<tr >
					<td style=border:0px;>1 / <%=totalPage %> Page</td>
					<td style=border:0px;text-align:right;>
						<button class="btn btn-secondary">처음으로</button>
						<button class="btn btn-secondary">글쓰기</button>
					</td>
				</tr>
			</table>
			
			<table class="table">
				<tr>
					<th> NO </th>
					<th> TITLE </th>
					<th> WRITER</th>
					<th> Date</th>
					<th> COUNT</th>
				</tr>
				
				<%@page import="java.util.*,com.korea.dto.*" %>
				<%
					ArrayList<BoardDTO> list = (ArrayList<BoardDTO>)request.getAttribute("list");
					for(int i=0;i<list.size();i++)
					{
				%>
				<tr>
					<td><%=list.get(i).getNo() %></td>
					<td><%=list.get(i).getTitle() %></td>
					<td><%=list.get(i).getWriter() %></td>
					<td><%=list.get(i).getRegdate() %></td>
					<td><%=list.get(i).getCount() %></td>
				</tr>
				<%
					}
				%>
				



				<tr>
					<!-- 페이지네이션 -->
					<td colspan=5  style=border-bottom:0px;>
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <!-- 이전으로 -->
						    <%
						    if(nowBlock>1)
						    {
						    %>
							    <li class="page-item">
							      <a class="page-link" href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
						    <%
						    }
						    %>
						    
						    <%
						    int pageStart=(nowBlock-1)*pagePerBlock+1;
						    int pageEnd=((pageStart+(pagePerBlock-1))<totalPage)?(pageStart+(pagePerBlock-1)):totalPage;
						    %>
						    <!--페이지 번호 -->
						    
						    <%
						    for( ;pageStart<=pageEnd;pageStart++)
						    {
						    %>
						    	<li class="page-item"><a class="page-link" href="#"><%=pageStart %></a></li>
						    	
							<%
						    }
							%>
						   
						   <!-- 다음으로  -->
						   <% 
							if(totalBlock > nowBlock)
							{
						   %>
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						    <%
							}
						    %>
						    
						
						  </ul>
						</nav>
					</td>
					
				</tr>
			</table>
			
			
		</div>
		
		<!-- Footer -->
		
	
	</div>


</body>
</html>