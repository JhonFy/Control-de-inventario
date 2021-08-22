$(document).ready(function () {
    $("tr #dltPrv").click(function (e) {
        e.preventDefault();
        var codProveedor = $(this).parent().find('#codigoProveedor').val();
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
                        dltProveedores(codProveedor);
                        swal("Eliminado!", "El Proveedor Se Ha Eliminado", "success");
                        setTimeout(function () {
                            parent.location.href = "srvUsuario?accion=listarProveedor"
                        }, 1800);
                    } else {
                        swal("Cancelado", "Cancelaste La Eliminación", "error");
                    }
                });
    });

    function dltProveedores(codProveedor) {
        var url = "srvUsuario?accion=eliminarProveedor&codProveedor=" + codProveedor;
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

