$(document).ready(function () {
    $("tr #dltMarcas").click(function (e) {
        e.preventDefault();
        var codMarca = $(this).parent().find('#cdMarca').val();
        swal({
            title: "¿Esta Seguro De Eliminar?",
            text: "Una Vez Eliminado Deberá Agregar De Nuevo!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Sí, Eliminar!",
            cancelButtonText: "No, Cancelar!",
            closeOnConfirm: false,
            closeOnCancel: false
        },
                function (isConfirm) {
                    if (isConfirm) {
                        eliminarMarca(codMarca);
                        swal("Eliminado!", "La Marca Se Ha Eliminado", "success");
                        setTimeout(function () {
                            parent.location.href = "srvUsuario?accion=listarMarca"
                        }, 1800);
                    } else {
                        swal("Cancelado", "Cancelaste La Eliminación", "error");
                    }
                });
    });

    function eliminarMarca(codMarca) {
        var url = "srvUsuario?accion=eliminarMarca&codMarca=" + codMarca;
        console.log("eliminado");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }
});

