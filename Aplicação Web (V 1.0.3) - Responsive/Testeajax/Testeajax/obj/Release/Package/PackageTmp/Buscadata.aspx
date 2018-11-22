<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Buscadata.aspx.cs" Inherits="Testeajax.Buscadata" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/algboard.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Archivo' rel='stylesheet'/>
    <link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet'/>
	<link href='https://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet'/>
	<link href="https://fonts.googleapis.com/css?family=Arvo|Josefin+Slab|Lato|Open+Sans|Ubuntu|Volkhov" rel="stylesheet"/>   
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ALGBoard: Busca por data</title>
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
            <form runat="server">
            <div class="divisoria">
                 <img class="userIcon" src="icons/iconUser.png" />
                 <span class="userEmail"><asp:Label Text="" ID="lblEmail" runat="server" /></span>
                <img class="logoutIcon" src="icons/powerIcon.png" />
                <button runat="server" onserverclick="btnLogout_ServerClick" id="btnLogout">Logout</button>
            </div>
            <div class="relatorio">
                <div class="titleRelatorio">
                    <img class="buscadataImage" src="icons/buscadataIcon.png" />
                    <span class="titleRelatoriobuscadata">Buscar</span>
                    <asp:TextBox runat="server" id="dataBuscar" textMode="Date"/>
                    <asp:ImageButton ImageUrl="~/icons/iconBuscar.png" ID="btnBuscartemp" OnClick="btnBuscartemp_Click" runat="server" />
                </div>
                <div class="buscaData">
                    <table> 
				        <tr>
                            <th>Data</th>
                            <th>Temperatura</th>
                        </tr>
                        <asp:Repeater runat="server" ID="listRepeater">
                            <ItemTemplate>
                        <tr>
                            <td><%#((DateTime)Eval("datahora")).ToString("dd/MM/yyyy") %></td>
                            <td><%#((double)Eval("valor")).ToString("0.00") %></td>
                        </tr>
                            </ItemTemplate>
                            </asp:Repeater>
                    </table>
                </div>
            </div>
                </form>
          </section>
</body>
</html>
