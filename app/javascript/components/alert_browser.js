import swal from 'sweetalert/dist/sweetalert.min.js';

const alertBrowser = () => {

  const gameInfo = document.getElementById("game-info");
  // const infoModal = document.getElementById("info-your-target-modal");


  if(gameInfo) {
    if (window.history && history.pushState) {
      addEventListener('load', function() {
        history.pushState(null, null, null);
        addEventListener('popstate', function() {
          const options = { title: "ATTENTION", text: "Cette action est impossible dans la partie en cours !", icon: "warning"}; // buttons: { confirm: { className: 'btn-tim' }}
          const stayOnPage = swal(options);
          history.pushState(null, null, null);
        });
      });
    }

    window.onbeforeunload = function() {
      // const options = { title: "ATTENTION", text: "Cette action est impossible dans la partie en cours XXX!", icon: "warning"}; // buttons: { confirm: { className: 'btn-tim' }}
      // const stayOnPage = swal(options);
      return "Dude, are you sure you want to leave? Think of the kittens!";
    }

  };
}

export { alertBrowser };
