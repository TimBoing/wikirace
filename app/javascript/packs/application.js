import "bootstrap";
import { startGame } from '../components/start_game';
import { initGame } from '../components/initialize_game';
import { requestAndDisplay } from '../components/play_game'
import { trackMouse } from '../components/mouseTrack';
import { joinRound } from '../components/join_round'
import { toggleNavbar } from '../components/toggle_navbar';
import '../components/copy_url'
import { handleGameModals } from '../components/modals_game';


startGame();
initGame();
requestAndDisplay();
toggleNavbar();
joinRound();
handleGameModals();



//trackMouse();
