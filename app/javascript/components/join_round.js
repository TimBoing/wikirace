const joinRound = () => {
  const roundInput = document.getElementById("round-input");
  const btnSubmit = document.getElementById("round-input-submit");

  const testURL = (url) => {
    const requestOptions = {
      method: 'GET',
      redirect: 'follow'
    };
    fetch(`${url}`, requestOptions)
      .then(response => {
        if(response.status === 200){
          window.location.href = `../rounds/${roundInput.value}/round_participations/new`;
        } else {
          alert("Tu t'es gourré man");
        }
      });
  }

  if (btnSubmit){
    btnSubmit.addEventListener("click", (event) => {
      testURL(`../rounds/${roundInput.value}/round_participations/new`);
      //
    });
  }
}

export {joinRound};
