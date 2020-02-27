import "bootstrap";
import { requestAndDisplay } from '../components/ajax_wikipedia'
import { trackMouse } from '../components/mouseTrack';
import { joinRound } from '../components/join_round'
import { toggleNavbar } from '../components/toggle_navbar';
import '../components/copy_url'

requestAndDisplay();
toggleNavbar();
joinRound();



//trackMouse();
