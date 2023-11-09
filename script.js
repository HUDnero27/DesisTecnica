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
            $('#comuna').change(function(){
                var comuna = $(this).val();
                console.log(comuna);
                cargarCandidato(comuna);
            })
        },
        error: function() {
            alert('Error al cargar las comunas.');
        }
    });

    function cargarCandidato (comunaID) {
        console.log(comunaID)
        $.ajax({
            url: 'obtener_candidatos.php',
            type: 'GET',
            dataType: 'json',
            data: { comunaID: comunaID },
            success: function(data) {
                $('#candidato').empty();
                $('#candidato').append('<option value="">Seleccione un candidato</option>');
                $.each(data, function(index, candidato) {
                    $('#candidato').append('<option value="' + candidato.id + '">' + candidato.nombre + '</option>');
                });
            },

            error: function() {
                alert('Error al cargar los candidatos.');
            }
        });
    }
    
    
    
    
}
