<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* footer 시작 */

  #bot {
    min-width: 627px;
  }
  
  footer {
    display: block;
    margin-top: 16px;
    margin-left: 100px;
    margin-right: 100px;
    background-color: #ddd;
  }
  
  .clear {
    clear: both;
  }
  
  .footer {
    padding: 0px;
    position: relative;
    border-top: none;
    clear: both;
  }
  
  .snb {
    width: 100%;
  }
  
  .footer .snb {
    border-top: none;
    padding-bottom: 20px;
    margin-bottom: 20px;
  }
  
  .footer .snb_store {
    padding-left: 0;
  }
  
  .footer .clearfix_store {
    margin-top: 5px;
    
  }
  
  ul {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
  }
  
  ul, li {
    list-style: none;
  }
  
  .footer .snb ul li.division {
    margin-right: 8px;
    padding-right: 8px;
  }
  
  .footer .snb ul li {
    font-weight: normal;
    line-height: 12px;
  }
  
  .division {
    font-weight: inherit;
    border-right: 1px solid gray;
    border-right-color: gray;
    display: inline-block;
    height: 23px;
  }
  
  a {
    color: inherit;
    text-decoration: none;
    font-size: 13px;
  }
  
  /* footer 끝 */
</style>
</head>
<body>
	<hr>
    <footer id="bot" class="clear">
      <div class="footer">
        <div class="snb snb_store">
          <ul class="clearfix_store">
            <li class="division">
              <a href="#">회사소개</a>
            </li>
            <li class="division">
              <a href="#">공지사항</a>
            </li>
            <li class="division">
              <a href="#">개인정보처리방침</a>
            </li>
            <li class="division">
              <a href="#">이용약관</a>
            </li>
          </ul>
        </div>
        <div class="row1 row">
          <div class="addressBox-wrapper clearfix">
            
          </div>
          <span class="global-notice store_footer_notice"></span>
        </div>
      </div>
    </footer>
</body>
</html>