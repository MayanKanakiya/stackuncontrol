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
let editorText = document.getElementsByClassName('ProseMirror')[0];
editorText.id = "stackEditor";
let stackEditor = document.getElementById('stackEditor');

let mainForm = document.getElementById("askQuestionMainForm");
let title = document.getElementById("title");

let hiddenTxt1 = document.getElementById("txt1");
let hiddenTxt2 = document.getElementById("txt2");
let preview1 = document.getElementById("preview1");
let preview2 = document.getElementById("preview2");


let txt1Container = document.getElementById("editor-example-1");
let txt2Container = document.getElementById("editor-example-2");
txt1Container.lastChild.lastChild.setAttribute('id', 'editor1');
txt2Container.lastChild.lastChild.setAttribute('id', 'editor2');

let txt1 = document.getElementById('editor1');
let txt2 = document.getElementById('editor2');

//hiddenTxt1.value = txt1.innerHTML;
//hiddenTxt2.value = txt2.innerHTML;

let btn = document.getElementById("questionBtn");
mainForm.addEventListener('input', () => {
    if (txt1.innerText.length >= 20 && txt2.innerText.length >= 20 && title.value.length >= 20) {
        btn.removeAttribute('disabled');
    } else {
        btn.setAttribute('disabled', 'disabled');
    }
});

// remove 'plainText' text inside code - start here
stackEditor.addEventListener('input', (e) => {
    let languageEditorText = document.getElementsByClassName('js-language-indicator')[0];
    if (languageEditorText != null) {
        languageEditorText.id = "languageText";
        let languageText = document.getElementById('languageText');
        languageText.innerText = "";
    }
});
// remove 'plainText' text inside code - end here 

// function for parseHTML to string - start here
function parseHTML() {
    console.log(stackEditor.innerText)
    preview1.innerText = "";
    preview2.innerText = "";
//    parseHTML in textbox 1 - start code
    var $preview1 = $("#preview1"),
            str = stackEditor.innerHTML,
            html = $.parseHTML(str),
            nodeNames = [];

    // Append the parsed HTML
    $preview1.append(html);
    console.log(preview1);
     hiddenTxt1.value = preview1.innerHTML;
//    hiddenTxt1.value = preview1.innerText;
//    parseHTML in textbox 1 - end code
    
//    parseHTML in textbox 2 - start code
    var $preview2 = $("#preview2"),
            str = stackEditor.innerHTML,
            html = $.parseHTML(str),
            nodeNames = [];

    // Append the parsed HTML
    $preview2.append(html);
    console.log(preview2);
     hiddenTxt2.value = preview2.innerHTML;
//    hiddenTxt2.value = preview2.innerText;
//    parseHTML in textbox 1 - end code

    // console.log(stackEditor.innerHTML.length);
    stackEditor.innerText = "";
}
// function for parseHTML to string - end here
