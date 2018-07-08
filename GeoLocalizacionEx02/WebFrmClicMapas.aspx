<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFrmClicMapas.aspx.cs" Inherits="GeoLocalizacionEx02.WebFrmClicMapas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">


    <!-- Bootstrap stuff -->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places'></script>
    <script src="js/locationpicker.jquery.min.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Google Maps Picker</title>

    <style>
        .pac-container {
            z-index: 99999;
        }
    </style>

    <%--    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src='http://maps.google.com/maps/api/js?sensor=false&libraries=places'></script>
    <script src="js/locationpicker.jquery.js"></script>--%>

    <style type="text/css">
        .auto-style4 {
            margin-left: 16px;
        }
    </style>

    <!--
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    -->

</head>

<body>
    <form id="form1" runat="server">
    <!--
    <button data-target="#us6-dialog" data-toggle="modal">Haga click para abrir la ventana de dialogo</button>
    <div id="us6-dialog" class="modal fade">

    IMPORTANTE!!
    Hago llamadas a la API sin una clave

    Uso APIs de forma gratuita o sin una clave. ¿Podré seguir haciéndolo?
    A partir del 11 de junio del 2018, necesitarás una clave de API válida y una cuenta de facturación 
    para acceder a nuestras API. Cuando habilites la facturación, recibirás un crédito mensual gratuito 
    de 200 $ para usar en Maps, Routes o Places. Actualmente, la mayoría de los millones de usuarios que 
    utilizan nuestras API pueden seguir usando Google Maps Platform de forma gratuita con este crédito. 
    Las cuentas de facturación nos ayudan a conocer mejor las necesidades de nuestros desarrolladores y 
    permiten que tu negocio crezca sin problemas.
-->
    <script >
        alert("A partir del 11 de junio del 2018, necesitarás una clave de API válida y una cuenta de facturación para acceder a nuestras API");
        alert("Asi que la demo de GeoLocalizacion no puede automatizarce");
    </script>

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Buscar Ubicación</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal" style="width: 550px">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Ubicación:</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="us3-address" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Radio:</label>

                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="us3-radius" />
                        </div>
                    </div>
                    <div id="us3" style="width: 100%; height: 400px;"></div>
                    <div class="clearfix">&nbsp;</div>
                    <div class="m-t-small">
                        <label class="p-r-small col-sm-1 control-label">Latitud:</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" style="width: 110px" id="us3-lat" />
                        </div>
                        <label class="p-r-small col-sm-2 control-label">Longitud:</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" style="width: 110px" id="us3-lon" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <script>
                        // Casa
                        // -34.528989, -58.557948 
                        // InterBook
                        // -34.550290, -58.515915
                        $('#us3').locationpicker({
                            location: {
                                latitude: -34.528989,
                                longitude: -58.557948
                            },
                            radius: 300,
                            inputBinding: {
                                latitudeInput: $('#us3-lat'),
                                longitudeInput: $('#us3-lon'),
                                radiusInput: $('#us3-radius'),
                                locationNameInput: $('#us3-address')
                            },
                            enableAutocomplete: true,
                            markerIcon: 'http://www.iconsdb.com/icons/preview/tropical-blue/map-marker-2-xl.png'
                        });
                        $('#us6-dialog').on('shown.bs.modal', function () {
                            $('#us3').locationpicker('autosize');
                        });
                    </script>
                </div>
            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
    <!--
    </div>
    <!-- /.modal -->
        <asp:Button ID="btn_Guardar" runat="server" CssClass="auto-style4" OnClick="btn_Guardar_Click" Text="Guardar Coordenadas" Width="178px" />
    </form>

</body>
</html>
