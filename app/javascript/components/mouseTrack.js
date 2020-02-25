const trackMouse = () => {
  const pageContainer = document.getElementById('test-container-for-receiving-ajax');
  const topMouse = document.getElementById('top-mouse');
  const leftMouse = document.getElementById('left-mouse');
  const portal = document.getElementById('portal-test');

  const trackIt = () => {
    const x = event.clientX;
    const y = event.clientY;
    const offsetX = pageContainer.getBoundingClientRect().left;
    const offsetY = pageContainer.getBoundingClientRect().top;
    const relativeX = x - offsetX;
    const relativeY = y - offsetY;
    leftMouse.innerHTML = `Left mouse : ${relativeX}`;
    topMouse.innerHTML = `Left mouse : ${relativeY}`;
    portal.style.left =  `${relativeX - 50}px`;
    portal.style.top = `${relativeY - 50}px`;
  }

  pageContainer.addEventListener('mousemove', (event) => {
    trackIt();
  });

}

export { trackMouse };

