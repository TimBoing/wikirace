const roundOptionModal = document.getElementById("round-options-modal-content-after-header");
const roundStartPage = document.getElementById("Tamere");
const roundEndPage = document.getElementById("Tonpere");
const recordSentence = document.getElementById("nombre-de-clicks-record");

const lookInDB = (start_end) => {
  console.log(start_end);
  const requestOptions = {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  }
  fetch(`http://${window.location.host}/path?${start_end}`, requestOptions)
  .then(response => response.json())
  .then((data) => {
    if (data.min_click === "") {
      recordSentence.innerHTML = "Pas encore de record sur ce chemin";
    } else {
      recordSentence.innerHTML = `Le record pour ce couple de pages est de : <strong>${data.min_click} clicks</strong>`;
    }
  });
};

const buildQueryString = (start, end) => {
  return new URLSearchParams({start_page: start, end_page: end}).toString();
}

const handleSelect = (event) => {
  console.log(start_end);
  const start_title = roundStartPage.value;
  const end_title = roundEndPage.value;
  const start_end = buildQueryString(start_title, end_title);
  console.log(start_end);
  lookInDB(start_end);

}

const checkRecord = () => {

  if(roundOptionModal){
    console.log("salut");
    roundStartPage.addEventListener("select2:close", handleSelect);
    roundEndPage.addEventListener("select2:close", handleSelect);
  }
}


export { checkRecord };
