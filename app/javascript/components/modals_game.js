const handleGameModals = () => {
  // Get the modal
  const endPageModal = document.getElementById("end-page-modal");
  // Get the button that opens the modal
  const btn = document.getElementById("end-page-modal-btn");
  // Get the <span> element that closes the modal
  const span = document.getElementsByClassName("close")[0];

  // TESTING PURPOSE
  const blackModal = document.getElementById("black-modal");
  const btnB = document.getElementById("black-modal-display");
  btnB.addEventListener('click', (event) => {
      blackModal.style.display = "block";
  });
  // END OF TESTING

  // When the user clicks the button, open the modal
  if(endPageModal){
    btn.addEventListener('click', (event) => {
      endPageModal.style.display = "block";
    });

    // When the user clicks on <span> (x), close the endPageModal
    span.addEventListener('click', (event) => {
      endPageModal.style.display = "none";
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



