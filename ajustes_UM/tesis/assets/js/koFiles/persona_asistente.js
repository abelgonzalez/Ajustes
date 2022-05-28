/**
 * Created by Abel on 26/03/2015.
 */
$('#carneIdentidad').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_nombre').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_apellidos').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_direccion').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_ubicacionId').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_nacionalidadId').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_sexoId').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_etniaId').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_correoElectronico').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#fechaIngESup').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_indiceAcademico').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});

var datos_estudiante1 = {};
$('#siguiente_estudiante').click(function () {

    datos_estudiante1 = {
        'carne': $('#carneIdentidad').val(),
        'nombre': $('#id_nombre').val(),
        'apellidos': $('#id_apellidos').val(),
        'direccion': $('#id_direccion').val(),
        'ubicacion': $('#id_ubicacionId').val(),
        'nacionalidad': $('#id_nacionalidadId').val(),
        'sexo': $('#id_sexoId').val(),
        'etnia': $('#id_etniaId').val(),
        'correo': $('#id_correoElectronico').val(),
        'fechaIngESup': $('#fechaIngESup').val(),
        'indice': $('#id_indiceAcademico').val()
    };

    $.get('/persona/validar_datos_estudianteAJAX/', datos_estudiante1, function (data) {
        data = JSON.parse(data);
        console.log(data);
        if (data['error']) {
            var not = $.Notify({
                caption: "Alerta",
                style: {background: '#E60026', color: '#FFFFFF'},
                content: data['mensaje'],
                timeout: 5000 // 5 seconds
            });
        }
        else {
            $('#tab1').removeClass('active');
            $('#tab2').removeClass('disabled');
            $('#tab2').addClass('active');
            $('#_page_1').hide();
            $('#_page_2').fadeIn();
            $('#datos_estudiante_block').load('/persona/datos_estudianteAJAX/');
        }
    })
});

$('#anterior_cohorte').click(function () {
    $('#tab2').removeClass('active');
    $('#tab1').removeClass('disabled');
    $('#tab1').addClass('active');
    $('#_page_2').hide();
    $('#_page_1').fadeIn();
});
$('#siguiente_cohorte').click(function () {
    $('#list_asign').load('/persona/listAsigCohorteAJAX/' + $('#cohorte1').val() + '/');
    $('#tab2').removeClass('active');
    $('#tab3').removeClass('disabled');
    $('#tab3').addClass('active');
    $('#_page_2').hide();
    $('#_page_3').fadeIn();
    var not = $.Notify({
        caption: "Seleccione",
        content: "Las asignaturas que el estudiante tiene vencidas en este cohorte.",
        timeout: 5000 // 5 seconds
    });
});

var selecteds = '';

$('#anterior_asign_vencidas').click(function () {
    $('#tab3').removeClass('active');
    $('#tab2').removeClass('disabled');
    $('#tab2').addClass('active');
    $('#_page_3').hide();
    $('#_page_2').fadeIn();
});
$('#siguiente_asign_vencidas').click(function () {
    selecteds = '';
    $('#tab3').removeClass('active');
    $('#tab4').removeClass('disabled');
    $('#tab4').addClass('active');
    $('#_page_3').hide();
    $('#_page_4').fadeIn();
    $('.list').each(function (i, e) {
        $(this).click(function () {
            $('#tab4').removeClass('active');
            $('#tab4').addClass('disabled');
        });
        if ($(this).hasClass('active')) {
            var id = $(this).attr('id').replace('cuadro', '');
            selecteds += id + '-';
        }
    });
    var send = {'send': selecteds};
    console.log(send);
    $('#datos_estudiante_vencidas_block').load('/persona/datos_estudiante_vencidas/' + selecteds);
    var not = $.Notify({
        caption: "¿Está de acuerdo?",
        content: "Presione guardar cambios",
        timeout: 5000 // 5 seconds
    });
});
/*

 $('#guardar_cambios_estudiante').click(function () {

 var send = {'datos_estudiante': datos_estudiante1, 'cohorte': $('#cohorte1').val(), 'listaAsigVencidas': selecteds};

 $.get('/persona/expediente_guardar/', send, function (data) {

 });*/


