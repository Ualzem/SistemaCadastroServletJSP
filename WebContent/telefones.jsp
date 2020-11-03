<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Telefones</title>


<!-- LINK PARA O NOSSO CSS: -->

<link rel="stylesheet" href="resources/css/estiloCadastro.css">


<script src="text/javascript" src="resources/js/jquery-3.2.0.min.js"></script>           <!-- JQUERY PARA MASCARAS DE TELEFONE -->
<script src="text/javascript" src="resources/js/jquery.mask.min.js"/></script>





              <!-- Adicionando JQuery PARA O CEP: -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
    
    
   
    
    
    
    </script>





</head>






<body>

<a href="acessoliberado.jsp"><img  src="resources/img/enterIcon.png" widht="50px" height="50px" title="Anterior"></a>
<a  href="index.jsp"><img alt="Início" src="resources/img/homeIcon.png" widht="50px" height="50px" title="Home"></a>


	<center><h1>Cadastro de Novos Telefones:</h1>
	<h3 style="color:red" > ${msg} </h3>
	</center>
	
	

	<form action="salvarTelefones" method="post" id="formUser">
		<!-- METODO POST PORQUE VAMOS ENVIAR OS DADOS -->



		<ul class="form-style-1">
			<li>
				<table>

					<tr>
						<td>User:</td>
						<td>
						<input type="text" id="id" readonly="readonly" name="id" value="${userEscolhido.id}"
							></td>
							<td>Name:</td>
							<td>
						<input type="text" id="nome" readonly="readonly" name="nome" value="${userEscolhido.nome}"
							></td>
							
					</tr>
					
					
					<tr>
					<td>Número:</td>
					<td><input type="text" id="numero" name="numero" data-mask="(00) 00000-0000"></td>
					
					<td>Tipo:</td>
					
					<td>
					<select id="tipo" name="tipo">
					<option>Celular</option>
					<option>Fixo</option>
					<option>Contato</option>
					</select>
					</td>
					
					</tr>
					
								
					
					<tr>
					<td></td>       <!-- BOTÃO SALVAR COM SCRIPT PARA VALIDAR SE CAMPOS ESTÃO VAZIOS: -->
					<td><input type="submit" value="Salvar" onclick="return validarCampos() ? true : false;"> 
					
					<input type="submit" value="Voltar" onclick="document.getElementById('formUser').action = 'salvarTelefones?acao=voltar'">
					</td>
					
					 </tr>
				</table> 
			</li>
		</ul>

	</form>

<form>

	<table class= "customers" >
	<caption class ="titulo">Telefones Registrados</caption>
	
	<tr style="font-size: 18px; background-color:#F5DEB3;">
	<th>ID</th>
	<th>NÚMERO</th>
	<th>TIPO</th>
	<th>EXCLUIR</th>
	</tr>

		<c:forEach items="${telefone}" var="fone">
			<tr>
				<td style="font-size: 18px;"><c:out value="${fone.id}"></c:out></td>
				<td style="font-size: 18px;"><c:out value="${fone.numero}"></c:out></td>
				<td style="font-size: 18px;"><c:out value="${fone.tipo}"></c:out></td>
				
				
				
				
				<!-- LINK DE EXCLUIR REGISTRO -->
				
				<td><a onclick="return confirm('TEM CERTEZA QUE DESEJA EXCLUIR?');" 
				href="salvarTelefones?user=${fone.usuario}&acao=deleteFone&foneId=${fone.id}">
				<img src="resources/img/ExcluirIcon.png" alt="Excluir" title="Excluir" width="32px" height="32px" /></a></td>
				
				
				
				
				
				
				
				
				


			</tr>
		</c:forEach>

	</table>
	
</form>


                  <!--  AQUI A FUNÇÃO JAVASCRIPT PARA VALIDAR SE OS CAMPOS ESTÃO VAZIOS OU NÃO: -->
                  
                  <script type = "text/javascript">
                  function validarCampos() {
                	    if (document.getElementById('formUser').action != 'salvarTelefones?acao=voltar') {
                		if (document.getElementById("numero").value == '') {
                		    alert('Informe o Número!');
                		    return false;
                		} 
                		if (document.getElementById("tipo").value == '') {
                		    alert('Informe o Tipo!');
                		    return false;
                	        }
                	    }
                	    return true;
                	}
                  
           
                	  
                  
                  
                  </script>
                  
                  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
                   <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
                 
                


</body>
</html>