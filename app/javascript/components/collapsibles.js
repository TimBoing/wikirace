const collapseOptions = () => {

  const roundOptionsBtn = document.getElementById("round-options-btn");
  const options = document.getElementById("round-options");

  if(roundOptionsBtn){
    roundOptionsBtn.addEventListener("click", (event) => {
      event.preventDefault;
      if(options.style.display === "block") {
        options.style.display = "none";
      } else {
        options.style.display = "block";
      }
    });
  }
}

export {collapseOptions};
