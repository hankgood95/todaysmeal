<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/* Header 시작 */

div {
    display: block; /* 줄바꿈 */
  }
  
  header {
    display: block;
  }
  
  .hd_header {
    position: relative;
    width: 100%;
  }
  
  .hd_header .header {
    position: relative;
    top: 0;
    width: 100%;
  }
  
  .hd_header .header .logo{
    width: 100%;
    text-align: center;
    font-size: 0;
  }
  
  .hd_header .header .logo a img {
    max-width: 500px;
    max-height: 500px;
  }
  
  .hd_header .header_sec {
    position: relative;
    width: 100%;
    margin: 0 auto;
  }
  
  .hd_header .header .gnb {
    position: absolute;
    bottom: 0;
    width: 100%;
    font-size: 0;
    vertical-align: top;
    text-align: center;
  }
  
  .hd_header .header .gnb .swiper-container {
    display: inline-block;
    max-width: 555px;
    overflow: hidden;
  }
  
  .swiper-container {
    margin-left: auto;
    margin-right: auto;
    position: relative;
    list-style: none;
    padding: 0;
  }
  
  .swiper-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    box-sizing: content-box;
  }
  
  .hd_header .header .gnb_list {
    display: inline-block;
    vertical-align: top;
  }
  
  .hd_header .header .gnb_list-name {
    display: block;
    padding: 18px 20px;
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    white-space: nowrap;
  }
  
  a {
    color: #1c1c1c;
    text-decoration: none;
    background-color: transparent;
  }
  
  /* Header 끝 */
</style>
</head>

<body>
	<header id="header" class="hd_header">
        <div class="header">
          <div class="header_inner">
            <div class="header_sec">
              <h1 class="logo">
                <a href="#">
                  <img src="${pageContext.servletContext.contextPath}/resources/main/img/index.png" alt="greating">
                </a>
              </h1>
              <!-- 네비게이션 바 -->
              <div class="gnb">
                
                  <div class="swiper-container">
                    <div class="swiper-wrapper">
                      <li class="gnb_list">
                        <a href="#" class="gnb_list-name">홈</a>
                      </li>
                      <li class="gnb_list">
                        <a href="#" class="gnb_list-name">Meal베스트</a>
                      </li>
                      <li class="gnb_list">
                        <a href="#" class="gnb_list-name">오늘의식사</a>
                      </li>
                      <li class="gnb_list">
                        <a href="#" class="gnb_list-name">투밀투표</a>
                      </li>
                    </div>
                  </div>
              </div>
              <hr>
            </div>
          </div>
        </div>
    </header>
</body>
</html>