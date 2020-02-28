const handleGameModals = () => {
  const endPageModal = document.getElementById("end-page-modal");
  const infoModal = document.getElementById("info-your-target-modal");
  const btn = document.getElementById("end-page-modal-btn");
  const btnInfo = document.getElementById("info-your-target-modal-display");
  const spanEndPage = document.getElementById("closeEndPage");
  const spanInfo = document.getElementById("closeInfo");

  // TESTING PURPOSE
  // const blackModal = document.getElementById("black-modal");
  // const btnB = document.getElementById("black-modal-display");
  // btnB.addEventListener('click', (event) => {
  //     blackModal.style.display = "block";
  // });
  // END OF TESTING

  if(endPageModal){
    btn.addEventListener('click', (event) => {
      endPageModal.style.display = "block";
    });

    btnInfo.addEventListener('click', (event) => {
      infoModal.style.display = "block";
    });


    spanEndPage.addEventListener('click', (event) => {
      endPageModal.style.display = "none";
    });

    spanInfo.addEventListener('click', (event) => {
      infoModal.style.display = "none";
    });

    // When the user clicks anywhere outside of the endPageModal, close it
    window.addEventListener('click', (event) => {
      if (event.target == endPageModal) {
        endPageModal.style.display = "none";
      }
    });
  }
}

export { handleGameModals };



