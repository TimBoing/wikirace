import Mark  from "mark.js/dist/mark.js" ;


const highlight = () => {
  const gameContainer = document.getElementById('game-container');
  const userFindInputButton= document.getElementById('userFindInputButton');

  if(gameContainer){
    userFindInputButton.addEventListener('click', (event) => {
      const instance = new Mark(document.getElementById("wikipage-container"));
      instance.unmark(input_to_search);
      const input_to_search = document.getElementById("userFindInputText").value
      instance.mark(input_to_search);
    });
  }
}


export { highlight };


  //<label>Find Text</label>
  //<input id="userFindInputText" type="text" value=""/>
  //<button id="userFindInputButton" type="button">Find</button>




