function agree() {
	if (confirm("찬성하시겠습니까?")) {
		alert("확인 눌렀다~~~~");
		$.ajax ({
			type: "POST",
			url: "recordVote",
			data: data,
			success: function(data) {
				console.log("success");
			}
		});
	}
	else
		alert("취소 눌렀다~~~~");
	return ;
}
function disagree() {
	if (confirm("반대하시겠습니까?")) {
		alert("확인 눌렀다~~~~");
		$.ajax ({
			type: "POST",
			url: "recordVote",
			data: data,
			success: function(data) {
				console.log(data);
			}
		});
	}
	else
		alert("취소 눌렀다~~~~");
	return ;
}