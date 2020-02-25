const requestAndDisplay = () => {
  const page_name = 'wagon';
  const pageContainer = document.getElementById('test-container-for-receiving-ajax');



  const addEventsOnWikiLinks = () => {
    const wikiLinks = pageContainer.querySelectorAll('a');
    wikiLinks.forEach((link) => {
      console.log('adding event');
      link.addEventListener('click', (event)=> {
        event.preventDefault();
        alert('you clicked a link!');
      });
    });
  }


  const displayContentOnPage = (content) => {
    pageContainer.insertAdjacentHTML('afterbegin', content);

    addEventsOnWikiLinks();
  }

  const requestWikipageContent = () => {

    const requestOptions = {
    method: 'GET',
    redirect: 'follow'
    };

    fetch(`https://fr.wikipedia.org/api/rest_v1/page/html/${page_name}`, requestOptions)
      .then(response => response.text())
      .then(result => displayContentOnPage(result))
      .catch(error => console.log('error', error));

  }

  requestWikipageContent();
}

export { requestAndDisplay };

