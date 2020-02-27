const handleGameModals = () => {
  // Get the modal
  const modal = document.getElementById("end-page-modal");
  // Get the button that opens the modal
  const btn = document.getElementById("end-page-modal-btn");
  // Get the <span> element that closes the modal
  const span = document.getElementsByClassName("close")[0];

  // When the user clicks the button, open the modal
  btn.addEventListener('click', (event) => {
    modal.style.display = "block";
  });

  // When the user clicks on <span> (x), close the modal
  span.addEventListener('click', (event) => {
    modal.style.display = "none";
  });

  // When the user clicks anywhere outside of the modal, close it
  window.addEventListener('click', (event) => {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  });
}

export { handleGameModals };
