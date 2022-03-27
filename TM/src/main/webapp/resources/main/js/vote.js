const openButton = document.getElementById("Btn_0");
// 모달창 버튼
const modal = document.querySelector(".modal");

const voteBtn1 = modal.querySelector(".Btn_1");
const voteBtn2 = modal.querySelector(".Btn_2");

const voteBubble = document.querySelector(".bubble");

const openModal = () => {
  modal.classList.remove("hidden");
  
}
const closeModal = () => {
  modal.classList.add("hidden");
  voteBubble.classList.remove("bubble_hidden");
}

voteBtn1.addEventListener("click", closeModal);
voteBtn2.addEventListener("click", closeModal);

openButton.addEventListener("click", openModal);