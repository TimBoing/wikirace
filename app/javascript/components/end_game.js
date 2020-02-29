const gameEnd = () => {
  const pageContainer = document.getElementById('wikipage-container');
  let myInterval;

  const checkEndGame = () => {
    console.log("I m in");
    if(pageContainer.dataset.state === "ended"){
      alert("Un joueur a gagné!");
      clearInterval(myInterval);
    }
  };

  if(pageContainer) {
    myInterval = setInterval(checkEndGame, 500);
  }


};

export {gameEnd};


