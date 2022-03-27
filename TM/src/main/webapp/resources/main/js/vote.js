const openButton = document.getElementById("Btn_0");
// 모달창 버튼
const modal = document.querySelector(".modal");
const overlay = modal.querySelector(".modal_overlay");

const voteBtn1 = modal.querySelector(".Btn_1");
const voteBtn2 = modal.querySelector(".Btn_2");

const openModal = () => {
  modal.classList.remove("hidden"); 
}
const closeModal = () => {
  modal.classList.add("hidden"); 
}

voteBtn1.addEventListener("click", closeModal);
voteBtn2.addEventListener("click", closeModal);

openButton.addEventListener("click", openModal);