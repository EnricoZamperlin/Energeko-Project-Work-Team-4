var source = "./assets/energeko_menu.mp3"
var audio = new Audio(source);
audio.volume = 0.0
audio.loop = "true";

function playAudio() {
    document.querySelector(".audio-stop").style.display = "none";
    document.querySelector(".audio-play").style.display = "block";
    audio.volume = 1
    audio.play()
}

function stopAudio() {
    document.querySelector(".audio-stop").style.display = "block";
    document.querySelector(".audio-play").style.display = "none";
    audio.volume = 0
    audio.pause()
}