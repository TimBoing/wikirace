const easy_path_btn = document.getElementById("easy-path")
const easy_path_suggestion = document.getElementById("easy-path-suggestion")

const defineEasyPath = () => {
  if (easy_path_btn) {
    const roundStartPage = document.getElementById("select2-round_start_page-container");
    const roundEndPage = document.getElementById("select2-round_end_page-container");
    easy_path_btn.addEventListener('click', (event) => {
      const requestOptions = {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }
        }
        fetch(`http://${window.location.host}/path`, requestOptions)
        .then(response => response.json())
        .then((data) => {
          easy_path_suggestion.innerHTML = `Commencer à : <strong>${data.start_page.title}</strong> et finir à : <strong>${data.end_page.title}</strong>`;
        });

      // $(roundStartPage).val("Socrate");
      // $(roundStartPage).select2().trigger('change');
      // roundStartPage.value = "Socrate";
      // roundEndPage.innerText = "Philosophie";
    });
  }
}

export {defineEasyPath};



