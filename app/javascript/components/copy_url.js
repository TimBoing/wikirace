const button = document.getElementById("copy-button")
button.addEventListener('click', (event) => {
  const input = document.getElementById("url");
  input.select();
  document.execCommand("copy");
});





