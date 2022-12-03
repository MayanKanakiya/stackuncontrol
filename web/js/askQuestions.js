new window.stacksEditor.StacksEditor(
        document.querySelector("#editor-example-1"),
        "",
        {
        }
);
new window.stacksEditor.StacksEditor(
        document.querySelector("#editor-example-2"),
        "",
        {
        }
);

let mainForm = document.getElementById("askQuestionMainForm");
let title = document.getElementById("title");

let txt1Container = document.getElementById("editor-example-1");
let txt2Container = document.getElementById("editor-example-2");
txt1Container.lastChild.lastChild.setAttribute('id', 'editor1');
txt2Container.lastChild.lastChild.setAttribute('id', 'editor2');

let txt1 = document.getElementById('editor1');
let txt2 = document.getElementById('editor2');

let btn = document.getElementById("questionBtn");
mainForm.addEventListener('input', () => {
    if (txt1.innerText.length >= 20 && txt2.innerText.length >= 20 && title.value.length >= 20) {
        btn.removeAttribute('disabled');
    } else {
        btn.setAttribute('disabled', 'disabled');
    }
});