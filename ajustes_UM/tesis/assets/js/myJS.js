/**
 * Created by Abel on 29/04/14.
 */


function ComboUniversidad1() {
    var show = document.getElementById('universidad1').value;
    alert(show);
}
function VerAsignaturaCohorte(idAsignatura) {
    window.location.href = "/planEstudio/asignaturacohorte/detalle/" + idAsignatura

}
function EditarAsignaturaCohorte(idAsignatura) {
    window.location.href = "/planEstudio/asignaturacohorte/editar/" + idAsignatura

}
function EliminarAsignaturaCohorte(idAsignatura) {
    window.location.href = "/planEstudio/asignaturacohorte/eliminar/" + idAsignatura
}

function OcultarListarAsignaturaCohorte() {

    //document.getElementById("listmark").attribute("onclick","new_function_name()");
    document.getElementById("listmark1").off('onclick')
    var not = $.Notify({
        caption: "123",
        content: "Ok???",
        timeout: 5000 // 5 seconds
    });
    //window.location.href = "/planEstudio/asignaturacohorte/eliminar/" + idAsignatura


}
function Cancelar() {
    alert('asasa');
    var not = $.Notify({
        caption: "123",
        content: "Ok???",
        timeout: 5000 // 5 seconds
    });
    $.Dialog({
        title: 'Wizard',
        content: 'Cancel button clicked',
        shadow: true,
        padding: 10
    });
    // window.location.href = "/planEstudio/asignaturacohorte/eliminar/" + idAsignatura
}
$(function () {
    $('#wizard').wizard({
        locale: 'ru',
        onCancel: function () {
            $.Dialog({
                title: 'Wizard',
                content: 'Cancel button clicked',
                shadow: true,
                padding: 10
            });
        },
        onHelp: function () {
            $.Dialog({
                title: 'Wizard',
                content: 'Help button clicked',
                shadow: true,
                padding: 10
            });
        },
        onFinish: function () {
            $.Dialog({
                title: 'Wizard',
                content: 'Finish button clicked',
                shadow: true,
                padding: 10
            });
        }
    });
});
