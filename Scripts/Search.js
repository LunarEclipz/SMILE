function searchAdmin() {
    var input = document.getElementById('evtbSearch').value;
    var filter = input.toUpperCase();
    var cards = document.querySelectorAll('.evmainDiv');
    var name = document.querySelectorAll('.evname');
    var cost = document.querySelectorAll('.evcost');
    var date = document.querySelectorAll('.evdate');
    var location = document.querySelectorAll('.evlocation');
    for (var i = 0; i < cards.length; i++) {
        var Name = name[i].dataset.names;
        var Cost = cost[i].dataset.names;
        var Date = date[i].dataset.names;
        var Location = location[i].dataset.names;
        if (Name.toUpperCase().includes(filter) || Cost.toUpperCase().includes(filter) || Date.includes(filter) || Location.toUpperCase().includes(filter)) {
            cards[i].style.display = "";
        }
        else {
            cards[i].style.display = "none";
        }
    }
}


function searchUser() {
    var input = document.getElementById('UevtbSearch').value;
    var filter = input.toUpperCase();
    var cards = document.querySelectorAll('.UevmainDiv');
    var name = document.querySelectorAll('.Uevname');
    var cost = document.querySelectorAll('.Uevcost');
    var date = document.querySelectorAll('.Uevdate');
    var location = document.querySelectorAll('.Uevlocation');
    var join = document.querySelectorAll('.Uevjoin');
    for (var i = 0; i < cards.length; i++) {
        var Name = name[i].dataset.namers;
        var Cost = cost[i].dataset.namers;
        var Date = date[i].dataset.namers;
        var Location = location[i].dataset.namers;
        var Join = join[i].dataset.namers;
        console.log(Location)
        if (Name.toUpperCase().includes(filter) || Cost.toUpperCase().includes(filter) || Date.includes(filter) || Join.includes(filter) || Location.toUpperCase().includes(filter)) {
            cards[i].style.display = "";
        }
        else {
            cards[i].style.display = "none";
        }
    }
}


$(function () {
    let searchbut = document.getElementById('searchbut');
    let Usearchbut = document.getElementById('Usearchbut');

    if (searchbut) {
        searchbut.addEventListener('click', searchAdmin);
    }

    if (Usearchbut) {
        Usearchbut.addEventListener('click', searchUser);
    }
});