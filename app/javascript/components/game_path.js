const gamePath = () => {
  const pathIconContainer = document.getElementById("path-icon-container");

  if(pathIconContainer){
    const modalGamePath = document.getElementById("game-path-modal");
    const closeGamePath = document.getElementById("close-game-path-modal");
    const pathBeginning = document.getElementById("beginning-of-the-path");

    pathIconContainer.addEventListener('click', (event) => {
      modalGamePath.style.display = "block";
    });
    closeGamePath.addEventListener('click', (event) => {
      modalGamePath.style.display = "none";
    });
    window.addEventListener('click', (event) => {
      if (event.target == modalGamePath) {
        modalGamePath.style.display = "none";
      }
    });
  }
}

export{gamePath};
