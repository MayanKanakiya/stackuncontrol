const currentLocation = location.href;
let menuItem = document.getElementsByClassName('mainMenuLink');

//console.log(menuItem.length);
//console.log(currentLocation);

const menuLength = menuItem.length;
for (let i = 0; i < menuLength; i++) {
    try {

        if (menuItem[i].href === currentLocation) {
//        console.log(menuItem[i]);
            menuItem[i].className = 'active';
        }
    } catch (e) {
        console.warn("Location not found");
    }
}