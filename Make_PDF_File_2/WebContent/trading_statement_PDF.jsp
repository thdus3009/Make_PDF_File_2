<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="${pageContext.request.contextPath}/resource/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/html2canvas.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/jspdf.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/trading_statement_PDF.css" />

<title>Insert title here</title>
</head>
<body>

<%Date today = new Date(); %>
<%SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");%>

<div id="menu">
	<div id="menu1">
		<div class="estimate-btn" id="savePdf">PDF 저장</div>
		<div class="estimate-btn" id="close">PDF 닫기</div>
	</div>
</div>

<div id="margin">
	<div id="pdfDiv">
		<br>
		<br>
		<div id="title">거 래 명 세 서</div>
		
		<div class="info1" style="float: left; width: 275px; height: 80px;">
			<div class="box">상 호 명: 
				<span class="box_right">
					<input type="text" class="company" placeholder="상호명을 입력해 주세요." style="text-align: right; border: none;">
				</span>	
			</div>
			<div class="box">담 당 자: 
				<span class="box_right">
					<input type="text" class="name" placeholder="이름을 입력해 주세요." style="text-align: right; border: none;"> 님
				</span>
			</div>
			<div class="box">작 성 일: <span class="box_right"><%= df.format(today) %></span></div>
		</div>
		
		<!-- provider -->
		<div style="float: right;width: 360px;color: #000080;position: relative;margin-bottom:30px;">
			<img src="${pageContext.request.contextPath}/resource/image/seal.png" style="position: absolute;right: 2px;top: 7px;">
			<table>
				<tbody>
					<tr>
						<td rowspan="4" style="width: 30px;">공<br><br>급<br><br>자</td>
						<td>등록번호</td>
						<td colspan="3" style="font-size: 13px;">828-88-01007</td>
					</tr>
					<tr>
						<td>상호</td>
						<td>갤러리 360(주)</td>
						<td style="width: 40px;">성명</td>
						<td>신 효 미&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="3">경기도 파주시 소리천로 25, 916호</td>
					</tr>
					<tr>
						<td>업태</td>
						<td>정보서비스</td>
						<td>종목</td>
						<td style="font-size: 10px;">소프트웨어 개발 및 공급업</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div style="clear: both; margin-bottom: 5px; font-size: 13px; font-weight: 700;">아래와 같이 견적 드립니다.</div>
		
		<div class="border">
			<div class="bd" style="background: #e3e3e3; border-right: 1px solid #808080; width: 123%;">
				<span style="font-weight: 700;">총 금액</span> 
				<span style="font-size: 11px; font-weight: 700;">(부가세 포함)</span>
			</div>
			<div class="bd" style="padding: 0 2%; font-weight: 700;">
				<span style="float: left;">\</span> 
				<span style="float: right;" class="price2"></span>
			</div>
		</div>
		
		
		<table>
			<thead>
				<!-- <tr id="color"><td colspan="3" style="font-size: 40px;">갤러리 360</td></tr> -->
				<tr>
					<th style="width: 17%;">항목</th>
					<th style="width: 17%;">내용</th>
					<th style="width: 5%;"></th>
					<th style="width: 17%;">단가</th>
					<th style="width: 12%;">대관개수</th>
					<th style="width: 11%;">사용기간(월)</th>
					<th >금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="font-weight: 600;">플랫폼 월 사용료</td>
					<td>올인원 요금제</td>
					<td></td>
					<td class="price"></td>
					<td class="amount"></td>
					<td class="term"></td>
					<td class="all_price"></td>
				</tr>
<!-- 				
				<tr>
					<td>서비스</td>
					<td>아트 매니지먼트</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				 -->
				<tr class="blank">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				
				<tr>
					<td colspan="2" style="font-weight: 600;">서비스 소계</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="all_price"></td>
				</tr>
				
				<tr>
					<td colspan="2" style="font-weight: 600;">3개월 이상 대관 시 할인 적용 11%</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="sale"></td>
				</tr>
				
				<tr>
					<td colspan="2" style="font-weight: 600;">부가세 10%</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="tax"></td>
				</tr>
				
				<tr style="background: #60497a; color: white; font-weight: 600;">
					<td colspan="6">합계</td>
					<td class="price2"></td>
				</tr>
			</tbody>
		</table>
		
		
		<div style="margin-bottom: 16px;">
			<div class="br">* 증빙 서류 요청은 갤러리360 홈페이지에서 가능합니다.</div>
		</div>
		
		<br>
		<div style="width:100%; height:53px; border-bottom: 2px solid black; position: relative;">
			<img class="logo" width="21%" src="${pageContext.request.contextPath}/resource/image/logo.png">
		</div>
		
		<div style="float: right; font-size: 13px;">T. 070-8803-0123</div>
		&ensp;
	</div>
</div>
<br>


<script type="text/javascript">
	$(document).ready(function(){
		
		var amount = $('.hidden_number_of_rentals',opener.document).val();
		var term = $('.hidden_term',opener.document).val();
		var price = 150000;
		
		//String타입 int타입으로 바꾸기
		amount = parseInt(amount);
		term = parseInt(term);
		
		var all_price = (amount*term*price); //할인 들어가기전 최종금액
		/* var sale = 0;  *///할인 금액
		
		var price1; //최종금액 (세전)
		var price2; //최종금액 (세후)
		
		if(term>=3){
			price1=amount*(price*term*0.89);
			
			var sale = amount*(price*term*0.11);
			$(".sale").text("-"+numberWithCommas(sale));
		}else{
			price1=amount*(price*term);
		}
		var tax = price1/10;
		
		price2 = price1+tax;
		
		/* 계산 끝 */
		
		$(".price").text(numberWithCommas(price));
		$(".amount").text(amount);
		$(".term").text(term);
		$(".all_price").text(numberWithCommas(all_price));
		/* $(".sale").text(numberWithCommas(sale)); */
		$(".tax").text(numberWithCommas(tax));
		$(".price2").text(numberWithCommas(price2));
		
		
		
		/* 금액 콤마(,) 삽입 */
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		
	});
	
	/* pdf 출력 */
	$('#savePdf').click(function() { // pdf저장 button id
		
		if($(".name").val()==""||$(".company").val()==""){
			
			alert("상호명과 담당자를 입력해 주세요.");
			
		}else{
			
			$("#parentId", opener.document).val();
		    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
				
			    // 캔버스를 이미지로 변환
			    var imgData = canvas.toDataURL('image/png');
				     
			    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
			    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
			    var imgHeight = canvas.height * imgWidth / canvas.width;
			    var heightLeft = imgHeight;
			    var margin = 10; // 출력 페이지 여백설정
			    var doc = new jsPDF('p', 'mm');
			    var position = 0;
			       
			    // 첫 페이지 출력
			    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
			    heightLeft -= pageHeight;
			         
			    // 한 페이지 이상일 경우 루프 돌면서 출력
			    while (heightLeft >= 20) {
			        position = heightLeft - imgHeight;
			        doc.addPage();
			        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			        heightLeft -= pageHeight;
			    }
			    
		/* 	    doc.line(15,19,190,19); //시작x, 시작y, 종료x, 종료y
			    doc.text(15,40,'안녕하세요'); */
			    
			    // 파일 저장
			    doc.save('갤러리360_거래명세서.pdf');
		
			  
			});
		}
	
	
	});
	
	/* pdf 출력 */
	$('#close').click(function(){
		window.self.close();
	});	
	
</script>
</body>
</html>