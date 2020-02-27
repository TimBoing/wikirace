const pageContainer = document.getElementById('wikipage-container');
const endPageContainer = document.getElementById('end-page-container');
const counterContainer = document.getElementById('counter-container');
const blackModal = document.getElementById('black-modal');
const blackModalContent = document.getElementById('black-modal-content');
let roundEndPage;
let gameMode;
let roundStartTimeString;
let roundStartTime;
let sessionStartTime;
let minuteElapsed;
let secondElapsed;
let counterDisplay;
let myInterval;

const preventOpenWikiLinks = () => {
  console.log('Preventing clicks on wiki links ');
  const wikiLinks = endPageContainer.querySelectorAll('a');
  wikiLinks.forEach((link) => {
    link.addEventListener('click', (event)=> {
      event.preventDefault();
    });
  });
}

const displayContentOnModal = (content) => {
  console.log('Displaying content on modal');
  endPageContainer.insertAdjacentHTML('afterbegin', content);
  preventOpenWikiLinks();
}

const requestEndPageContent = (page) => {
  console.log('Requesting End page content');
  const requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };
  fetch(`https://fr.wikipedia.org/api/rest_v1/page/html/${page}`, requestOptions)
    .then(response => response.text())
    .then(result => displayContentOnModal(result))
    .catch(error => console.log('error', error));
}

const updateCounter = () => {
  minuteElapsed = Math.floor(((Date.now() - roundStartTime) / 1000) / 60);
  secondElapsed = Math.round(((Date.now() - roundStartTime) / 1000) % 60);

  if(secondElapsed=== 60){secondElapsed = 0;};
  counterDisplay = `${minuteElapsed}min and ${secondElapsed}sec`;
  counterContainer.innerText = counterDisplay;
}

const updateBlackModal = () => {
  secondElapsed = Math.round(((sessionStartTime - Date.now()) / 1000) % 60);
  blackModalContent.innerText = `${secondElapsed}`
}

const launchBlackModal = () => {
  blackModal.style.display = "block";
  myInterval = setInterval(updateBlackModal, 1000);
}


const updateDecreasingCounter = () => {
  secondElapsed = Math.round(((sessionStartTime - Date.now()) / 1000) % 60);
  if(secondElapsed > 5){
    counterDisplay = `Round starts in : ${secondElapsed}sec`;
    counterContainer.innerText = counterDisplay;
  } else {
    clearInterval(myInterval);
    launchBlackModal();
  }
}

const startCounter = () => {
  //alert(typeof roundStartTime);
  roundStartTime = parseInt(roundStartTimeString);
  sessionStartTime = roundStartTime + 30 * 1000; // 30 sec between launch of page and game
  myInterval = setInterval(updateDecreasingCounter, 1000);

}

const initGame = () => {
  if(pageContainer) {
    roundEndPage = pageContainer.dataset.endPage;
    gameMode = pageContainer.dataset.gameMode;
    roundStartTimeString = pageContainer.dataset.startTime;
    startCounter();
    requestEndPageContent(roundEndPage);
    console.log('Game Initialization');
  }
}

export {initGame};
