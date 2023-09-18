<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <link href="../../img/logo1.ico" rel="shortcut icon" type="image/x-icon">
    <script src="https://kit.fontawesome.com/f399b95bac.js" crossorigin="anonymous"></script>
    <title>당근맛집 게시판</title>
</head>
<body>
<section class="wrapper">
    <header id="header">
        <div class="container">
            <div class="header-left">
                <h1 class="brand">C</h1>
            </div>
            <form method="post" class="keyword-search keyword-search-main"  action="../../controller/boardListPageController.jsp">
                <label for="search">
                    <input type="text" name="search" id="search" class="searchText" placeholder="지역, 음식, 레스토랑명 검색" required value >
                </label>
                <button type="submit" class="searchButton">
                    <i class="fa-solid fa-magnifying-glass" style="color: #e2520f;"></i>
                </button>
            </form>
            <button class="menu">
                <i class="fa-solid fa-bars" style="color: #e2520f;"></i>
            </button>
        </div>
    </header>
    <section class="category">
        <div id="container-category">
            <button type="button" class="btn-category" onclick="location.href='./index.html'">홈</button>
            <button type="button" class="btn-category" onclick="location.href='./boardListPage.html'">게시판</button>
            <button type="button" class="btn-category" onclick="location.href='./boardPage.html'">게시글 작성</button>
        </div>
    </section>

    <main>
        <section class="timeLine-body">
            <div id="List">

            </div>
        </section>
    </main>
</section>
<script src="boardListPage.js"></script>
</body>
</html>
