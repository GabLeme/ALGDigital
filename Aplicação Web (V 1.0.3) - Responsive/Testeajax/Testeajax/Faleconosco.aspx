<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faleconosco.aspx.cs" Inherits="Testeajax.Faleconosco" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/algboard.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Archivo' rel='stylesheet'/>
    <link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet'/>
	<link href='https://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet'/>
	<link href="https://fonts.googleapis.com/css?family=Arvo|Josefin+Slab|Lato|Open+Sans|Ubuntu|Volkhov" rel="stylesheet"/>
    <title>ALGBoard | Suporte</title>
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

            <div class="formulario">
                <h1>Fale Conosco!</h1>
                <form method="post">
                    <input class="enviarNome" placeholder="Insira seu nome" type="text" name="nome" />
                    <br />
                    <input class="enviarEmail" placeholder="Insira seu email" type="email" name="email" />
                    <br />
                    <input class="enviarAssunto" placeholder="Insira o assunto" type="text" name="assunto" />
                    <br />
                    <input class="enviarMensagem" placeholder="Digite aqui..." type="text" name="mensagem" />
                    <br />
                    <input type="submit" id="btnenviar" name="submit" value="Abrir chamado" />
                </form>
            </div>
        </section>
    <script type="text/javascript">!function(t,e){"use strict";var r=function(t){try{var r=e.head||e.getElementsByTagName("head")[0],a=e.createElement("script");a.setAttribute("type","text/javascript"),a.setAttribute("src",t),r.appendChild(a)}catch(t){}};t.CollectId = "5b01cd9a10778c88434fd617",r("https://collectcdn.com/launcher.js")}(window,document);</script>
</body>
</html>
