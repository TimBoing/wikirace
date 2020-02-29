import { gameLoop } from './play_game';
import { checkForUpdates } from './capture_game_events';

const pageContainer = document.getElementById('wikipage-container');
const infoModal = document.getElementById("info-your-target-modal");
const endPageContainer = document.getElementById('end-page-container');
const counterContainer = document.getElementById('counter-container');
const blackModal = document.getElementById('black-modal');
const blackModalContent = document.getElementById('black-modal-content');
const waitingTime = 10;
let roundEndPage;
let gameMode;
let roundStartTimeString;
let roundStartTime;
let sessionStartTime;
let minuteElapsed;
let secondElapsed;
let counterDisplay;
let myInterval;
let myTimeout;

const preventOpenWikiLinks = () => {
  console.log('Preventing clicks on wiki links ');
  const wikiLinks = pageContainer.querySelectorAll('a');
  wikiLinks.forEach((link) => {
    link.addEventListener('click', (event)=> {
      event.preventDefault();
    });
  });
  const wikiLinksModal = endPageContainer.querySelectorAll('a');
  wikiLinksModal.forEach((link) => {
    link.addEventListener('click', (event)=> {
      event.preventDefault();
    });
  });
}

const displayContentOnModal = (content) => {
  console.log('Displaying content on modal');
  pageContainer.insertAdjacentHTML('afterbegin', content);
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
  checkForUpdates();
}

const clearBlackModal = () => {
  counterContainer.innerText = 'GO!';
  blackModal.style.display = "none";
  roundStartTime = sessionStartTime;
  myInterval = setInterval(updateCounter, 500); // Counter update every half second
}

const updateBlackModal = () => {
  secondElapsed = Math.round(((sessionStartTime - Date.now()) / 1000) % 60);
  if(secondElapsed === 0) {
    blackModalContent.innerText = "GO!";
  } else if(secondElapsed < 0) {
    clearBlackModal();
  } else {
    blackModalContent.innerText = `${secondElapsed}`;
  }

}

const launchBlackModal = () => {
  blackModal.style.display = "block";
  myInterval = setInterval(updateBlackModal, 1000);
  gameLoop();
}


const updateDecreasingCounter = () => {
  secondElapsed = Math.round(((sessionStartTime - Date.now()) / 1000) % 60);
  if(secondElapsed > 4){
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
  sessionStartTime = roundStartTime + waitingTime * 1000; // 30 sec between launch of page and game
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
