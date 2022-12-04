 let mainForm = document.getElementById("userProfileForm-1");
            let uname = document.getElementById("uname");
            let aboutme = document.getElementById("aboutme");
            let btn = document.getElementById("saveProfileBtn");
            mainForm.addEventListener('input', () => {
                if (uname.value.length > 0 && aboutme.value.length > 0) {
                    btn.removeAttribute('disabled');
                } else {
                    btn.setAttribute('disabled', 'disabled');
                }
            });