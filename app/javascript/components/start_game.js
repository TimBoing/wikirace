const startGame = () => {
  const buttonStart = document.getElementById('btn-start-game')

  if(buttonStart){
    buttonStart.addEventListener('click', (event) => {
      alert("I´m in");
    });
  }
}

export {startGame};
