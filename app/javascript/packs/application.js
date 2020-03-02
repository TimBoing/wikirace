import "bootstrap";
//import "mark";
import { loadDynamicBannerText } from '../components/banner_typed';
import { collapseOptions } from '../components/collapsibles';
import { startGame } from '../components/start_game';
import { initGame } from '../components/game_controller';
import { trackMouse } from '../components/mouseTrack';
import { joinRound } from '../components/join_round';
import { toggleNavbar } from '../components/toggle_navbar';
import '../components/copy_url';
import { handleGameModals } from '../components/handle_modals';
import { handleRoundInfoModal } from '../components/handle_modals';
import { highlight } from '../components/marker';



collapseOptions();
loadDynamicBannerText();
startGame();
initGame();
toggleNavbar();
joinRound();
//handleGameModals();
handleRoundInfoModal();
highlight();

//trackMouse();
