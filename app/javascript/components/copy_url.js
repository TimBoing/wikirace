const copy_button = document.getElementById("copy-button")

if (copy_button) {
  copy_button.addEventListener('click', (event) => {
    const input = document.getElementById("url");
    input.select();
    document.execCommand("copy");
  });
}





