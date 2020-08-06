<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
	request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String InputEmail = request.getParameter("InputEmail"); 
	

%>
</head>
<script language="javascript">

</script>
<body>
<script type="text/javascript">
		var InputEmail = '${InputEmail}';
		opener.emailCallBack("<%=InputEmail%>");

		 window.close(); // 브라우저 창 닫기 
		</script>
</body>
</html>