'use strict';

// To avoid using the word new, I'm using 'neo' for variables

const divContainer = document.querySelector('#container');
const neoPara = document.createElement('p');

divContainer.appendChild(neoPara);
neoPara.textContent = 'Hey, I\'m Red!';
neoPara.style.color = 'red';
