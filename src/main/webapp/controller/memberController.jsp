<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*" %>



<%
    if(request.getMethod().equals("POST")) {
        request.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        MemberDAO memberDAO = new MemberDAO();

        if(command != null && command.equals("myLog")) {
            if(session.getAttribute("userId") == null) {
                pageContext.forward("/WEB-INF/views/login.jsp");
            }
            else {
                String userId = (String)session.getAttribute("userId");
                request.setAttribute("member", memberDAO.getMember(userId));
                pageContext.forward("/WEB-INF/views/myPage.jsp");
            }
        }

        // login 기능
        else if(command != null && command.equals("login")){
            String script = "";
            String userId = request.getParameter("userId");
            int result = memberDAO.isLogin(userId, request.getParameter("password"));
            switch(result) {
                case 1 :
                    session.setAttribute("userId",userId);
                    response.sendRedirect("boardPageController.jsp");
                    break;
                case 0 : script = "alert('비밀번호가 틀립니다.');";
                    break;
                case-1 : script = "alert('존재하지 않는 아이디입니다.');";
                    break;
                case-2 : script = "alert('데이터베이스 오류입니다.');";
                    break;
            }

        }
        else if(command != null && command.equals("join")) {
            pageContext.forward("/WEB-INF/views/join.jsp");
        }

        // 회원가입 기능
        else if(command != null && command.equals("insertMember")) {
            MemberDO memberDO = new MemberDO();
            memberDO.setUserId(request.getParameter("userId"));
            memberDO.setPassword(request.getParameter("password"));
            memberDO.setEmail(request.getParameter("email"));
            memberDO.setName(request.getParameter("name"));
            memberDO.setGender(request.getParameter("gender"));
            memberDO.setArea(request.getParameter("area"));
            memberDAO.insertMember(memberDO);
            pageContext.forward("/WEB-INF/views/login.jsp");
        }
        // 회원 정보 수정
        else if(command != null && command.equals("updateMember")) {

            MemberDO memberDO = new MemberDO();
            memberDO.setUserId(request.getParameter("userId"));
            memberDO.setPassword(request.getParameter("password"));
            memberDO.setEmail(request.getParameter("email"));
            memberDO.setName(request.getParameter("name"));
            memberDO.setGender(request.getParameter("gender"));
            memberDO.setArea(request.getParameter("area"));

            memberDAO.updateMember(memberDO);
            session.invalidate();
            pageContext.forward("/WEB-INF/views/login.jsp");
        }
        else if(command != null && command.equals("deleteMember")) {
            String userId = request.getParameter("userId");
            String password = request.getParameter("password");
            System.out.println(userId);
            System.out.println(password + "Test");
            if(memberDAO.deleteMember(userId, password) == 1) {
                session.invalidate();
                pageContext.forward("/WEB-INF/views/login.jsp");
            } else {
                pageContext.forward("/WEB-INF/views/myPage.jsp");
            }
        }

    }

    // memberController 기본화면
    else {
        pageContext.forward("/WEB-INF/views/login.jsp");
    }
%>
