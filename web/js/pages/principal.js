$(document).ready(function () {
    validarDNI();
});

//validar dni nacional
function validarDNI() {
    $('#txt_nro_documento,#txt_coreo').attr({
        'maxlength': 0,
        'disabled': true,
        'value': null
    });

    $('#cbo_nacionalidad').on('change', function () {
        var cbo_nacionalidad = $('#cbo_nacionalidad').val();
        if (cbo_nacionalidad === '0') {
            $('#txt_nro_documento').attr({
                'maxlength': 0,
                'disabled': true,
                'value': null
            });
        } else if (cbo_nacionalidad === '1') {
            $('#txt_nro_documento').attr({
                'maxlength': 8,
                'disabled': false,
                'value': null
            });
            $('#txt_nro_documento').keyup(function () {
                var dni = $('#txt_nro_documento').val();
                if (dni.length === 8) {
                    consularDNI(dni);
                }
            });
        } else if (cbo_nacionalidad === '2') {
            $('#txt_nro_documento').attr({
                'maxlength': 15,
                'disabled': false,
                'value': null
            });
        }
    });

}


// consultar dni nacional
function consularDNI(dni) {
    var tecactusApi = new TecactusApi("Z84Hk6wqJ6MJLTXWX6F0p0Z5TPjFXnxYG1aFzgbv");
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