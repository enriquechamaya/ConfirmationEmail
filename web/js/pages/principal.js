$(document).ready(function () {
    validarDNI();

    listarPersona();
});

//validar dni nacional
function validarDNI() {
    $('#txt_nro_documento').validCampo('01234456789');
    $('#txt_coreo').validCampo('abcdefghijklmnñopqrstuvwxyzáéiou01234456789._@');

    $('#txt_nro_documento, #txt_coreo').attr({
        maxlength: 0,
        disabled: true,
        placeholder: '--------------------'
    });

    $('#cbo_nacionalidad').on('change', function () {
        // validar el cambio de <option>
        var nacionalidad = $('#cbo_nacionalidad').val();
        if (nacionalidad === '0') {
            console.log("cero");
            $('#txt_nro_documento').val(null);
            $('#txt_coreo').val('');
            $('#txt_nro_documento, #txt_coreo').attr({
                maxlength: 0,
                disabled: true,
                placeholder: '--------------------'
            });
        } else if (nacionalidad === '1') {
            console.log("uno");
            $('#txt_nro_documento').val(null);
            $('#txt_coreo').val('');
            $('#txt_nro_documento').attr({
                maxlength: 8,
                disabled: false,
                placeholder: 'Ingresar DNI'
            });
            $('#txt_coreo').attr({
                maxlength: 0,
                disabled: true,
                placeholder: '--------------------'
            });
            $('#txt_nro_documento').keyup(function (e) {
                var dni = $('#txt_nro_documento').val().length;
                console.log(dni);
                if (dni === 8) {
                    $('#txt_coreo').attr({
                        maxlength: 50,
                        disabled: false,
                        placeholder: 'ingrese su correo'
                    });
                } else {
                    $('#txt_coreo').attr({
                        maxlength: 0,
                        disabled: true,
                        placeholder: '--------------------'
                    });
                    $('#txt_coreo').val('');
                }
            });

        } else if (nacionalidad === '2') {
            console.log("dos");
            $('#txt_nro_documento').val(null);
            $('#txt_coreo').val('');
            $('#txt_nro_documento').attr({
                maxlength: 15,
                disabled: false,
                placeholder: 'Ingresar otro doc.'
            });
            $('#txt_coreo').attr({
                maxlength: 0,
                disabled: true,
                placeholder: '--------------------'
            });
            $('#txt_nro_documento').keyup(function (e) {
                var otro_doc = $('#txt_nro_documento').val().length;
                console.log(otro_doc);
                if (otro_doc === 15) {
                    $('#txt_coreo').attr({
                        maxlength: 50,
                        disabled: false,
                        placeholder: 'ingrese su correo'
                    });
                } else {
                    $('#txt_coreo').attr({
                        maxlength: 0,
                        disabled: true,
                        placeholder: '--------------------'
                    });
                    $('#txt_coreo').val('');
                }
            });
        }
    });

}


// consultar dni nacional
function consularDNI(dni) {
//    var tecactusApi = new TecactusApi("Z84Hk6wqJ6MJLTXWX6F0p0Z5TPjFXnxYG1aFzgbv");
    var tecactusApi = new TecactusApi(":v");
//    var tecactusApi = new TecactusApi("ycHFbnU1sbD9Yo3nFZR5JHK1tpOmgiCdGO7q7mJv");
    console.log("cargando...");
    $('#load').css('display', 'block');
    tecactusApi.Reniec.getDni(dni)
            .then(function (response) {
                console.log("correcto!");
                $('#load').css('display', 'none');
                $('#div_validarDNI').css('display', 'block');
                $('#lbl_datos_reniec').val(response.data.apellido_paterno + " " + response.data.apellido_materno + " " + response.data.nombres);
                $('#txt_coreo').attr({
                    'maxlength': 50,
                    'disabled': false,
                    'value': null
                });
                $('#txt_coreo').focus();
            })
            .catch(function (response) {
                $('#txt_coreo').attr({
                    'maxlength': 0,
                    'disabled': true,
                    'value': null
                });
                console.log(response.data);
            });
}

// listar persona
function listarPersona() {
    $.ajax({
        type: 'POST',
        url: '../PersonaServlet?accion=listarPersona',
        dataType: 'json',
        beforeSend: function () {},
        success: function (data, textStatus, jqXHR) {
            var row = '';
            var count = 1;
            for (var i in data) {
                console.log(data[i].apellidoPaterno);
                row = '<tr>'
                row += '<td>' + count + '</td>'
                row += '<td>' + data[i].codTipoDocumento + '</td>'
                row += '<td>' + data[i].nroDocumento + '</td>'
                row += '<td>' + data[i].correo + '</td>'
                row += '<td>' + data[i].fechaRegistro + '</td>'
                if (data[i].activo == 1) {
                    row += '<td class="text-center"><span class="badge bg-green">ACTIVO</span></td>';
                } else {
                    row += '<td class="text-center"><span class="badge bg-red">INACTIVO</span></td>';
                }
                row += '<td class="text-center"><button type="button" class="btn btn-xs btn-info btn-flat"><i class="fa fa-search"></i> VER</button></td>'
                row += '</tr>'
            }
            $('#dataPersona').html(row);
        }
    });
}

// registrar persona
function registrarPersona() {
    $('#btn_registrar_mdl_reg_per').on('click', function () {
        var codTipoDocumento = $('#cbo_nacionalidad').val();
        var nroDocumento = $('#txt_nro_documento').val();
        var correo = $('#txt_coreo').val();
    });
}