import { requestEndPageContent } from './game_model';
import { requestPageContent } from './game_model';

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
      gameState = gameInfo.dataset.state;
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
    } else {
      infoGameCounterBig.innerText = secondElapsed;
    }
    break;
  //-----------------------------------------------------------------------------
  case 'playing':
    break;
  //-----------------------------------------------------------------------------
  case 'ended':
    break;
  //-----------------------------------------------------------------------------
  default:
    // console.log('Sorry, we are out of ' + expr + '.');
}

};


// <div id="info-your-target-modal" class="modal">
//   <div id="info-your-target-modal-content" class="modal-content">
//     <div id="info-your-target-modal-header">
//       <span class="close" id="info-close">&times;</span>
//     </div>
//     <div id="info-your-target-modal-container">
//       <div id="info-game-counter">The game will start in : </div>
//       <div id="info-game-mode">The game mode is : <%= @round.game_mode %></div>
//       <div id="info-game-mode-rule">The rules for this mode are :</div>
//       <div id="info-game-end-page-container"></div>
//       <div id="info-game-counter-big"></div>
//     </div>
//   </div>
// </div>

export{initGame};
