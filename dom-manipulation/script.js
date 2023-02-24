'use strict';

// To avoid using the word new, I'm using 'neo' for variables

const divContainer = document.querySelector('#container');
const neoPara = document.createElement('p');
const neoHead3 = document.createElement('h3');

divContainer.appendChild(neoPara);
neoPara.textContent = 'Hey, I\'m Red!';
neoPara.style.color = 'red';

divContainer.appendChild(neoHead3);
neoHead3.textContent = 'I\'m a blue h3!';
neoHead3.style.color = 'blue';
