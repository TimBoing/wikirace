import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const title = document.getElementById('#home-page-title');
  new Typed(title, {
    strings: ["Bienvenue","sur", "WikiRACE", "!!!"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
