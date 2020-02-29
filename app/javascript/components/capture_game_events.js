// cet espace est dédié à la capture d´evenements de jeu chez les utilisateurs
// Cette fonction est appelée toute les 1/2 seconde par initialize game, en meme temps que le compteur s´initialise
// Selon le mode, cet espace déclenchera la fin du jeu ou les bonus

const checkForUpdates = () => {
  const pageContainer = document.getElementById('wikipage-container');
  console.log("I m in");
    if(pageContainer.dataset.state === "ended"){
      alert("Un joueur a gagné!");
      //clearInterval(myInterval);
    }



}

export {checkForUpdates};
