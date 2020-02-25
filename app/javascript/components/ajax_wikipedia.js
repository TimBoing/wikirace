
const requestAndDisplay = () => {
  const page_name = 'wagon';

  const displayContentOnPage = (content) => {
    const pageContainer = document.getElementById('test-container-for-receiving-ajax');
    pageContainer.insertAdjacentHTML('afterbegin', content);
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

