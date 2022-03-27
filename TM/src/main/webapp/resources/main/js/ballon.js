const voteButton = document.getElementById("Btn_0");
// 모달창 버튼
const Bubblemodal = document.querySelector(".modal");

const BubbleModal = () => {
    Bubblemodal.classList.remove("bubble_hidden"); 
}

voteButton.addEventListener("click", BubbleModal);