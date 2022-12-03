let mainForm = document.getElementById('mainSigninForm');
let email = document.getElementById('email');
let pass = document.getElementById('pass');
let btn = document.getElementById('signinBtn');

mainForm.addEventListener('input', () => {
    if (email.value.length > 0 && pass.value.length > 0) {
        btn.removeAttribute('disabled');
    } else {
        btn.setAttribute('disabled', 'disabled');
    }
});