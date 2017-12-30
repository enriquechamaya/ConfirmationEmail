$(document).ready(function () {
    validarDNI();
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

    $('#cbo_nacionalidad').change(function () {
        var nacionalidad = $('#cbo_nacionalidad').val();

        if (nacionalidad === '0') {
            console.log("cero");
        } else if (nacionalidad === '1') {
            console.log("cero");
        } else if (nacionalidad === '2') {
            console.log("cero");
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