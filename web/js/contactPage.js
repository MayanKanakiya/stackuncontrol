let mainForm = document.getElementById('mainContactForm');
let name = document.getElementById('name');
let email = document.getElementById('email');
let cno = document.getElementById('cno');
let desc = document.getElementById('desc');
let btn = document.getElementById('contactBtn');

mainForm.addEventListener('input', () => {
    if (name.value.length > 0 && email.value.length > 0 && cno.value.length > 0 && desc.value.length > 0) {
        btn.removeAttribute('disabled');
    } else {
        btn.setAttribute('disabled', 'disabled');
    }
});