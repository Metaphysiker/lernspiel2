function resultswal(title, text) {
    swal({
        title: title,
        width: 600,
        text: text,
        animation: false,
        customClass: 'animated bounceIn'
    }).then(function () {
        swal(
            'Übung abgeschlossen!',
            'Du hast 500 Punkte gewonnen!',
            'success'
        )
    });
}

function exercisecompleted(model, exercise, points) {
    $.ajax({
        type: "POST",
        url: "/exercisecompleted",
        data: {model: model, exercise: exercise, points: points }
    });
}