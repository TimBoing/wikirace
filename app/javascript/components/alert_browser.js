const alertBrowser = () => {

  const gameInfo = document.getElementById("game-info");

  if(gameInfo){
    if (window.history && history.pushState) {
      addEventListener('load', function() {
        history.pushState(null, null, null);
        addEventListener('popstate', function() {
          var stayOnPage = confirm("ATTENTION, vous aller quitter la partie");
          if (!stayOnPage) {
            history.pushState(null, null, null);
          } else {
            history.back()
          }
        });
      });
    }
  };

}

export { alertBrowser };