import "bootstrap";
//import "mark";
import { loadDynamicBannerText } from '../components/banner_typed';
import { handleRoundOptionsModal } from '../components/handle_modals';
// import { collapsePageChoice } from '../components/collapsibles';
import { startGame } from '../components/start_game';
import { initGame } from '../components/game_controller';
import { trackMouse } from '../components/mouseTrack';
import { joinRound } from '../components/join_round';
import { toggleNavbar } from '../components/toggle_navbar';
import '../components/copy_url';

// import { handleRoundPathsModals } from '../components/handle_modals';
import { handleRoundInfoModal } from '../components/handle_modals';
import { highlight } from '../components/marker';
import { alertBrowser } from '../components/alert_browser';
import { displayPathInfo } from '../components/path_info';




loadDynamicBannerText();
handleRoundOptionsModal();
// collapsePageChoice();
//loadDynamicBannerText();
startGame();
initGame();
toggleNavbar();
joinRound();
handleRoundInfoModal();
highlight();
// handleRoundPathsModals();
alertBrowser();
displayPathInfo();
//trackMouse();
