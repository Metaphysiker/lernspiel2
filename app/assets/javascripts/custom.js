function resultswal(title, text, points, model, exercise, state) {
    swal({
        title: title,
        width: 600,
        text: text,
        animation: false,
        customClass: 'animated bounceIn'
    }).then(function () {
        swal(
            'Übung abgeschlossen!',
            'Du hast ' + points + ' Punkte gewonnen!',
            'success'
        );

        $.ajax({
            type: "POST",
            url: "/exercisecompleted",
            data: {model: model, exercise: exercise, points: points, state: state }
        });
    });
}

function tadaswal(title, text, secondswal) {
    swal({
        title: title,
        width: 600,
        text: text,
        animation: false,
        customClass: 'animated bounceIn'
    }).then(function () {
        console.log(secondswal);
        secondswal
    });
}

function exercisecompletedswal(title, text, model, exercise, state, points) {

    $.ajax({
        type: "POST",
        url: "/exercisecompleted",
        data: {model: model, exercise: exercise, points: points, state: state }
    });

    swal({
        title: title,
        width: 600,
        text: text,
        animation: false,
        customClass: 'animated bounceIn'
    });
}

function exercisecompleted1(model, exercise, state, points) {
    $.ajax({
        type: "POST",
        url: "/exercisecompleted",
        data: {model: model, exercise: exercise, points: points, state: state }
    });
}