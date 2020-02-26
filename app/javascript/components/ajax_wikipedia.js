const requestAndDisplay = () => {
  const page_name = 'Constantin_Ier_(empereur_romain)';
  const pageContainer = document.getElementById('wikipage-container');
  let roundParticipation;
  let roundStartPage;
  let roundEndPage;

  if(pageContainer){
    roundParticipation = pageContainer.dataset.participation;
    roundStartPage = pageContainer.dataset.startPage;
    roundEndPage = pageContainer.dataset.endPage;
    console.log(`the start page : ${pageContainer.dataset.startPage}`);
    console.log(`the end page : ${pageContainer.dataset.endPage}`);
    console.log(`the participation # : ${roundParticipation}`);
  }
  let previousPage;
  let randomPage;



  // MA MASTERPIECE! -----------------------------------------------------------------------------------------
  // AJAX Request qui crée une nouvelle visited page dans la DB!!!!!!!!!!! J´ai galéré de ouf...pas touche batard!
  const addVisitedPageToDatabase = (page) => {
    const requestOptions = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify({visited_page:{title:`${page}`}})
    };
    fetch(`../round_participations/${roundParticipation}/visited_pages`, requestOptions)
      .catch(error => console.log('error', error));
  }
  // FIN DE MA MASTERPIECE! -----------------------------------------------------------------------------------------



  // This AJAX request allows to get the html of a page by proviging the last part of a wiki url
  const requestWikipageContent = (page) => {
    addVisitedPageToDatabase(page);
    previousPage = page;
    console.log(previousPage);
    const requestOptions = {
      method: 'GET',
      redirect: 'follow'
    };
    fetch(`https://fr.wikipedia.org/api/rest_v1/page/html/${page}`, requestOptions)
      .then(response => response.text())
      .then(result => displayContentOnPage(result))
      .catch(error => console.log('error', error));
  }

  // This adds eventListeners on all links in the page returned
  const addEventsOnWikiLinks = () => {
    const wikiLinks = pageContainer.querySelectorAll('a');
    wikiLinks.forEach((link) => {
      link.addEventListener('click', (event)=> {
        event.preventDefault();

        if(event.currentTarget.classList.contains('new')){
          alert('ce lien est mort')
        }else{
          const linkRef = event.currentTarget.getAttribute("href");
          const stripedRef = linkRef.substring(2);
          pageContainer.innerHTML = '';
          requestWikipageContent(stripedRef);
        }
      });
    });

  }

  // This visually displays the content of the page in the container of the page
  const displayContentOnPage = (content) => {
    pageContainer.insertAdjacentHTML('afterbegin', content);
    addEventsOnWikiLinks();
  }

  // We call the whole machinery when we load the page with the game container (ie: the game_container exists)
  if(pageContainer){
    requestWikipageContent(roundStartPage);
  }

  //addVisitedPageToDatabase('une page');

}

export { requestAndDisplay };

// event.currentTarget.getAttribute("href") will give you ./endofurl
// event.currentTarget.hrf will give you the full url
// str.substring(indiceA[, indiceB]) ==> start and end
// les liens morts ont une class "new"


// une requete pour appeler un titre de page random est appelée
// elle appelle une requete pour choper le contenu html de la page wiki correspondante à ce code
// Cette derniere appelle une fonction qui display le contenu qui résultait
