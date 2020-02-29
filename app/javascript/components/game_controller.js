import { requestEndPageContent } from './game_model';
import { requestPageContent } from './game_model';
import { getCurrentPage } from './game_model';
import { notifyRoundEnded } from './game_model';

//DOM ELEMENTS---------------------------------------------------
const gameInfo = document.getElementById('game-info');
const counterContainer = document.getElementById('counter-container');
const pageContainer = document.getElementById('wikipage-container');
const infoContainer = document.getElementById('info-your-target-modal');
const infoGameCounter = document.getElementById('info-game-counter');
const infoGameMode = document.getElementById('info-game-mode');
const infoGameEndPageContainer = document.getElementById('info-game-end-page-container');
const infoGameCounterBig = document.getElementById('info-game-counter-big');

//DATASET--------------------------------------------------------
let gameRound;
let gameState;
let gameStartPage;
let gameEndPage;
let gameParticipation;
let gameMode;

//Time-----------------------------------------------------------
let gameStartTime;
let gameLaunchTime;
let minuteElapsed;
let secondElapsed;
let myInterval;
const waitingTime = 10;
let counterDisplay;

//Current page--------------------------------------------------
let currentPage = gameStartPage;


const initGame = () => {
  if(gameInfo){
    gameRound = gameInfo.dataset.round;
    gameState = gameInfo.dataset.state;
    gameStartPage = gameInfo.dataset.startPage;
    gameEndPage = gameInfo.dataset.endPage;
    gameParticipation = gameInfo.dataset.participation;
    gameMode = gameInfo.dataset.gameMode;
    gameStartTime = parseInt(gameInfo.dataset.startTime);
    gameLaunchTime = gameStartTime + waitingTime * 1000;
    requestEndPageContent(gameEndPage);
    myInterval = setInterval(gameLoop, 500);
  }
};

const gameLoop = () => {

  gameState = gameInfo.dataset.state;
  currentPage = getCurrentPage();
  // checkGameState();
  // applyGameModeConditions();

  switch (gameState) {
  //Game initialization-----------------------------------------------------------
  case 'init':
    infoContainer.style.display = "block";
    secondElapsed = Math.round(((gameLaunchTime - Date.now()) / 1000) % 60);
    if(secondElapsed > 4){
      counterDisplay = `Round starts in : ${secondElapsed}sec`;
      infoGameCounter.innerText = counterDisplay;
    } else {
      requestPageContent(gameStartPage);
      gameInfo.dataset.state = 'imminent';
      // gameState = gameInfo.dataset.state;
    }
    break;
  //-----------------------------------------------------------------------------
  case 'imminent':
    infoContainer.style.display = "block";
    infoGameCounterBig.style.display = "block";
    secondElapsed = Math.round(((gameLaunchTime - Date.now()) / 1000) % 60);
    counterDisplay = `Round starts in : ${secondElapsed}sec`;
    infoGameCounter.innerText = counterDisplay;
    if(secondElapsed === 0) {
      infoGameCounterBig.innerText = "GO!";
    } else if(secondElapsed < 0) {
      infoContainer.style.display = "none";
      infoGameCounterBig.style.display = "none";
      gameInfo.dataset.state = 'playing';
      // gameState = gameInfo.dataset.state;
    } else {
      infoGameCounterBig.innerText = secondElapsed;
    }
    break;
  //-----------------------------------------------------------------------------
  case 'playing':

    if(gameMode === "Premier arrivé"){
      if(currentPage === gameEndPage){notifyRoundEnded();}
    }
    break;
  //-----------------------------------------------------------------------------
  case 'ended':
  // display modal of end game with a button link to the show de round
    alert('someone won!');
    break;
  //-----------------------------------------------------------------------------
  default:
    // console.log('Sorry, we are out of ' + expr + '.');
}

};


// au moment ou on click sur la last page alors game ended

export{initGame};
