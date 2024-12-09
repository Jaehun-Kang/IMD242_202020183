let slider = document.querySelector('#slider-1');
console.log(slider);
console.log(slider.value);
let aNewDiv = document.createElement('div');
let textContents = document.createTextNode(slider.value);
aNewDiv.appendChild(textContents);
document.body.appendChild(aNewDiv);
