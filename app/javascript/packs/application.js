import "bootstrap";
import { startGame } from '../components/start_game';
import { initGame } from '../components/game_controller';
import { trackMouse } from '../components/mouseTrack';
import { joinRound } from '../components/join_round'
import { toggleNavbar } from '../components/toggle_navbar';
import '../components/copy_url'
import { handleGameModals } from '../components/modals_game';

startGame();
initGame();
toggleNavbar();
joinRound();
//handleGameModals();


//trackMouse();
