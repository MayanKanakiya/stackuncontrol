new window.stacksEditor.StacksEditor(
        document.querySelector("#editor-example-1"),
        "",
        {
        }
);
let editorText = document.getElementsByClassName('ProseMirror')[0];
editorText.id = "stackEditor";
let stackEditor = document.getElementById('stackEditor');

let mainFormPost = document.getElementById("editPostMainForm");
let btnPost = document.getElementById("editPostBtn");
let txt1Container = document.getElementById("editor-example-1");

//set id for button disable when all 3 textboxs are empty - start here
txt1Container.lastChild.lastChild.setAttribute('id', 'editor1');
let txt1 = document.getElementById('editor1');
//set id for button disable when all 3 textboxs are empty - end here

//function for disable button when textboxs are empty - start code here
mainFormPost.addEventListener('input', () => {
    if (txt1.innerText.length >= 20) {
        btnPost.removeAttribute('disabled');
    } else {
        btnPost.setAttribute('disabled', 'disabled');
    }
});
//function for disable button when textboxs are empty - end code here

//hidden textboxs and div element - start code here
let hiddenTxt1 = document.getElementById("txt1");
let preview1 = document.getElementById("preview1");
//hidden textboxs and div element - end code here

// function for parseHTML to string - start here
function parseHTML() {
    console.log(stackEditor.innerText)
    preview1.innerText = "";
    var $preview1 = $("#preview1"),
            str = stackEditor.innerHTML,
            html = $.parseHTML(str),
            nodeNames = [];

    // Append the parsed HTML
    $preview1.append(html);
    console.log(preview1);
    hiddenTxt1.value = preview1.innerHTML;
    console.log(hiddenTxt1);
//    hiddenTxt1.value = preview1.innerText;

    stackEditor.innerText = "";
}
// function for parseHTML to string - end here