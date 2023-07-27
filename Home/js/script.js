var source = "./assets/energeko_menu.mp3"
var audio = new Audio(source);
audio.volume = 0.0
audio.loop = "true";

// Volume musica
let audio_stop = document.querySelector(".audio-stop");
let audio_play = document.querySelector(".audio-play");

function playAudio() {
    audio_stop.style.display = "none";
    audio_play.style.display = "block";
    audio.volume = 1
    audio.play()
}
function stopAudio() {
    audio_stop.style.display = "block";
    audio_play.style.display = "none";
    audio.volume = 0
    audio.pause()
}

// Sezione impostazione
let cont_settings = document.querySelector(".cont-form");

function settings() {
    cont_settings.style.display == 'grid' ? cont_settings.style.display = 'none' : cont_settings.style.display = 'grid';
}