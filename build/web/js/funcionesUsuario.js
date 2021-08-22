$(document).ready(function () {
    $("tr #deleteUser").click(function (e) {
        e.preventDefault();
        var cod = $(this).parent().find('#codigo').val();
        swal({
            title: "Esta Seguro De Eliminar?",
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
                        eliminarUsuario(cod);
                        swal("Eliminado!", "El Usuario Se Ha Eliminado", "success");
                        setTimeout(function (){
                            parent.location.href = "srvUsuario?accion=listarUsuarios"
                        }, 1800);
                    } else {
                        swal("Cancelado", "Cancelaste La Eliminación", "error");
                    }
                });
    });

    function eliminarUsuario(cod) {
        var url = "srvUsuario?accion=eliminarUsuario&cod=" + cod;
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

