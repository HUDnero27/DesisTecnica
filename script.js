$(document).ready(function() {
    cargarRegiones();

    $('#region').change(function() {
        var region = $(this).val();
        cargarComunas(region);
    });
});

function cargarRegiones() {
    $.ajax({
        url: 'obtener_regiones.php',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            $('#region').empty();
            $('#region').append('<option value="">Seleccione una región</option>');
            $.each(data, function(index, region) {
                $('#region').append('<option value="' + region.id + '">' + region.nombre + '</option>');
            });
        },
        error: function() {
            alert('Error al cargar las regiones.');
        }
    });
}

function cargarComunas(regionID) {
    $.ajax({
        url: 'obtener_comunas.php',
        type: 'GET',
        dataType: 'json',
        data: { regionID: regionID },
        success: function(data) {
            $('#comuna').empty();
            $('#comuna').append('<option value="">Seleccione una comuna</option>');
            $.each(data, function(index, comuna) {
                $('#comuna').append('<option value="' + comuna.id + '">' + comuna.nombre + '</option>');
            });
        },
        error: function() {
            alert('Error al cargar las comunas.');
        }
    });
}
