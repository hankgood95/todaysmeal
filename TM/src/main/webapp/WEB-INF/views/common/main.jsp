<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
  text-align:center;
}

div {
  font-size: 30px;
  text-align: center;
}


/* Main Layout */

#container {
  display: grid;
  grid-template-columns: 3fr 1fr;
  margin-left: 100px;
  margin-right: 100px;
  margin-bottom: 17px;
  max-width: 100%;
}

/* left side */

#container .left_content {
  min-width: 400px;
  min-height: 500px;
  background-color: bisque;
  margin-right: 10px;
}

/* right side */

#container .right_content {
  margin-left: 20px;
  min-height: 500px; 
}

#container .right_content .vote_rank {
  padding: 0px 0 0px;
}

#container .right_content .vote_rank a img {
  max-width: 230px;
  max-height: 230px;
  margin-left: -17px;
}

.content_box {
  position: relative;
  margin-top: -15px;
  border: 1px solid black;
  color: #333;
  height: 360px;
  max-width: 100%;
}

.box_tit {
  position: relative;
  padding: 16px 0 12px;
  margin: 0 13px;
}

.box_tit .tit {
  font-size: 17px;
}

.content_box .box_tit .tit {
  display: block;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  font-weight: bold;
  text-align: center;
}

.content_box2 {
  position: relative;
  margin-top: 15px;
  color: #333;
  height: 100px;
}

.box_tit2 {
  position: relative;
  padding: 0px 0 12px;
  margin: 0 13px;
}

.box_tit2 .tit2 {
  font-size: 17px;
  display: block;
  font-weight: bold;
}

.box_tit2 .tit2_s {
  position: relative;
  font-weight: normal;
  font-size: 13px;
  top: -10px;
}

ul#box_list, ol#box_list {
  list-style: none;
  margin: 0px;
  padding: 0px;
}

ul#box_list li, ol#box_list li {
  padding: 5px 0px 5px 5px;
  margin-bottom: 5px;
  width: 100%;
  border-bottom: 1px solid #efefef;
  font-size: 12px;
  
}

ul#box_list li:last-child,
ol#box_list li:last-child {
    border-bottom: 0px;
}

ul#box_list li:before,
ol#box_list li:before {
    content: "△";
    display: inline-block;
    padding: 0px 5px 6px 0px;
    
}

#box_list {

}

.vote_bar {

}

.vote_member {

}

/* modal */

#Btn_0 {
    all: unset;
    background-color: steelblue;
    color: white;
    padding: 5px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
}

.modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.modal_overlay {
    background-color: rgba(0, 0, 0, 0.6);
    width: 100%;
    height: 100%;
    position: absolute;
}

.modal_content {
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
    background-color: white;
    padding: 50px 100px;
    text-align: center;
    position: relative;
    top: 0px;
    width: 40%;
    border-radius: 10px;
}

.modal .modal_content h1 {
    margin: 0;
    font-size: 30px;
    width: 100%;
}

.modal .modal_content .modal_photo {
    width: 100%;
    
}

.modal .modal_content .modal_photo img {
    margin-top: 20px;
    width: 200px;
    height: 180px;

}

.modal .modal_content .modal_vote {
    width: 100%;
}

.modal .modal_content .modal_vote .Btn_1 {
    margin-top: 30px;
    all: unset;
    background-color: steelblue;
    color: white;
    padding: 5px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 20px;
    
}

/* 그림과 버튼을 하나로 묶고 옆으로 나란히 정렬하기 */

.modal .modal_content .modal_vote .Btn_2 {
    all: unset;
    background-color: steelblue;
    color: white;
    padding: 5px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 20px;
}

.hidden {
    display: none;
}

/* modal끝 */

/* 투표완료풍선 */

.bubble 
	{
        z-index:100;
        position: relative;
        height: auto;
        padding: 10px 10px 10px 10px;
        background: #0A6EFF;
        color: white;
        border-radius: 5px;
        border: #7F7F7F solid 1px;
        position: absolute;
        font-size: 15px;
        text-align: left;
        margin-top: -40px;
        width: 100%;
        text-align: center;
	}
	
	.bubble:after 
	{
        content: '';
        position: absolute;
        border-style: solid;
        border-width: 0 16px 20px 17.5px;
        border-color: #0A6EFF transparent;
        display: block;
        width: 0;
        z-index: 1;
        top: -18.5px; 
        left: 49px; 
	}
	
	.bubble:before 
	{
        content: '';
        position: absolute;
        border-style: solid;
        border-width: 0 16px 20px 17.5px;
        border-color: #7F7F7F transparent;
        display: block;
        width: 0;
        z-index: 0;
        top: -20px;
        left: 49px;
	}

  .bubble_hidden {
    display: none;
  }


/* 투표완료풍선끝 */

</style>

</head>
<body>
	<body>
    <jsp:include page="header.jsp"/>
    <main id="container">
        <section class="left_content">
          <h1>Meal 베스트 TOP 5</h1>
        </section>
        <section class="right_content">
          <div class="vote_rank">
            <a href="#">
              <img src="${pageContext.servletContext.contextPath}/resources/main/img/voterank.png">
            </a>
          </div>
          <article>
            <div class="content_box">
              <div class="box_tit">
                <ul id="box_list">
                  <li>돈카츠</li>
                  <li>일식</li>
                  <li>초밥</li>
                  <li>불닭볶음면</li>
                  <li>밀베</li>
                  <li>까르보나라</li>
                  <li>까나리</li>
                  <li>치킨</li>
                  <li>연어장</li>
                </ul>
              </div>
            </div>
          </article>
          <article>
            <div class="content_box2">
              <div class="box_tit2">
                <h3 class="tit2">투밀 3주차 음식 투표 결과</h3>
                <h4 class="tit2_s">짜장 vs 짬뽕</h4>
                <button id="Btn_0">투표하기</button>
                <div class="bubble bubble_hidden">투표가 완료되었습니다.</div>
                <div class="vote_bar"></div>
                <div class="vote_member"></div>
              </div>
            </div>
          </article>
        </section>
    </main>
    </div>
	<jsp:include page="footer.jsp"/>
    <div class="modal hidden">
      <div class="modal_overlay"></div>
      <div class="modal_content">
        <h1>투밀 3주차 투표</h1>
        <div class="modal_photo">
          <img class="vote1" src="${pageContext.servletContext.contextPath}/resources/main/img/vote1.png" alt="">
          <img class="vote2" src="${pageContext.servletContext.contextPath}/resources/main/img/vote2.png" alt="">
        </div>
        <div class="modal_vote">
          <button class="Btn_1">짜장</button>
          <button class="Btn_2">짬뽕</button>
        </div>
      </div>
    </div>
    <div class="modal2 hidden2">
      <div class="main modal_overlay2">
        <div class="container">
            <input type="text" placeholder="ID" id="id" class="account">
            <input type="password" placeholder="Password" id="password" class="account">
            <button id="login" class="account">login</button>
            <p id="alert" class="account"></p>
            <button class="Btn_close">창닫기</button>
        </div>
      </div>
    </div>
    <script defer src="${pageContext.servletContext.contextPath}/resources/main/js/login.js"></script>
    <script defer src="${pageContext.servletContext.contextPath}/resources/main/js/vote.js"></script>
    <script defer src="${pageContext.servletContext.contextPath}/resources/main/js/ballon.js"></script>
</body>
</body>
</html>