import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const title = document.getElementById('#home-page-title');
  if(title){
    new Typed(title, {
      strings: ["Enter","the", "WikiRACE", "!!!"],
      typeSpeed: 80,
      loop: true
    });
  }

}

export { loadDynamicBannerText };
