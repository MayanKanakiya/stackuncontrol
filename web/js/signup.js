let mainForm = document.getElementById('mainSignupForm');
let uname = document.getElementById('uname');
let email = document.getElementById('email');
let pass = document.getElementById('pass');
let re_pass = document.getElementById('re-pass');
let btn = document.getElementById('signupBtn');

mainForm.addEventListener('input', () => {
    if (uname.value.length && email.value.length > 0 && pass.value.length > 0 && re_pass.value.length > 0) {
        btn.removeAttribute('disabled');
    } else {
        btn.setAttribute('disabled', 'disabled');
    }
});