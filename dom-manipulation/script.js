'use strict';

// To avoid using the word new, I'm using 'neo' for variables

const divContainer = document.querySelector('#container');
const neoPara = document.createElement('p');
divContainer.appendChild(neoPara);
neoPara.textContent = 'Hey, I\'m Red!';
neoPara.style.color = 'red';

const neoHead3 = document.createElement('h3');
divContainer.appendChild(neoHead3);
neoHead3.textContent = 'I\'m a blue h3!';
neoHead3.style.color = 'blue';

const neoDiv = document.createElement('div');
divContainer.appendChild(neoDiv);
neoDiv.style.border = '1px solid black';
neoDiv.style.backgroung = 'pink';

    const neoHead1 = document.createElement('h1');
    neoDiv.appendChild(neoHead1);
    const neoPara2 = document.createElement('p');
    neoDiv.appendChild(neoPara2);
    neoHead1.textContent = 'I\'m in a div!';
    neoPara2.textContent = 'Me too!';

const btn = document.querySelector('#btn');
btn.addEventListener('click', function (e)
{
    console.log(e.target);
});

btn.addEventListener('click', function (e)
{
    e.target.style.background = 'blue';
});