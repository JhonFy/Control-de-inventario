$(document).ready(function () {
    $("tr #dltProductos").click(function (e) {
        e.preventDefault();
        var codProductos = $(this).parent().find('#codigoProductos').val();
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
                        dltProducto(codProductos);
                        swal("Eliminado!", "El Producto Se Ha Eliminado", "success");
                        setTimeout(function () {
                            parent.location.href = "srvUsuario?accion=listarProductos"
                        }, 1800);
                    } else {
                        swal("Cancelado", "Cancelaste La Eliminación", "error");
                    }
                });
    });

    function dltProducto(codProductos) {
        var url = "srvUsuario?accion=eliminarProducto&codProductos=" + codProductos;
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

