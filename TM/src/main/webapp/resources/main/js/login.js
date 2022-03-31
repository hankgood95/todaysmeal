const id = document.getElementById('id')
const password = document.getElementById('password')
const login = document.getElementById('login')
let errStack = 0;

login.addEventListener('click', () => {
    if (id.value == 'tomeal') {
        if (password.value == '0000') {
            alert('관리자님 환영합니다!')
            location.href = 'http://127.0.0.1:8080/kr/admin/home';
        }
        else {
            alert('아이디와 비밀번호를 다시 한 번 확인해주세요!')
            errStack ++;
        }
    }
    else {
        alert('존재하지 않는 계정입니다.')
    }

    if (errStack >= 5) {
        alert('비밀번호를 5회 이상 틀리셨습니다. 비밀번호 찾기를 권장드립니다.')
    }
})

function enterkey() {
	if (window.event.keyCode == 13) {
		if (id.value == 'tomeal') {
	        if (password.value == '0000') {
	            alert('관리자님 환영합니다!')
	            location.href = 'http://127.0.0.1:8080/kr/admin/home';
	        }
	        else {
	            alert('아이디와 비밀번호를 다시 한 번 확인해주세요!')
	            errStack ++;
	        }
	    }
	    else {
	        alert('존재하지 않는 계정입니다.')
	    }

	    if (errStack >= 5) {
	        alert('비밀번호를 5회 이상 틀리셨습니다. 비밀번호 찾기를 권장드립니다.')
	    }
    }
}

const open1 = document.getElementById("Btn_open");
// 모달창 버튼
const modal2 = document.querySelector(".modal2");
const overlay1 = modal2.querySelector(".modal_overlay2");

const voteBtn0 = modal2.querySelector(".Btn_close");

const openModal2 = () => {
  modal2.classList.remove("hidden2");
}
const closeModal2 = () => {
  modal2.classList.add("hidden2"); 
}

voteBtn0.addEventListener("click", closeModal2);

open1.addEventListener("click", openModal2);