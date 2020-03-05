const searchBar = () => {
  const search = document.getElementById("game-actions-search");

  if(search){
    const searchBox = document.getElementById("userFindInput");

    search.addEventListener('click', (event) => {
      searchBox.classList.toggle("hidden");
    });
  };
}


export{searchBar};
