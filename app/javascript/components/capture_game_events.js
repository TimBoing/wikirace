// cet espace est dédié à la capture d´evenements de jeu chez les utilisateurs
// Cette fonction est appelée toute les 1/2 seconde par initialize game, en meme temps que le compteur s´initialise
// Selon le mode, cet espace déclenchera la fin du jeu ou les bonus
// Pas la peine de mettre le tout sous une condition d´existence du container car on est appelé sous cette condition dans initialize_game

const checkForUpdates = () => {
  const pageContainer = document.getElementById('wikipage-container');
  const gameMode = pageContainer.dataset.gameMode;
  console.log("I m in");
    if(pageContainer.dataset.state === "ended"){
      alert("Un joueur a gagné!");
      //clearInterval(myInterval);
    }



}

export {checkForUpdates};

