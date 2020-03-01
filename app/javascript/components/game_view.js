import { requestPageContent } from './game_model';

const displayPageContentOnInfoModal = (page) => {

  const infoGameEndPageContainer = document.getElementById('info-game-end-page-container');
  infoGameEndPageContainer.insertAdjacentHTML('afterbegin', page);

  const wikiLinks = infoGameEndPageContainer.querySelectorAll('a');
  wikiLinks.forEach((link) => {
    link.addEventListener('click', (event)=> {
      event.preventDefault();
    });
  });
};


const displayPageContent = (page) => {

  const pageContainer = document.getElementById('wikipage-container');
  pageContainer.insertAdjacentHTML('afterbegin', page);

  const wikiLinks = pageContainer.querySelectorAll('a');
  wikiLinks.forEach((link) => {
    link.addEventListener('click', (event)=> {
      event.preventDefault();
      if(event.currentTarget.classList.contains('new')){
        alert('ce lien est mort');
      }else{
        const linkRef = event.currentTarget.getAttribute("href");
        const stripedRef = linkRef.substring(2);
        pageContainer.innerHTML = '';
        requestPageContent(stripedRef);
      }
    });
  });
};

export {displayPageContentOnInfoModal};
export {displayPageContent};
