const gameInfo = document.getElementById('game-info');
const pageContainer = document.getElementById('wikipage-container');

const applyMalus = () => {
  alert("Reverse!");
  const currentUserId = gameInfo.dataset.currentUser;
  const gameRound = gameInfo.dataset.round;
  const requestOptions = {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: JSON.stringify({malus:{sender:`${currentUserId}`, type:'reverse'}})
  };
  fetch(`http://${window.location.host}/rounds/${gameRound}`, requestOptions)
    .catch(error => console.log('error', error));


}


const addMalusLinks = () => {
  console.log('supposed to be here');
  const wikiContent = pageContainer.querySelectorAll('p');
  wikiContent.forEach((paragraph) => {
    const malusProba = Math.random();
    if(malusProba > 0.5){
      paragraph.insertAdjacentHTML('beforeEnd', '<a class="reverse-malus">reverse!</a>');
    }
  });
  const reverseMalus = pageContainer.querySelectorAll('.reverse-malus');
  reverseMalus.forEach((malus) => {
    malus.addEventListener('click', (event) => {
      applyMalus();
    });
  });
}



export{addMalusLinks};
