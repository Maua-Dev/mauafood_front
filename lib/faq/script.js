var answer = document.getElementsByClassName('answer');
var card = document.getElementsByClassName('card');
var icon = document.getElementsByClassName('icon');

var downIconClass = "ph ph-caret-down";
var upIconClass = "ph ph-caret-up";

Array.from(icon).forEach((element) => {
    var downIcon = document.createElement("i");
    downIcon.className = downIconClass;
    element.appendChild(downIcon);
});

Array.from(answer).forEach((element) => {
    element.style.height = '0';
    element.style.overflow = 'hidden';
    element.style.transition = 'height 0.4s ease';
});

Array.from(card).forEach((element, index) => {
    var cardIcon = icon[index].querySelector('i');

    element.addEventListener('click', function() {
        if (answer[index].style.height === '0px') {
            answer[index].style.height = answer[index].scrollHeight + 'px';
            cardIcon.className = upIconClass;
        } else {
            answer[index].style.height = '0';
            cardIcon.className = downIconClass;
        }
    });
});