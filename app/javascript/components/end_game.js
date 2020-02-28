const gameEnd = () => {
  const pageContainer = document.getElementById('wikipage-container');

  const checkEndGame = () => {
    console.log("I m in");
    if(pageContainer.dataset.state === "ended"){
      alert("Un joueur a gagné!");
    }
  };

  if(pageContainer) {
    const myInterval = setInterval(checkEndGame, 500);
  }


};

export {gameEnd};


