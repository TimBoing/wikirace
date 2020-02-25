const requestAndDisplay = () => {
  const page_name = 'Faculté_de_théologie_protestante_de_Strasbourg';
  const pageContainer = document.getElementById('test-container-for-receiving-ajax');
  let previousPage;

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

  const displayContentOnPage = (content) => {
    pageContainer.insertAdjacentHTML('afterbegin', content);
    addEventsOnWikiLinks();
  }



  requestWikipageContent(page_name);
}

export { requestAndDisplay };

// event.currentTarget.getAttribute("href") will give you ./endofurl
// event.currentTarget.hrf will give you the full url
// str.substring(indiceA[, indiceB]) ==> start and end
// les liens morts ont une class "new"
