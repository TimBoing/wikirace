const pageContainer = document.getElementById('wikipage-container');
const endPageContainer = document.getElementById('end-page-container');
let roundEndPage;

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

const initGame = () => {
  if(pageContainer) {
    roundEndPage = pageContainer.dataset.endPage;
    requestEndPageContent(roundEndPage);
    console.log('Game Initialization');
  }
}

export {initGame};
