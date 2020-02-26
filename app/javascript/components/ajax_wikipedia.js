const requestAndDisplay = () => {
  const page_name = 'Constantin_Ier_(empereur_romain)';
  const pageContainer = document.getElementById('zoom-container');
  let previousPage;
  let randomPage;

  // This AJAX request allows to get the html of a page by proviging the last part of a wiki url

  const requestWikipageContent = (page) => {
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

  // This is an atttempt to get a randomly generated page title

  const requestRandomPageTitle = () => {
    var requestOptions = {
      method: 'GET',
      redirect: 'follow'
    };

    fetch("https://fr.wikipedia.org/api/rest_v1/page/random/title", requestOptions)
      .then(response => response.json())
      .then(result => {
        requestWikipageContent(result.items[0].title);
      });
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
    console.log('I finished the content displaying');
  }


  // We call the whole machinery when we load the page with the game container

  if(pageContainer){
    requestRandomPageTitle();
  }

}

export { requestAndDisplay };

// event.currentTarget.getAttribute("href") will give you ./endofurl
// event.currentTarget.hrf will give you the full url
// str.substring(indiceA[, indiceB]) ==> start and end
// les liens morts ont une class "new"
