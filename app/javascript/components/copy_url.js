const copy_button = document.getElementById("copy-button")

if (copy_button) {
  copy_button.addEventListener('click', (event) => {
    const input = document.getElementById("url");
    input.select();
    document.execCommand("copy");


    setTimeout(function () {
        document.getElementById('pop-up').classList.remove("d-none");
    });


    setTimeout(function () {
        document.getElementById('pop-up').classList.add("d-none");
    }, 160);






  });
}





