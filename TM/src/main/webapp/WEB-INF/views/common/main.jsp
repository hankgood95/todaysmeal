<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Main Layout */

#container {
  display: grid;
  grid-template-columns: 3fr 1fr;
  margin-left: 100px;
  margin-right: 100px;
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
    <script defer src="${pageContext.servletContext.contextPath}/resources/main/js/vote.js"></script>
</body>
</body>
</html>