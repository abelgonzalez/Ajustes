$('#universidad1').change(function () {
    var id = {'idUni': $('#universidad1').val()};
    $('#facultad1').find('option').remove()
    $('#carrera1').find('option').remove()
    $('#tipo_curso1').find('option').remove()
    $('#plan_estudio1').find('option').remove()
    $('#curso1').find('option').remove()
    $('#cohorte1').find('option').remove()
    $.get('/planEstudio/obtener_facultadAJAX/', id, function (data) {
        data = JSON.parse(data);
        var ids = [];
        for (var i in data) {
            if (ids.indexOf(data[i]['id']) == -1) {
                ids.push(data[i]['id']);
                $('#facultad1').append(new Option(data[i]['nombre'], data[i]['id']))
            }
        }
        var id = {'idUni': $('#universidad1').val(), 'idFac': $('#facultad1').val()};
        $.get('/planEstudio/obtener_carreraAJAX/', id, function (data) {
            data = JSON.parse(data);
            var ids = [];
            for (var i in data) {
                if (ids.indexOf(data[i]['id']) == -1) {
                    ids.push(data[i]['id']);
                    $('#carrera1').append(new Option(data[i]['nombre'], data[i]['id']))
                }
            }
            var id = {'idUni': $('#universidad1').val(), 'idFac': $('#facultad1').val(), 'idCar': $('#carrera1').val()};
            $.get('/planEstudio/obtener_tipocursoAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#tipo_curso1').append(new Option(data[i]['nombre'], data[i]['id']))
                }
                var id = {
                    'idUni': $('#universidad1').val(),
                    'idFac': $('#facultad1').val(),
                    'idCar': $('#carrera1').val(),
                    'idCarTipo': $('#tipo_curso1').val()
                };
                $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
                    data = JSON.parse(data);
                    for (var i in data) {
                        $('#plan_estudio1').append(new Option(data[i]['nombre'], data[i]['id']))
                    }
                    var id = {
                        'idUni': $('#universidad1').val(),
                        'idFac': $('#facultad1').val(),
                        'idCar': $('#carrera1').val(),
                        'idCarTipo': $('#tipo_curso1').val(), 'idPlanE': $('#plan_estudio1').val()
                    };
                    $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
                        data = JSON.parse(data);
                        for (var i in data) {
                            $('#curso1').append(new Option(data[i]['nombre'], data[i]['id']))
                        }
                        var id = {
                            'idUni': $('#universidad1').val(),
                            'idFac': $('#facultad1').val(),
                            'idCar': $('#carrera1').val(),
                            'idCarTipo': $('#tipo_curso1').val(),
                            'idPlanE': $('#plan_estudio1').val(),
                            'idCurso': $('#curso1').val()
                        };
                        $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                            data = JSON.parse(data);
                            for (var i in data) {
                                $('#cohorte1').append(new Option(data[i]['comentario'], data[i]['id']))
                            }
                            $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());

                        })
                    })
                })
            })
        })

    })
})

var id = {'idUni': $('#universidad1').val()};
$.get('/planEstudio/obtener_facultadAJAX/', id, function (data) {
    data = JSON.parse(data);
    var ids = [];
    for (var i in data) {
        if (ids.indexOf(data[i]['id']) == -1) {
            ids.push(data[i]['id']);
            $('#facultad1').append(new Option(data[i]['nombre'], data[i]['id']))
        }

    }
    var id = {'idUni': $('#universidad1').val(), 'idFac': $('#facultad1').val()};
    $.get('/planEstudio/obtener_carreraAJAX/', id, function (data) {
        data = JSON.parse(data);
        var ids = [];
        for (var i in data) {
            if (ids.indexOf(data[i]['id']) == -1) {
                ids.push(data[i]['id']);
                $('#carrera1').append(new Option(data[i]['nombre'], data[i]['id']))
            }
        }
        var id = {'idUni': $('#universidad1').val(), 'idFac': $('#facultad1').val(), 'idCar': $('#carrera1').val()};
        $.get('/planEstudio/obtener_tipocursoAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#tipo_curso1').append(new Option(data[i]['nombre'], data[i]['id']))
            }
            var id = {
                'idUni': $('#universidad1').val(),
                'idFac': $('#facultad1').val(),
                'idCar': $('#carrera1').val(),
                'idCarTipo': $('#tipo_curso1').val()
            };
            $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#plan_estudio1').append(new Option(data[i]['nombre'], data[i]['id']))
                }
                var id = {
                    'idUni': $('#universidad1').val(),
                    'idFac': $('#facultad1').val(),
                    'idCar': $('#carrera1').val(),
                    'idCarTipo': $('#tipo_curso1').val(), 'idPlanE': $('#plan_estudio1').val()
                };
                $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
                    data = JSON.parse(data);
                    for (var i in data) {
                        $('#curso1').append(new Option(data[i]['nombre'], data[i]['id']))
                    }
                    var id = {
                        'idUni': $('#universidad1').val(),
                        'idFac': $('#facultad1').val(),
                        'idCar': $('#carrera1').val(),
                        'idCarTipo': $('#tipo_curso1').val(),
                        'idPlanE': $('#plan_estudio1').val(),
                        'idCurso': $('#curso1').val()
                    };
                    $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                        data = JSON.parse(data);
                        for (var i in data) {
                            $('#cohorte1').append(new Option(data[i]['comentario'], data[i]['id']))
                        }
                        $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
                    })
                })
            })
        })
    })
})
$('#facultad1').change(function () {
    $('#carrera1').find('option').remove()
    $('#tipo_curso1').find('option').remove()
    $('#plan_estudio1').find('option').remove()
    $('#curso1').find('option').remove()
    $('#cohorte1').find('option').remove()
    var id = {'idUni': $('#universidad1').val(), 'idFac': $('#facultad1').val()};
    $.get('/planEstudio/obtener_carreraAJAX/', id, function (data) {
        data = JSON.parse(data);
        var ids = [];
        for (var i in data) {
            if (ids.indexOf(data[i]['id']) == -1) {
                ids.push(data[i]['id']);
                $('#carrera1').append(new Option(data[i]['nombre'], data[i]['id']))
            }
        }
        var id = {'idUni': $('#universidad1').val(), 'idFac': $('#facultad1').val(), 'idCar': $('#carrera1').val()};
        $.get('/planEstudio/obtener_tipocursoAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#tipo_curso1').append(new Option(data[i]['nombre'], data[i]['id']))
            }
            var id = {
                'idUni': $('#universidad1').val(),
                'idFac': $('#facultad1').val(),
                'idCar': $('#carrera1').val(),
                'idCarTipo': $('#tipo_curso1').val()
            };
            $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#plan_estudio1').append(new Option(data[i]['nombre'], data[i]['id']))
                }
                var id = {
                    'idUni': $('#universidad1').val(),
                    'idFac': $('#facultad1').val(),
                    'idCar': $('#carrera1').val(),
                    'idCarTipo': $('#tipo_curso1').val(), 'idPlanE': $('#plan_estudio1').val()
                };
                $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
                    data = JSON.parse(data);
                    for (var i in data) {
                        $('#curso1').append(new Option(data[i]['nombre'], data[i]['id']))
                    }
                    var id = {
                        'idUni': $('#universidad1').val(),
                        'idFac': $('#facultad1').val(),
                        'idCar': $('#carrera1').val(),
                        'idCarTipo': $('#tipo_curso1').val(),
                        'idPlanE': $('#plan_estudio1').val(),
                        'idCurso': $('#curso1').val()
                    };
                    $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                        data = JSON.parse(data);
                        for (var i in data) {
                            $('#cohorte1').append(new Option(data[i]['comentario'], data[i]['id']))
                        }
                        $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
                    })
                })
            })
        })
    })
})
$('#carrera1').change(function () {
    $('#tipo_curso1').find('option').remove();
    $('#plan_estudio1').find('option').remove();
    $('#curso1').find('option').remove()
    $('#cohorte1').find('option').remove()
    var id = {'idUni': $('#universidad1').val(), 'idFac': $('#facultad1').val(), 'idCar': $('#carrera1').val()};
    $.get('/planEstudio/obtener_tipocursoAJAX/', id, function (data) {
        data = JSON.parse(data);
        for (var i in data) {
            $('#tipo_curso1').append(new Option(data[i]['nombre'], data[i]['id']))
        }
        var id = {
            'idUni': $('#universidad1').val(),
            'idFac': $('#facultad1').val(),
            'idCar': $('#carrera1').val(),
            'idCarTipo': $('#tipo_curso1').val()
        };
        $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#plan_estudio1').append(new Option(data[i]['nombre'], data[i]['id']))
            }
            var id = {
                'idUni': $('#universidad1').val(),
                'idFac': $('#facultad1').val(),
                'idCar': $('#carrera1').val(),
                'idCarTipo': $('#tipo_curso1').val(), 'idPlanE': $('#plan_estudio1').val()
            };
            $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#curso1').append(new Option(data[i]['nombre'], data[i]['id']))
                }
                var id = {
                    'idUni': $('#universidad1').val(),
                    'idFac': $('#facultad1').val(),
                    'idCar': $('#carrera1').val(),
                    'idCarTipo': $('#tipo_curso1').val(),
                    'idPlanE': $('#plan_estudio1').val(),
                    'idCurso': $('#curso1').val()
                };
                $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                    data = JSON.parse(data);
                    for (var i in data) {
                        $('#cohorte1').append(new Option(data[i]['comentario'], data[i]['id']))
                    }
                    $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
                })
            })
        })
    })
})
$('#tipo_curso1').change(function () {
    $('#plan_estudio1').find('option').remove()
    $('#curso1').find('option').remove()
    $('#cohorte1').find('option').remove()
    var id = {
        'idUni': $('#universidad1').val(),
        'idFac': $('#facultad1').val(),
        'idCar': $('#carrera1').val(),
        'idCarTipo': $('#tipo_curso1').val()
    };
    $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
        data = JSON.parse(data);
        for (var i in data) {
            $('#plan_estudio1').append(new Option(data[i]['nombre'], data[i]['id']))
        }
        var id = {
            'idUni': $('#universidad1').val(),
            'idFac': $('#facultad1').val(),
            'idCar': $('#carrera1').val(),
            'idCarTipo': $('#tipo_curso1').val(), 'idPlanE': $('#plan_estudio1').val()
        };
        $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#curso1').append(new Option(data[i]['nombre'], data[i]['id']))
            }
            var id = {
                'idUni': $('#universidad1').val(),
                'idFac': $('#facultad1').val(),
                'idCar': $('#carrera1').val(),
                'idCarTipo': $('#tipo_curso1').val(),
                'idPlanE': $('#plan_estudio1').val(),
                'idCurso': $('#curso1').val()
            };
            $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#cohorte1').append(new Option(data[i]['comentario'], data[i]['id']))
                }
                $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
            })
        })
    })

})
$('#plan_estudio1').change(function () {
    $('#curso1').find('option').remove()
    $('#cohorte1').find('option').remove()
    var id = {
        'idUni': $('#universidad1').val(),
        'idFac': $('#facultad1').val(),
        'idCar': $('#carrera1').val(),
        'idCarTipo': $('#tipo_curso1').val(), 'idPlanE': $('#plan_estudio1').val()
    };
    $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
        data = JSON.parse(data);
        for (var i in data) {
            $('#curso1').append(new Option(data[i]['nombre'], data[i]['id']))
        }
        var id = {
            'idUni': $('#universidad1').val(),
            'idFac': $('#facultad1').val(),
            'idCar': $('#carrera1').val(),
            'idCarTipo': $('#tipo_curso1').val(),
            'idPlanE': $('#plan_estudio1').val(),
            'idCurso': $('#curso1').val()
        };
        $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#cohorte1').append(new Option(data[i]['comentario'], data[i]['id']))
            }
            $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
        })
    })
})
$('#curso1').change(function () {
    $('#cohorte1').find('option').remove()
    var id = {
        'idUni': $('#universidad1').val(),
        'idFac': $('#facultad1').val(),
        'idCar': $('#carrera1').val(),
        'idCarTipo': $('#tipo_curso1').val(),
        'idPlanE': $('#plan_estudio1').val(),
        'idCurso': $('#curso1').val()
    };
    $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
        data = JSON.parse(data);
        for (var i in data) {
            $('#cohorte1').append(new Option(data[i]['comentario'], data[i]['id']))
        }
        $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
    })
})

//AQUI EMPIEZA LA SEGUNDA COMPARACIÓN

$('#universidad2').change(function () {
    var id = {'idUni': $('#universidad2').val()};
    $('#facultad2').find('option').remove()
    $('#carrera2').find('option').remove()
    $('#tipo_curso2').find('option').remove()
    $('#plan_estudio2').find('option').remove()
    $('#curso2').find('option').remove()
    $('#cohorte2').find('option').remove()
    $.get('/planEstudio/obtener_facultadAJAX/', id, function (data) {
        data = JSON.parse(data);
        var ids = [];
        for (var i in data) {
            if (ids.indexOf(data[i]['id']) == -1) {
                ids.push(data[i]['id']);
                $('#facultad2').append(new Option(data[i]['nombre'], data[i]['id']))
            }
        }
        var id = {'idUni': $('#universidad2').val(), 'idFac': $('#facultad2').val()};
        $.get('/planEstudio/obtener_carreraAJAX/', id, function (data) {
            data = JSON.parse(data);
            var ids = [];
            for (var i in data) {
                if (ids.indexOf(data[i]['id']) == -1) {
                    ids.push(data[i]['id']);
                    $('#carrera2').append(new Option(data[i]['nombre'], data[i]['id']))
                }
            }
            var id = {'idUni': $('#universidad2').val(), 'idFac': $('#facultad2').val(), 'idCar': $('#carrera2').val()};
            $.get('/planEstudio/obtener_tipocursoAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#tipo_curso2').append(new Option(data[i]['nombre'], data[i]['id']))
                }
                var id = {
                    'idUni': $('#universidad2').val(),
                    'idFac': $('#facultad2').val(),
                    'idCar': $('#carrera2').val(),
                    'idCarTipo': $('#tipo_curso2').val()
                };
                $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
                    data = JSON.parse(data);
                    for (var i in data) {
                        $('#plan_estudio2').append(new Option(data[i]['nombre'], data[i]['id']))
                    }
                    var id = {
                        'idUni': $('#universidad2').val(),
                        'idFac': $('#facultad2').val(),
                        'idCar': $('#carrera2').val(),
                        'idCarTipo': $('#tipo_curso2').val(), 'idPlanE': $('#plan_estudio2').val()
                    };
                    $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
                        data = JSON.parse(data);
                        for (var i in data) {
                            $('#curso2').append(new Option(data[i]['nombre'], data[i]['id']))
                        }
                        var id = {
                            'idUni': $('#universidad2').val(),
                            'idFac': $('#facultad2').val(),
                            'idCar': $('#carrera2').val(),
                            'idCarTipo': $('#tipo_curso2').val(),
                            'idPlanE': $('#plan_estudio2').val(),
                            'idCurso': $('#curso2').val()
                        };
                        $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                            data = JSON.parse(data);
                            for (var i in data) {
                                $('#cohorte2').append(new Option(data[i]['comentario'], data[i]['id']))
                            }
                            $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());

                        })
                    })
                })
            })
        })

    })
})

var id = {'idUni': $('#universidad2').val()};
$.get('/planEstudio/obtener_facultadAJAX/', id, function (data) {
    data = JSON.parse(data);
    var ids = [];
    for (var i in data) {
        if (ids.indexOf(data[i]['id']) == -1) {
            ids.push(data[i]['id']);
            $('#facultad2').append(new Option(data[i]['nombre'], data[i]['id']))
        }

    }
    var id = {'idUni': $('#universidad2').val(), 'idFac': $('#facultad2').val()};
    $.get('/planEstudio/obtener_carreraAJAX/', id, function (data) {
        data = JSON.parse(data);
        var ids = [];
        for (var i in data) {
            if (ids.indexOf(data[i]['id']) == -1) {
                ids.push(data[i]['id']);
                $('#carrera2').append(new Option(data[i]['nombre'], data[i]['id']))
            }
        }
        var id = {'idUni': $('#universidad2').val(), 'idFac': $('#facultad2').val(), 'idCar': $('#carrera2').val()};
        $.get('/planEstudio/obtener_tipocursoAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#tipo_curso2').append(new Option(data[i]['nombre'], data[i]['id']))
            }
            var id = {
                'idUni': $('#universidad2').val(),
                'idFac': $('#facultad2').val(),
                'idCar': $('#carrera2').val(),
                'idCarTipo': $('#tipo_curso2').val()
            };
            $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#plan_estudio2').append(new Option(data[i]['nombre'], data[i]['id']))
                }
                var id = {
                    'idUni': $('#universidad2').val(),
                    'idFac': $('#facultad2').val(),
                    'idCar': $('#carrera2').val(),
                    'idCarTipo': $('#tipo_curso2').val(), 'idPlanE': $('#plan_estudio2').val()
                };
                $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
                    data = JSON.parse(data);
                    for (var i in data) {
                        $('#curso2').append(new Option(data[i]['nombre'], data[i]['id']))
                    }
                    var id = {
                        'idUni': $('#universidad2').val(),
                        'idFac': $('#facultad2').val(),
                        'idCar': $('#carrera2').val(),
                        'idCarTipo': $('#tipo_curso2').val(),
                        'idPlanE': $('#plan_estudio2').val(),
                        'idCurso': $('#curso2').val()
                    };
                    $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                        data = JSON.parse(data);
                        for (var i in data) {
                            $('#cohorte2').append(new Option(data[i]['comentario'], data[i]['id']))
                        }
                        $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
                    })
                })
            })
        })
    })
})
$('#facultad2').change(function () {
    $('#carrera2').find('option').remove()
    $('#tipo_curso2').find('option').remove()
    $('#plan_estudio2').find('option').remove()
    $('#curso2').find('option').remove()
    $('#cohorte2').find('option').remove()
    var id = {'idUni': $('#universidad2').val(), 'idFac': $('#facultad2').val()};
    $.get('/planEstudio/obtener_carreraAJAX/', id, function (data) {
        data = JSON.parse(data);
        var ids = [];
        for (var i in data) {
            if (ids.indexOf(data[i]['id']) == -1) {
                ids.push(data[i]['id']);
                $('#carrera2').append(new Option(data[i]['nombre'], data[i]['id']))
            }
        }
        var id = {'idUni': $('#universidad2').val(), 'idFac': $('#facultad2').val(), 'idCar': $('#carrera2').val()};
        $.get('/planEstudio/obtener_tipocursoAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#tipo_curso2').append(new Option(data[i]['nombre'], data[i]['id']))
            }
            var id = {
                'idUni': $('#universidad2').val(),
                'idFac': $('#facultad2').val(),
                'idCar': $('#carrera2').val(),
                'idCarTipo': $('#tipo_curso2').val()
            };
            $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#plan_estudio2').append(new Option(data[i]['nombre'], data[i]['id']))
                }
                var id = {
                    'idUni': $('#universidad2').val(),
                    'idFac': $('#facultad2').val(),
                    'idCar': $('#carrera2').val(),
                    'idCarTipo': $('#tipo_curso2').val(), 'idPlanE': $('#plan_estudio2').val()
                };
                $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
                    data = JSON.parse(data);
                    for (var i in data) {
                        $('#curso2').append(new Option(data[i]['nombre'], data[i]['id']))
                    }
                    var id = {
                        'idUni': $('#universidad2').val(),
                        'idFac': $('#facultad2').val(),
                        'idCar': $('#carrera2').val(),
                        'idCarTipo': $('#tipo_curso2').val(),
                        'idPlanE': $('#plan_estudio2').val(),
                        'idCurso': $('#curso2').val()
                    };
                    $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                        data = JSON.parse(data);
                        for (var i in data) {
                            $('#cohorte2').append(new Option(data[i]['comentario'], data[i]['id']))
                        }
                        $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
                    })
                })
            })
        })
    })
})
$('#carrera2').change(function () {
    $('#tipo_curso2').find('option').remove();
    $('#plan_estudio2').find('option').remove();
    $('#curso2').find('option').remove()
    $('#cohorte2').find('option').remove()
    var id = {'idUni': $('#universidad2').val(), 'idFac': $('#facultad2').val(), 'idCar': $('#carrera2').val()};
    $.get('/planEstudio/obtener_tipocursoAJAX/', id, function (data) {
        data = JSON.parse(data);
        for (var i in data) {
            $('#tipo_curso2').append(new Option(data[i]['nombre'], data[i]['id']))
        }
        var id = {
            'idUni': $('#universidad2').val(),
            'idFac': $('#facultad2').val(),
            'idCar': $('#carrera2').val(),
            'idCarTipo': $('#tipo_curso2').val()
        };
        $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#plan_estudio2').append(new Option(data[i]['nombre'], data[i]['id']))
            }
            var id = {
                'idUni': $('#universidad2').val(),
                'idFac': $('#facultad2').val(),
                'idCar': $('#carrera2').val(),
                'idCarTipo': $('#tipo_curso2').val(), 'idPlanE': $('#plan_estudio2').val()
            };
            $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#curso2').append(new Option(data[i]['nombre'], data[i]['id']))
                }
                var id = {
                    'idUni': $('#universidad2').val(),
                    'idFac': $('#facultad2').val(),
                    'idCar': $('#carrera2').val(),
                    'idCarTipo': $('#tipo_curso2').val(),
                    'idPlanE': $('#plan_estudio2').val(),
                    'idCurso': $('#curso2').val()
                };
                $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                    data = JSON.parse(data);
                    for (var i in data) {
                        $('#cohorte2').append(new Option(data[i]['comentario'], data[i]['id']))
                    }
                    $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
                })
            })
        })
    })
})
$('#tipo_curso2').change(function () {
    $('#plan_estudio2').find('option').remove()
    $('#curso2').find('option').remove()
    $('#cohorte2').find('option').remove()
    var id = {
        'idUni': $('#universidad2').val(),
        'idFac': $('#facultad2').val(),
        'idCar': $('#carrera2').val(),
        'idCarTipo': $('#tipo_curso2').val()
    };
    $.get('/planEstudio/obtener_plandeestudioAJAX/', id, function (data) {
        data = JSON.parse(data);
        for (var i in data) {
            $('#plan_estudio2').append(new Option(data[i]['nombre'], data[i]['id']))
        }
        var id = {
            'idUni': $('#universidad2').val(),
            'idFac': $('#facultad2').val(),
            'idCar': $('#carrera2').val(),
            'idCarTipo': $('#tipo_curso2').val(), 'idPlanE': $('#plan_estudio2').val()
        };
        $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#curso2').append(new Option(data[i]['nombre'], data[i]['id']))
            }
            var id = {
                'idUni': $('#universidad2').val(),
                'idFac': $('#facultad2').val(),
                'idCar': $('#carrera2').val(),
                'idCarTipo': $('#tipo_curso2').val(),
                'idPlanE': $('#plan_estudio2').val(),
                'idCurso': $('#curso2').val()
            };
            $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
                data = JSON.parse(data);
                for (var i in data) {
                    $('#cohorte2').append(new Option(data[i]['comentario'], data[i]['id']))
                }
                $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
            })
        })
    })

})
$('#plan_estudio2').change(function () {
    $('#curso2').find('option').remove()
    $('#cohorte2').find('option').remove()
    var id = {
        'idUni': $('#universidad2').val(),
        'idFac': $('#facultad2').val(),
        'idCar': $('#carrera2').val(),
        'idCarTipo': $('#tipo_curso2').val(), 'idPlanE': $('#plan_estudio2').val()
    };
    $.get('/planEstudio/obtener_cursoAJAX/', id, function (data) {
        data = JSON.parse(data);
        for (var i in data) {
            $('#curso2').append(new Option(data[i]['nombre'], data[i]['id']))
        }
        var id = {
            'idUni': $('#universidad2').val(),
            'idFac': $('#facultad2').val(),
            'idCar': $('#carrera2').val(),
            'idCarTipo': $('#tipo_curso2').val(),
            'idPlanE': $('#plan_estudio2').val(),
            'idCurso': $('#curso2').val()
        };
        $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
            data = JSON.parse(data);
            for (var i in data) {
                $('#cohorte2').append(new Option(data[i]['comentario'], data[i]['id']))
            }
            $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
        })
    })
})
$('#curso2').change(function () {
    $('#cohorte2').find('option').remove()
    var id = {
        'idUni': $('#universidad2').val(),
        'idFac': $('#facultad2').val(),
        'idCar': $('#carrera2').val(),
        'idCarTipo': $('#tipo_curso2').val(),
        'idPlanE': $('#plan_estudio2').val(),
        'idCurso': $('#curso2').val()
    };
    $.get('/planEstudio/obtener_cohorteAJAX/', id, function (data) {
        data = JSON.parse(data);
        for (var i in data) {
            $('#cohorte2').append(new Option(data[i]['comentario'], data[i]['id']))
        }
        $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());
    })
})

$('#curso1').change(function () {
    $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());

    if (document.getElementById('universidad1').value == document.getElementById('universidad2').value) {
        var not = $.Notify({
            caption: "Advertencia ",
            content: "Intenta comparar dos cohortes muy parecidos",
            timeout: 5000 // 5 seconds
        });
    }

})
$('#curso2').change(function () {
    $('#duplicar').attr('href', '/planEstudio/cohorte_duplicar_resultados/' + $('#cohorte1').val());

    if (document.getElementById('universidad1').value == document.getElementById('universidad2').value) {
        var not = $.Notify({
            caption: "Advertencia ",
            content: "Intenta comparar dos cohortes muy parecidos",
            timeout: 5000 // 5 seconds
        });
    }

})

