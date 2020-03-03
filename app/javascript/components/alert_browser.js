import swal from 'sweetalert';

const alertBrowser = () => {

  const gameInfo = document.getElementById("game-info");
  // const infoModal = document.getElementById("info-your-target-modal");


  if(gameInfo) {
    if (window.history && history.pushState) {
      addEventListener('load', function() {
        history.pushState(null, null, null);
        addEventListener('popstate', function() {
          const options = {   title: "ATTENTION", text: "Impossible de quitter la partie en cours !", icon: "warning"}; // buttons: { confirm: { className: 'btn-tim' }}
          const stayOnPage = swal(options);
          history.pushState(null, null, null);
        });
      });
    }
  };
}

export { alertBrowser };
