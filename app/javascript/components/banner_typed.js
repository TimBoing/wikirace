import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const title = document.getElementById('#home-page-title');

  if(title){
    new Typed(title, {
      strings: ["", "Defiez-vous","sur", "WikiRACE !!!"],
      typeSpeed: 120,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
