import { displayPageContentOnInfoModal } from './game_view';
import { displayPageContent } from './game_view';

const requestEndPageContent = (page) => {
  console.log("requesting page content");
  const requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };
  fetch(`https://fr.wikipedia.org/api/rest_v1/page/html/${page}`, requestOptions)
    .then(response => response.text())
    .then(result => displayPageContentOnInfoModal(result));
}

const requestPageContent = (page) => {
  console.log("requesting page content");
  const requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };
  fetch(`https://fr.wikipedia.org/api/rest_v1/page/html/${page}`, requestOptions)
    .then(response => response.text())
    .then(result => displayPageContent(result));
}



export{requestEndPageContent};
export{requestPageContent};
