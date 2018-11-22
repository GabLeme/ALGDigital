<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Testeajax.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <link href='https://fonts.googleapis.com/css?family=Archivo' rel='stylesheet'/>
	    <link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet'/>
	    <link href='https://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet'/>
	    <link href="https://fonts.googleapis.com/css?family=Arvo|Josefin+Slab|Lato|Open+Sans|Ubuntu|Volkhov" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/algboard.css" rel="stylesheet" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>ALGBoard</title>
        <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', { packages: ['corechart', 'line'] });
            google.charts.setOnLoadCallback(desenharGrafico);
        
            var total = 0, grafico = null, data = null;

            function desenharGrafico() {
                if (data == null) {
                    data = new google.visualization.DataTable();
                    data.addColumn('string', 'Tempo');
                    data.addColumn('number', 'Temperatura ºC');

                    grafico = new google.visualization.LineChart(document.getElementById('chartdiv'));
                }
          
                var options = {
                    colors: ['#000'],
                    hAxis: { textStyle: { color: 'black' } },
                    vAxis: { textStyle: { color: 'black' } },
                    backgroundColor: 'transparent',
                    curveType: 'function',
                    animation: {
                        duration: 1000,
                        easing: 'inAndOut',
                    }
                };

                grafico.draw(data, options);
 
                setTimeout(function () {
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json',
                        url: 'Temperatura.aspx/TemperaturaAtual',
                        data: '{}',
                        success: function (response) {
                            var str = response.d;
                            var valores = str.split("@");
                            var arrayvalores = [valores[0], parseFloat(valores[1])];
                            data.addRow(arrayvalores);
                            if (data.getNumberOfRows() > 4) {
                                data.removeRow(0);
                            }
                            total++;
                            desenharGrafico();
                            data.getNumberOfRows();
                        },
                        error: function () {
                        }
                    });
                }, 2000);
            }
        
        </script>
    </head>
    <body>
        <header></header>
        <section>
            <div class="sidebar">
                <span class="titleSidebar">Menu</span>
                <div class="listaMenu">
                    <ul>
                        <li>
                            <a href="Default.aspx">
                                <img class="iconMenulista" src="icons/homeIcon.png" /><span class="titleMenulista">Home</span>
                            </a>
                        </li>
                        <li>
                            <a href="Faleconosco.aspx">
                                <img class="iconMenulista" src="icons/chamadosIcon.png" /><span class="titleMenulista">Suporte</span>
                            </a>
                        </li>
                        <li>
                            <a href="Relatório.aspx">
                                <img class="iconMenulista" src="icons/relatorioIcon.png" /><span class="titleMenulista">Relatório</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img class="iconMenulista" src="icons/ajudaIcon.png" /><span class="titleMenulista">Ajuda</span>
                            </a>
                        </li>
                        <li>
                            <a href="Buscadata.aspx">
                                <img class="iconMenulista" src="icons/buscarIcon.png" /><span class="titleMenulista">Buscar</span>
                            </a>
                        </li>
                    </ul>
                   </div>
            </div>
            <div class="divisoria">
                <form runat="server">
                 <img class="userIcon" src="icons/iconUser.png" />
                 <span class="userEmail"><asp:Label Text="" ID="lblEmail" runat="server" /></span>
                <img class="logoutIcon" src="icons/powerIcon.png" />
                <button runat="server" onserverclick="btnLogout_ServerClick" id="btnLogout">Logout</button>
                </form>
            </div>
            <div class="content1">
                <div class="titleContent1">
                    <img class="iconContent1" src="icons/iconGrafico.png" /><span class="titleContent1span">Histórico</span>
                </div>
                <div id="chartdiv"></div>
            </div>
            <div class="content2">
                <div class="titleContent2">
                    <img class="iconContent1" src="icons/iconPainel.PNG" /><span class="titleContent2span">Painel</span>
                </div>
                <img class="iconTempreal" src="icons/iconTemp.png"/>
                <p id="lTemp"></p>
                <img class="iconChip" src="icons/iconSensor.png"/>
                <p id="qntdSensor">1</p>
                <img class="iconLocal" src="icons/iconLocal.png" />
                <p id="local">São Paulo, BR</p>
            </div>
            <div class="analytics">
                <div class="divTemp">
                    <img class="iconAnalytics" src="icons/iconAnalytics.png" />
                    <span class="lblTemp1">Miníma</span>
                    <p id="lBaixa"></p>
                </div>
                <div class="divTemp">
                    <img class="iconAnalytics" src="icons/iconAnalytics.png" />
                    <span class="lblTemp">1°Quartil</span>
                    <p id="lQuartilUm"></p>
                </div>
                <div class="divTemp">
                    <img class="iconAnalytics" src="icons/iconAnalytics.png" />
                    <span class="lblTemp">Mediana</span>
                    <p id="lMediana"></p>
                </div>
                <div class="divTemp">
                    <img class="iconAnalytics" src="icons/iconAnalytics.png" />
                    <span class="lblTemp1">Média</span>
                    <p id="lMedia"></p>
                </div>
                <div class="divTemp">
                    <img class="iconAnalytics" src="icons/iconAnalytics.png" />
                    <span class="lblTemp">3°Quartil</span>
                    <p id="lQuartilTres"></p>
                </div>
                <div class="divTemp">
                    <img class="iconAnalytics" src="icons/iconAnalytics.png" />
                    <span class="lblTemp">Máxima</span>
                    <p id="lAlta"></p>
                </div>
            </div>
            <div class="desvioPadrao">
                <img class="desviopadraoImage" src="icons/desviopadraoIcon.png"/><span class="titleDesvioPadrao">Desvio Padrão</span>
                <p id="devPadrao"></p>
            </div>
        </section>
        <script>
            var chamada = [
                { page: 'DesvioPadrao.aspx', destin: 'devPadrao' }
            ]

            setInterval(() => {

                for (c = 0; c < chamada.length; c++) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.destin = chamada[c].destin;

                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            var numero = parseInt(this.responseText)                            
                            if (!isNaN(numero)) {
                                document.getElementById(this.destin).innerHTML = numero;
                            }

                        }
                    };

                    xhttp.open("GET", chamada[c].page, true);
                    xhttp.send();

                }
            }, 15000);
        </script>
        <script>
            var chamadas = [
            { pagina: 'AtualizaMenor.aspx', destino: 'lBaixa' },
            { pagina: 'AtualizaMaior.aspx', destino: 'lAlta' },
            { pagina: 'AtualizaDados.aspx', destino: 'lTemp' },
            { pagina: 'AtualizaQuartilUm.aspx', destino: 'lQuartilUm' },
            { pagina: 'AtualizaQuartilTres.aspx', destino: 'lQuartilTres' },
            { pagina: 'AtualizaMediana.aspx', destino: 'lMediana' },
            { pagina: 'AtualizaMedia.aspx', destino: 'lMedia' }
        ]

        setInterval(() => {

            for (c=0; c < chamadas.length; c++) {
                var xhttp = new XMLHttpRequest();
                xhttp.destino = chamadas[c].destino;

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var numero = parseInt(this.responseText)
                        if (!isNaN(numero)) {
                            document.getElementById(this.destino).innerHTML = numero + "C°";
                        }
                        
                    }
                };

                xhttp.open("GET", chamadas[c].pagina, true);
                xhttp.send();

            }
        }, 3000);
        </script>
    </body>
</html>
