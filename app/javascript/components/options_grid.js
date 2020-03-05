const optionsSelection = () => {
  const options = document.querySelectorAll(".selectable-option");

  if(options){

    options.forEach((option) => {

      option.addEventListener('click', (event) => {
        option.classList.toggle("active");
        console.log("Im here");
      });


    });


  }


}

export{optionsSelection};
