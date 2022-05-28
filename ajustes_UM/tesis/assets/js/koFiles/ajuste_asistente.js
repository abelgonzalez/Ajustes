/**
 * Created by Abel on 26/03/2015.
 */
$('#id_motivoAjusteId').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_documentacionAnalizadaId').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});
$('#id_cursoAjusteId').change(function () {
    $('#tab2').addClass('disabled');
    $('#tab3').addClass('disabled');
    $('#tab4').addClass('disabled');
});


var datos_ajuste1 = {};
$('#siguiente_datos_ajuste').click(function () {
    datos_ajuste1 = {
        'carreraestudiante': $('#carreraEstudianteId').text(),
        'motivo': $('#id_motivoAjusteId').val(),
        'documentacion': $('#id_documentacionAnalizadaId').val(),
        'curso': $('#id_cursoAjusteId').val()
    };

    $.get('/ajustes/validar_datos_ajusteAJAX/', datos_ajuste1, function (data) {
        data = JSON.parse(data);
        if (data.existe == "true") {
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
            $('#datos_ajuste_estudiante_block').load('/ajustes/datos_ajusteAJAX/')
        }
    })

});


$('#anterior_cohorte_ajuste').click(function () {
    $('#tab2').removeClass('active');
    $('#tab1').removeClass('disabled');
    $('#tab1').addClass('active');
    $('#_page_2').hide();
    $('#_page_1').fadeIn();
});

$('#siguiente_cohorte_ajuste').click(function () {
    $('#list_asign_ajuste').load('/ajustes/listAsigCohorteAJAX/' + $('#cohorte1').val() + '/');
    $('#datos_anho_semestre_block').load('/ajustes/anho_semestre/'+ $('#cohorte1').val() + '/');
    var timer = setInterval(function () {
        $('[id*="situacion1_"]').each(function () {
            var id = $(this)[0]['id'];
            id = id.replace('situacion1_', '');
            if ($(this).val() == 3) {
                $('#convalidada_label_' + id).removeClass('no-display');
                $('#convalidada1_' + id).removeClass('no-display');
            }
        });
        $('[id*="situacion1_"]').change(function () {
            var id = $(this)[0]['id'];
            id = id.replace('situacion1_', '');
            if ($(this).val() == 3) {
                $('#convalidada_label_' + id).removeClass('no-display');
                $('#convalidada1_' + id).removeClass('no-display');
            } else {
                $('#convalidada_label_' + id).addClass('no-display');
                $('#convalidada1_' + id).addClass('no-display');
            }
        });

        if ($('[id*="convalidada_label_"]').length > 0) {
            clearInterval(timer)
        }
    }, 1000);
    $('#tab2').removeClass('active');
    $('#tab3').removeClass('disabled');
    $('#tab3').addClass('active');
    $('#_page_2').hide();
    $('#_page_3').fadeIn();

    var not = $.Notify({
        caption: "Seleccione",
        content: "El estado de las asignaturas",
        timeout: 5000 // 5 seconds
    });

});

$('#anterior_asign_vencidas_ajuste').click(function () {
    $('#tab3').removeClass('active');
    $('#tab2').removeClass('disabled');
    $('#tab2').addClass('active');
    $('#_page_3').hide();
    $('#_page_2').fadeIn();
});
$('#siguiente_asign_vencidas_ajuste').click(function () {
    $('#tab3').removeClass('active');
    $('#tab4').removeClass('disabled');
    $('#tab4').addClass('active');
    $('#_page_3').hide();
    $('#_page_4').fadeIn();
    //Datos para mostrar al final del asistente

    var ajustes_resultado = [];
    $('[id*="situacion1_"]').each(function () {
        var id = $(this)[0]['id'];
        id = id.replace('situacion1_', '');
        /*   var convalidadas_list = '';
         for (var j in $('#convalidada1_' + id).val()) {
         convalidadas_list += $('#convalidada1_' + id).val()[j] + '-';
         }*/
        var situacion = {
            'id_asignatura': id,
            'situacion': $(this).val(),
            'convalidadas': $('#convalidada1_' + id).val()
        };
        ajustes_resultado.push(situacion);
    });
    var id = {
        'ajustes_resultado': ajustes_resultado,
        'tamanho': ajustes_resultado.length
    };

    $.get('/ajustes/obtener_ajusteestudianteAJAX/', id, function (data) {
        data = JSON.parse(data);
        $('#datos_ajuste_asignaturas_block').load('/ajustes/datos_ajusteestudiante/');
        var not = $.Notify({
            caption: "¿Está de acuerdo?",
            content: "Presione guardar cambios",
            timeout: 5000 // 5 seconds
        });
    });
    $('#id_anhoSemestreId').change(function () {
        $('#guardar_cambios_ajuste').attr('href', '/ajustes/ajuste_guardar/' + $('#id_anhoSemestreId').val() + '/')
        $('#guardar_cambios_ajuste_editar').attr('href', '/ajustes/ajusteestudiante/editar_guardar/' + $('#id_anhoSemestreId').val() + '/')
    });
});


/*
 $('#guardar_cambios_ajuste').click(function () {
 $('#list_asign_ajuste').load('/ajustes/listAsigCohorteAJAX/' + $('#cohorte1').val() + '/');

 var anhoSemestre = $('#cohorte1').val();
 $.get('/persona/expediente_guardar/', anhoSemestre, function (data) {

 });

 var not = $.Notify({
 caption: "Weno",
 content: "Pa ya van los datos y regreso a la página de Expedientes estudiantiles",
 timeout: 5000 // 5 seconds
 });
 });*/


