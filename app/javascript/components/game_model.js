import { displayPageContentOnInfoModal } from './game_view';
import { displayPageContent } from './game_view';

let currentPage;
const gameInfo = document.getElementById('game-info');

const getCurrentPage = () => {
  return currentPage;
};

const addVisitedPageToDatabase = (page) => {
  const gameParticipation = gameInfo.dataset.participation;
  const requestOptions = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: JSON.stringify({visited_page:{title:`${page}`}})
  };
  fetch(`http://${window.location.host}/round_participations/${gameParticipation}/visited_pages`, requestOptions)
    .catch(error => console.log('error', error));
};

const requestEndPageContent = (page) => {
  const requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };
  fetch(`https://fr.wikipedia.org/api/rest_v1/page/html/${page}`, requestOptions)
    .then(response => response.text())
    .then(result => displayPageContentOnInfoModal(result));
};

const requestPageContent = (page) => {
  currentPage = page;
  addVisitedPageToDatabase(page);
  const requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };
  fetch(`https://fr.wikipedia.org/api/rest_v1/page/html/${page}`, requestOptions)
    .then(response => response.text())
    .then(result => displayPageContent(result));
};

const notifyRoundEnded = () => {
  const gameRound = gameInfo.dataset.round;
  const requestOptions = {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    },
    body: JSON.stringify({state: 'ended'})
  };
  fetch(`http://${window.location.host}/rounds/${gameRound}`, requestOptions)
    .catch(error => console.log('error', error));

}


export{requestEndPageContent};
export{requestPageContent};
export{getCurrentPage};
export{notifyRoundEnded};