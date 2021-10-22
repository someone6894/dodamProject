<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>

.detail{
/* 	text-align:center; */
 	margin: 0 auto;
 	width: 200px;
}

</style>
<script>

$(document).ready(function() {
	showPublicAdopt();
});

function goList(){
	location.href='/board/adopt/publicAdoptList';
	
}



function showPublicAdopt() {
	var no = (location.href.split("?")[1]).split("=")[1];
	console.log("선택한 desertionNo = " + no);
	
	var apiUrl = "publicInfo.do?no=" + no;
	console.log(apiUrl);
			
	$.ajax({
		url : "publicInfo.do?no=" + no, // 데이터가 송수신 될 서버의 주소
		type : "GET", // 통신 방식(get, post)
		dataType : "xml", // 수신받을 데이터의 타입
		success : function(data) { // 통신이 성공하면 수행될 문장들...
			console.log("ajax publicInfo data 통신성공 : " + data);
		
			// 한 페이지에 출력되는 게시글 수
			var pageDataLength = data.getElementsByTagName("numOfRows")[0].innerHTML;
			console.log("한 페이지에 출력되는 게시글 수 pageDataLength : " + pageDataLength);

			output = '';
			output += '<table class="table table-hover">';
			output += '<thead><tr><th>분류</th><th>내용</th></tr></thead><tbody>';
			
			for (i = 0; i < pageDataLength; i++) {
				
				if (data.getElementsByTagName("desertionNo")[i].innerHTML == no) {
					var desertionNoTag = data.getElementsByTagName("desertionNo")[i];
					desertionNo = desertionNoTag.innerHTML;
					console.log(desertionNo);

					var item = desertionNoTag.parentNode;
					console.log("선택한 desrtionNo의 item : ");
					console.log(item);
					
					if (item.getElementsByTagName("age")[0] != null) {
						var age = item.getElementsByTagName("age")[0].innerHTML;
					}
					if (item.getElementsByTagName("careAddr")[0] != null) {
						var careAddr = item.getElementsByTagName("careAddr")[0].innerHTML;
					}
					if (item.getElementsByTagName("careNm")[0] != null) {
						var careNm = item.getElementsByTagName("careNm")[0].innerHTML;
					}
					if (item.getElementsByTagName("careTel")[0] != null) {
						var careTel = item.getElementsByTagName("careTel")[0].innerHTML;
					}
					if (item.getElementsByTagName("chargeNm")[0] != null) {
						var chargeNm = item.getElementsByTagName("chargeNm")[0].innerHTML;
					}
					if (item.getElementsByTagName("colorCd")[0] != null) {
						var colorCd = item.getElementsByTagName("colorCd")[0].innerHTML;
					}
					if (item.getElementsByTagName("desertionNo")[0] != null) {
						var desertionNo = item.getElementsByTagName("desertionNo")[0].innerHTML;
					}
					if (item.getElementsByTagName("filename")[0] != null) {
						var filename = item.getElementsByTagName("filename")[0].innerHTML;
					}
					if (item.getElementsByTagName("happenDt")[0] != null) {
						var happenDt = item.getElementsByTagName("happenDt")[0].innerHTML;
					}
					if (item.getElementsByTagName("happenPlace")[0] != null) {
						var happenPlace = item.getElementsByTagName("happenPlace")[0].innerHTML;
					}
					if (item.getElementsByTagName("kindCd")[0] != null) {
						var kindCd = item.getElementsByTagName("kindCd")[0].innerHTML;
					}
					if (item.getElementsByTagName("neuterYn")[0] != null) {
						var neuterYn = item.getElementsByTagName("neuterYn")[0].innerHTML;
					}
					if (item.getElementsByTagName("noticeEdt")[0] != null) {
						var noticeEdt = item.getElementsByTagName("noticeEdt")[0].innerHTML;
					}
					if (item.getElementsByTagName("noticeNo")[0] != null) {
						var noticeNo = data.getElementsByTagName("noticeNo")[0].innerHTML;
					}
					if (item.getElementsByTagName("noticeSdt")[0] != null) {
						var noticeSdt = item.getElementsByTagName("noticeSdt")[0].innerHTML;
					}
					if (item.getElementsByTagName("officetel")[0] != null) {
						var officetel = item.getElementsByTagName("officetel")[0].innerHTML;
					}
					if (item.getElementsByTagName("orgNm")[0] != null) {
						var orgNm = item.getElementsByTagName("orgNm")[0].innerHTML;
					}
					if (item.getElementsByTagName("popfile")[0] != null) {
						var popfile = item.getElementsByTagName("popfile")[0].innerHTML;
					}
					if (item.getElementsByTagName("processState")[0] != null) {
						var processState = item.getElementsByTagName("processState")[0].innerHTML;
					}
					if (item.getElementsByTagName("sexCd")[0] != null) {
						var sexCd = item.getElementsByTagName("sexCd")[0].innerHTML;
					}
					if (item.getElementsByTagName("specialMark")[0] != null) {
						var specialMark = item.getElementsByTagName("specialMark")[0].innerHTML;
					}
					if (item.getElementsByTagName("weight")[0] != null) {
						var weight = item.getElementsByTagName("weight")[0].innerHTML;
					}
					
// 					var desertionNo = item.getElementsByTagName("desertionNo")[0].innerHTML;
// 					var careAddr = item.getElementsByTagName("careAddr")[0].innerHTML;
// 					var popfile = item.getElementsByTagName("popfile")[0].innerHTML;
// 					var noticeNo = item.getElementsByTagName("noticeNo")[0].innerHTML;
// 					var processState = item.getElementsByTagName("processState")[0].innerHTML;
// 					var kindCd = item.getElementsByTagName("kindCd")[0].innerHTML;
// 					var age = item.getElementsByTagName("age")[0].innerHTML;
// 					var happenDt = item.getElementsByTagName("happenDt")[0].innerHTML;
// 					var chargeNm = item.getElementsByTagName("chargeNm")[0].innerHTML;
// 					var officetel = item.getElementsByTagName("officetel")[0].innerHTML;
// 					var specialMark = item.getElementsByTagName("specialMark")[0].innerHTML;
					
					output += "<strong style='font-size:25px;'>[공고번호] " + noticeNo +"</strong>"
					output += '<tr>';
					output += '<td>사진</td>';
					output += "<td><img src='" + popfile + "' class='img-rounded' width= '300px' height= '300px' /></td>";
					output += '</tr>';	
					
					output += '<tr>';
					output += '<td  style="width:15%;">번호</td>';
					output += '<td>' + desertionNo + '</td>';
					output += '</tr>';		
					
					output += '<tr>';
					output += '<td>보호장소</td>';
					output += '<td>' + careAddr + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>공고번호</td>';
					output += '<td>' + noticeNo + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>상태</td>';
					output += '<td>' + processState + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>품종 / 색</td>';
					output += '<td>' + kindCd + ", " + colorCd + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>나이</td>';
					output += '<td>' + age + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>발견일시</td>';
					output += '<td>' + happenDt + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>발견장소</td>';
					output += '<td>' + happenPlace + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>담당자</td>';
					output += '<td>' + chargeNm + '(' + officetel + ')</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>특징</td>';
					output += '<td>' + specialMark + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>성별</td>';
					output += '<td>' + sexCd + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>체중</td>';
					output += '<td>' + weight + '</td>';
					output += '</tr>';
					
					output += '<tr>';
					output += '<td>중성화여부</td>';
					output += '<td>' + neuterYn + '</td>';
					output += '</tr>';
					
					
					
					
					
				}
			}//for문 끝
			
			output += '</tbody></table>';
			output += '</table>';
			output += "<button onclick='goList();' style='float:right'>목록</button>";
			$(".detail").html(output);
			
			
		}
	});
	
} //showPublicAdopt 끝


</script>  
  
  
<title>Dodam Dodam</title>
</head>
<body>
<jsp:include page="../../template.jsp"></jsp:include>


<div class='detail' style="height: 30%; width: 50%; margin-top: 50px; margin-bottom: 100px; padding: 20px" ></div>


</body>
</html>