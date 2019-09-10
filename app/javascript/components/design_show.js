const pins         = document.querySelectorAll(".design-photo-pin");
const toggleButton = document.querySelector("#toggle-pins-button");

function showCoords(event) {
  const x      = event.clientX;
  const y      = event.clientY;
  const coords = [x,y];
  document.querySelector("#demo").innerHTML = coords;
};

function showAllPins() {
  pins.forEach((pin) => {
    pin.classList.add("visible")
  });
}

function hideAllPins() {
  pins.forEach((pin) => {
    pin.classList.remove("visible")
  });
}

function togglePins() {
  const visiblePins = document.querySelectorAll(".design-photo-pin.visible");

  if (visiblePins.length === 0) {
    toggleButton.innerHTML = "<i class=\"fas fa-eye-slash\"></i>";
    showAllPins()
  } else {
    toggleButton.innerHTML = "<i class=\"fas fa-eye\"></i>";
    hideAllPins()
  }
}

function showPin(comment_id) {
  const clickedPin = document.querySelector('[data-comment-id="' + comment_id + '"]');

  hideAllPins();
  clickedPin.classList.add("visible");
  toggleButton.innerHTML = "<i class=\"fas fa-eye-slash\"></i>";
}
