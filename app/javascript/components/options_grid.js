const optionsSelection = () => {

  const searchBar = document.getElementById("round_search_bar");
  const reverse = document.getElementById("round_reverse");
  const searchBarOption = document.getElementById("grid-option-search-bar");
  const reverseOption = document.getElementById("grid-option-reverse");

  const toggleActive = (element) => {
    element.classList.toggle("selected");
  }


  if(searchBar){


    searchBarOption.addEventListener('click', (event) => {
      toggleActive(searchBarOption);
      if(searchBar.checked === true){
        searchBar.checked = false;
        console.log("changing value to 0");
      } else {
        searchBar.checked = true;
        console.log("changing value to 1");
      }

    });


    reverseOption.addEventListener('click', (event) => {
      toggleActive(reverseOption);
      if(reverse.checked === true){
        reverse.checked = false;
        console.log("changing value to 0");
      } else {
        reverse.checked = true;
        console.log("changing value to 1");
      }

    });

  }


}

export{optionsSelection};




