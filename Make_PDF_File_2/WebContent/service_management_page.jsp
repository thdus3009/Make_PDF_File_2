<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>거래내역페이지</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Gallery360">
    <meta name="description" content="Gallery360">
    <meta name="author" content="Gallery360">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, user-scalable=yes">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- js -->
<script src="${pageContext.request.contextPath}/resource/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/html2canvas.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/jspdf.min.js"></script>
    <!-- 연결시 동작 안함 <script src="../js/jquery-3.3.1.min.js"></script> -->
   
   
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="https://www.gallery360.co.kr/resource/css/library.css?open?ver=9.10">
    <link rel="stylesheet" type="text/css" href="https://www.gallery360.co.kr/resource/css/jquery-ui.css?open?ver=9.10">
    <link rel="stylesheet" type="text/css" href="https://www.gallery360.co.kr/resource/css/home/style.css?open?ver=9.10">
    <link rel="stylesheet" type="text/css" href="https://www.gallery360.co.kr/resource/css/base.css?open?ver=9.10">
    <link rel="stylesheet" type="text/css" href="https://www.gallery360.co.kr/resource/css/common.css?open?ver=9.10">
    <link rel="stylesheet" href="https://www.gallery360.co.kr/resource/css/partner/request.css?open?ver=9.10">
<!--     <link rel="stylesheet" href="https://www.gallery360.co.kr/resource/css/partner/deco.css?open?ver=9.10"> -->
    <link rel="stylesheet" href="https://www.gallery360.co.kr/resource/css/partner/account.css?open?ver=1.0">
    <link rel="stylesheet" href="https://www.gallery360.co.kr/resource/css/partner/vrscreen.css?open?ver=1.0">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&amp;display=swap" rel="stylesheet">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/service_management_page.css" />

</head>


<body>
    <div class="svc-modal"></div>
    <div class="svcmgmt-wrap">
        <div class="svcmgmt-header">
            <h3>이용 중인 서비스</h3>
        </div><!--svcmgmt-header end-->
        <div class="svcmgmt-con">
            <!--<input type="radio" name="transaction_choice">-->
            <table class="svc-in-use">
                <thead>
                    <tr>
                        <th>선택하기</th>
                        <th>요금제</th>
                        <th>대관 개수</th>
                        <th>계약 기간</th>
                        <th>거래일자 / 시작일</th>
                        <th>종료일</th>
                        <th>요금(VAT포함)</th>
                        <th>해지하기</th>
                    </tr>
                </thead>
                <tbody>
                
                <!-- 반복문 돌리기 -->
                    <tr>
                        <td><input type="radio" class="radio_2" name="svc_choice" value="요금제선택"></td>
                        <td class="plan">All-in-One</td>
                        <td><span class="number_of_rentals">2</span>개관</td>
                        <td><span class="term">1</span>개월</td>
                        <td class="start_date">2020년 11월 20일</td>
                        <td class="end_date">2020년 12월 20일</td>
                        <td class="price">330,000원</td>
                        <td><button type="button" id="svc_cancel" value="해지하기">해지</button></td>
                    </tr>
                    <tr>
                        <td><input type="radio" class="radio_1" name="svc_choice" value="요금제선택"></td>
                        <td class="plan">All-in-One</td>
                        <td><span class="number_of_rentals">2</span>개관</td>
                        <td><span class="term">2</span>개월</td>
                        <td class="start_date">2020년 9월 15일</td>
                        <td class="end_date">2020년 11월 15일</td>
                        <td class="price">660,000원</td>
                        <td><button type="button" id="svc_cancel" value="해지하기">해지</button></td>
                    </tr>
                    
                </tbody>
            </table><!--svc-in-use end-->
            <div class="cancel-popup">
                <h4>서비스해지</h4>
                <p>
                서비스 해지 이후에는 VR갤러리 대관 서비스를 제공받으실 수 없습니다. 서비스 해지에 동의하십니까?
                </p>
                <button type="submit" id="final_cancel">예</button>
                <button type="submit" id="close_cancel_popup">아니오</button>
            </div><!--cancel-popup end-->
            
            <div class="svc-btn-box">
                <div class="svcmgmt-btn svcmgmt-pdf">거래명세서 출력</div>
                <div class="svcmgmt-btn svcmgmt-popup-btn">증빙자료 발행 요청</div>
            </div><!--svc-btn-box end-->
            
            <div><!-- pdf정보 넘겨주는 input -->
            	<input type="hidden" class="hidden_plan">
            	<input type="hidden" class="hidden_number_of_rentals">
            	<input type="hidden" class="hidden_term">
            	<input type="hidden" class="hidden_start_date">
            	<input type="hidden" class="hidden_end_date">
            	<input type="hidden" class="hidden_price">
            </div>
            
            
            <div class="svcmgmt-popup">
                <button type="button" id="close_svcmgmt_popup">
                    <span></span>
                    <span></span>
                </button>
                <form name="document_form" action=" " method="post">
                    <fieldset class="tax-invoice">
                        <legend><input type="radio" name="document_type" value="세금계산서"> 세금계산서</legend>
                        <label for="organ_name">요청기관명 <span><input type="text" id="organ_name" name="organ_name" size="30" maxlength="30" placeholder="기관명을 입력해주세요" required=""></span></label>
                        <label for="corpo_number_t">사업자등록번호 <span><input type="text" id="corpo_number_t" name="corpo_number_t" size="30" maxlength="30" placeholder="사업자등록번호를 입력해주세요" required=""></span></label>
                        <label for="email_addr">이메일주소 <span><input type="text" id="email_addr" name="email_addr" size="10" maxlength="50" placeholder="이메일주소를 입력해주세요" required=""></span>
                        </label>
                        <label for="additional_query">기타 요청사항 <span><input type="text" id="additional_query" name="additional_query" size="30" maxlength="30" placeholder="요청사항이 있으실 경우, 적어주세요"></span></label>
                        <label for="buss_licence">사업자등록증 <span><button type="button" id="buss_licence" value="업로드">업로드</button></span></label>
                        <p>신청 완료 후 1:1 카카오톡 상담에 확인 글을 남겨 주시면<br> 빠르게 처리해 드립니다.</p>
                    </fieldset><!--tax-invoice end-->
                    <fieldset class="cash-receipt">
                        <legend><input type="radio" name="document_type" value="현금영수증"> 현금영수증</legend>
                        <label for="corpo_number_c">사업자등록번호 <span><input type="text" id="corpo_number_c" name="corpo_number_c" size="30" maxlength="30" placeholder="사업자 지출 증빙용"></span></label>
                        <label for="mob_number">휴대폰번호 <span><input type="text" id="mob_number" name="mob_number" size="10" maxlength="13" placeholder="개인 소득공제용"></span></label>
                    </fieldset><!--cash-receipt end-->
                </form>
                <p>입력하신 정보는 증빙자료 발행용으로만 사용됩니다.</p>
                <button type="submit" id="final_apply" value="신청하기">신청하기</button>
            </div><!--svcmgmt-popup end-->
        </div><!--svcmgmt-con end-->
        <div class="svcmgmt-header">
            <h3>초대장 발송 서비스 이용 내역</h3>
        </div><!--svcmgmt-header end-->
        <div class="svcmgmt-con">
            <p>잔여발송 횟수는 매월 1일 초기화 됩니다.</p>
            <div class="rest-time">
                <div class="rt-txt">잔여 발송 횟수</div>
                <a class="rt-num"><span>1000</span>건</a>
                <div class="rt-detail">
                    <div class="rt-detail-txt">카톡 발송 횟수</div>
                    <div class="rt-detail-num">000건</div>
                    <div class="rt-detail-txt">메일 발송 횟수</div>
                    <div class="rt-detail-num">000건</div>
                </div><!--rt-detail end-->
            </div><!--rest-time end-->
        </div><!--svcmgmt-con end-->
    </div><!--svcmgmt-wrap end-->
    
    
    <script type="text/javascript">

	    //해당 라디오버튼에 해당하는 tr안의 클래스들을 불러올 수 있다.
	    $('input[name="svc_choice"]').click(function(){
	    	var class_name = $('input[name="svc_choice"]:checked').attr('class');
	    	//console.log(class_name);
	    	//console.log("가격: "+$("."+class_name).parents("tr").children(".price").text());
	    	
	    	var plan = $("."+class_name).parents("tr").children(".plan").text();
	    	var number_of_rentals = $("."+class_name).parents("tr").find(".number_of_rentals").text();
	    	var term = $("."+class_name).parents("tr").find(".term").text();
	    	var start_date = $("."+class_name).parents("tr").children(".start_date").text();
	    	var end_date = $("."+class_name).parents("tr").children(".end_date").text();
	    	var price = $("."+class_name).parents("tr").children(".price").text();
	    	
	    	$(".hidden_plan").val(plan);
	    	$(".hidden_number_of_rentals").val(number_of_rentals);
	    	$(".hidden_term").val(term);
	    	$(".hidden_start_date").val(start_date);
	    	$(".hidden_end_date").val(end_date);
	    	$(".hidden_price").val(price);
	    	
	    });
	    
	    $('.svcmgmt-pdf').click(function(){
	    	
	    	//var a = $("input:radio[name='svc_choice']").is(":checked");
	    	//console.log(a);
	    	if($("input:radio[name='svc_choice']").is(":checked")==false){
	    		alert("이용중이신 서비스를 클릭해 주세요.");
	    	}else{
	    		var newWindow = window.open('/Make_PDF_File_2/trading_statement_PDF.jsp','trading_statement','width=750,height=900');	    		
	    	} 
	    	
	    	
	    });
	    
    </script>
    
    <script>
        
        //해지 팝업창
        $(function(){
            $('#svc_cancel').click(function(){
                $('.svc-modal, .cancel-popup').stop().fadeIn();
            });
            $('#close_cancel_popup').click(function(){
                $('.svc-modal, .cancel-popup').stop().fadeOut();
            });
        }); 
        
        //증빙자료 발행 요청 팝업
        $(function(){
            $('.svcmgmt-popup-btn').click(function(){
                $('.svc-modal, .svcmgmt-popup').stop().fadeIn();
            });
            $('#close_svcmgmt_popup').click(function(){
                $('.svc-modal, .svcmgmt-popup').stop().fadeOut();
            });
        });
        
        
        //잔여 발송 횟수 상세보기      
        $(function(){
            var detail_show = 0;
            $('.rt-num').click(function(){
                
                if(detail_show===0){
                    $('.rest-time').stop().animate({height:'130px'});
                    $('.rt-detail').stop().animate({height:'86px'});
                    $('.rt-detail').show();
                    
                    detail_show=1;
                    
                }else{
                    $('.rest-time').stop().animate({height:'42px'});
                    $('.rt-detail').stop().animate({height:'0px'});
                    $('.rt-detail').stop().slideUp();

                    detail_show=0;
                }
            });
        });
    
    </script>
    
    
    
    
    

</body>
</html>