const pageContainer = document.getElementById('wikipage-container');
const endPageContainer = document.getElementById('end-page-container');
const counterContainer = document.getElementById('counter-container');
let roundEndPage;
let gameMode;
let startTime;
let startTimeJS;
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
  minuteElapsed = Math.floor(((Date.now() - startTimeJS) / 1000) / 60);
  secondElapsed = Math.round(((Date.now() - startTimeJS) / 1000) % 60);
  if(secondElapsed=== 60){secondElapsed = 0;};
  counterDisplay = `${minuteElapsed}min and ${secondElapsed}sec`;
  counterContainer.innerText = counterDisplay;
}

const startCounter = () => {
  //alert(typeof startTime);
  startTimeJS = new Date(startTime).getTime();
  myInterval = setInterval(updateCounter, 1000);

}

const initGame = () => {
  if(pageContainer) {
    roundEndPage = pageContainer.dataset.endPage;
    gameMode = pageContainer.dataset.gameMode;
    startTime = pageContainer.dataset.startTime;
    startCounter();
    requestEndPageContent(roundEndPage);
    console.log('Game Initialization');
  }
}

export {initGame};
