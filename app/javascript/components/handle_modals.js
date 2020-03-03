const handleRoundInfoModal = () => {
  const inviteFriendsModal = document.getElementById("invite-friends-modal");
  const inviteFriendsBtn = document.getElementById("invite-friends-btn");
  const inviteFriendsSpan = document.getElementById("close-invite-friends");
  const roundInfoModal = document.getElementById("round-info-modal");
  const roundInfoBtn = document.getElementById("round-info-btn");
  const roundInfoSpan = document.getElementById("close-round-info");

  if(inviteFriendsModal){
    inviteFriendsBtn.addEventListener('click', (event) => {
      inviteFriendsModal.style.display = "block";
    });

    inviteFriendsSpan.addEventListener('click', (event) => {
      inviteFriendsModal.style.display = "none";
    });

    window.addEventListener('click', (event) => {
      if (event.target == inviteFriendsModal) {
        inviteFriendsModal.style.display = "none";
      }
    });

    roundInfoBtn.addEventListener('click', (event) => {
      roundInfoModal.style.display = "block";
    });

    roundInfoSpan.addEventListener('click', (event) => {
      roundInfoModal.style.display = "none";
    });

    window.addEventListener('click', (event) => {
      if (event.target == roundInfoModal) {
        roundInfoModal.style.display = "none";
      }
    });
  }
}

const handleRoundPathsModals = () => {
  const pathInfoModal = document.getElementById("path-info-modal");
  const pathInfoBtn = document.getElementById("path-info-btn");
  const pathInfoSpan = document.getElementById("close-path-info");

  if (pathInfoModal) {
    pathInfoBtn.addEventListener('click', (event) => {
      pathInfoModal.style.display = "block";
    });

    pathInfoBtn.addEventListener('click', (event) => {
      pathInfoModal.style.display = "none";
    });

    window.addEventListener('click', (event) => {
      if (event.target == pathInfoModal) {
        roundInfoModal.style.display = "none";
      }
    });
  }

}


export { handleRoundInfoModal, handleRoundPathsModals };

// <i class="fas fa-chevron-circle-left" id="action-previous-page"></i>
//         <i class="fas fa-search" id="action-search-page"></i>
//         <i class="fas fa-bullseye" id="action-target-page"></i>

