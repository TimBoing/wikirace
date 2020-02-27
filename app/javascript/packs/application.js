import "bootstrap";
import { initGame } from '../components/initialize_game';
import { requestAndDisplay } from '../components/play_game'
import { trackMouse } from '../components/mouseTrack';
import { joinRound } from '../components/join_round'
import { toggleNavbar } from '../components/toggle_navbar';
import { handleGameModals } from '../components/modals_game';

initGame();
requestAndDisplay();
toggleNavbar();
joinRound();
handleGameModals();

//trackMouse();
