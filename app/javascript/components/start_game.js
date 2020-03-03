const startGame = () => {
  const buttonStart = document.getElementById('btn-start-game')
  let startTime;
  let roundId;

  const updateRoundStartTime = (date) => {
    const requestOptions = {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify({start_time:`${date}`})
    };
    fetch(`http://${window.location.host}/rounds/${roundId}`, requestOptions)
      .then(window.location.href = `http://${window.location.host}/rounds/${roundId}`);
  };

  if(buttonStart){
    roundId = buttonStart.dataset.round
    buttonStart.addEventListener('click', (event) => {
      startTime = Date.now();
      updateRoundStartTime(startTime);
    });
  }
}

export {startGame};
