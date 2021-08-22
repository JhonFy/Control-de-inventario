$(document).ready(function () {
    $("tr #dEmpleado").click(function (e) {
        e.preventDefault();
        var codEmpleado = $(this).parent().find('#codigoEmpleado').val();
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
                        dltEmpleado(codEmpleado);
                        swal("Eliminado!", "El Empleado Se Ha Eliminado", "success");
                        setTimeout(function () {
                            parent.location.href = "srvUsuario?accion=listarEmpleado"
                        }, 1800);
                    } else {
                        swal("Cancelado", "Cancelaste La Eliminación", "error");
                    }
                });
    });

    function dltEmpleado(codEmpleado) {
        var url = "srvUsuario?accion=eliminarEmpleado&codEmpleado=" + codEmpleado;
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

