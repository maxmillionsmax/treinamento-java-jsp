<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>



<body>
	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbarmainmenu.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->

						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="row">
										<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
									<div class="card">
										<div class="card-block">
										<h4 class="sub-title">Cadastro usuario</h4>

	<form class="form-material" method="post" action="<%= request.getContextPath()%>/SerletUsuarioController" id="formUser">
							<input type="hidden" name="acao" id="acao" value ="">
															
	<div class="form-group form-default form-static-label">
	<input type="text" name="id" id="id" value="${modelLogin.id}"
	 class="form-control" required="" readonly="readonly">
	 <span class="form-bar"></span> <label
	 class="float-label">ID:</label>
	</div>
	<div class="form-group form-default form-static-label">
	<input type="text" name="nome" id="nome" autocomplete="off" value="${modelLogin.nome}"
	class="form-control" required="required"> <span
	class="form-bar"></span> <label class="float-label">Nome:</label>
	</div>
	<div class="form-group form-default form-static-label">
	<input type="email" name="email" id="email" autocomplete="off" value="${modelLogin.email}"
	class="form-control" required="required"> <span
	class="form-bar"></span> <label class="float-label">Email:</label>
	</div>
	<div class="form-group form-default form-static-label">
	<input type="text" name="login" id="login" value="${modelLogin.login}"
	class="form-control" required="required"> <span
	class="form-bar"></span> <label class="float-label">login:</label>
	</div>
															
	<div class="form-group form-default form-static-label">
	<input type="password" name="senha" id="senha" value="${modelLogin.senha}"
	class="form-control" required="required"> <span
	class="form-bar"></span> <label class="float-label">senha:</label>
	</div>
	<div>
	<button type="button" class="btn btn-primary waves-effect waves-light" onclick="limparForm();">novo</button>
	<button type="submit" class="btn btn-success waves-effect waves-light">salvar</button>
	<button type="button" class="btn btn-info waves-effect waves-light" onclick="criarDeleteComAjax();">excluir</button>
	<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModalUsuario">Pesquisar usu?rio</button>								
	</div>	
	</form>

	</div>
	</div>
	</div>
	</div>
	<span id="msg">${msg}</span>
	
	<div style="height: 300px; overflow: scroll;">
		<table class="table table-light" id="tabelaResultadoview">
		  <thead>
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Nome:</th>
		      <th scope="col">Ver</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${modelLogins}" var="ml">
		    	<tr>
				<td><c:out value="${ml.id}"></c:out></td>
				<td><c:out value="${ml.nome}"></c:out></td>
				<td><a href="<%= request.getContextPath()%>/SerletUsuarioController?acao=buscarEditar&id=${ml.id}" class="btn btn-success waves-effect waves-light">ver</a></td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>
		
		</div>   

	</div>
	<!-- Page-body end -->
	</div>
	<div id="styleSelector"></div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>


	                                                                                                                                                   <!-- Required Jquery -->
<jsp:include page="javascriptfile.jsp"></jsp:include>

<!-- Modal -->
<div class="modal fade" id="exampleModalUsuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Pesquisa de usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

		<div class="input-group mb-3">
		  <input type="text" class="form-control" id="nomeBusca" placeholder="Nome" aria-label="nome" aria-describedby="basic-addon2">
		  <div class="input-group-append">
		    <button class="btn btn-success" type="button" onclick="buscarUsuario();">Buscar</button>
		  </div>
		</div>  
		
		<div style="height: 300px; overflow: scroll;">
		<table class="table table-light" id="tabelaResultados">
		  <thead>
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Nome:</th>
		      <th scope="col">Ver</th>
		    </tr>
		  </thead>
		  <tbody>
		    
		  </tbody>
		</table>
		
		</div>   
		<span id="totalResultados"></span> 

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

function verEditar(id){

	var urlAction = document.getElementById("formUser").action;
	
	window.location.href = urlAction +'?acao=buscarEditar&id='+id;
	
}

function buscarUsuario(){
	
	var nomeBusca= document.getElementById('nomeBusca').value;
	
	if(nomeBusca !=null && nomeBusca != '' && nomeBusca.trim()!=''){
	
		var urlAction = document.getElementById("formUser").action;
		
		$.ajax({
			method : "get",
			url : urlAction,
			data: "nomeBusca="+nomeBusca+"&acao=buscarUserAjax",
			success : function(response){
				
				var json = JSON.parse(response);
				
				$('#tabelaResultados > tbody > tr').remove();
				
				for(var p = 0; p < json.length; p++){
					$('#tabelaResultados > tbody').append('<tr><td>'+json[p].id+
							'</td> <td>'+json[p].nome+
							'</td> <td><button onclick="verEditar('+json[p].id+')" type="button" class="btn btn-info">Ver</button></td> </tr>')
				}
				
				document.getElementById('totalResultados').textContent = 'Resultados: '+json.length;
				
			}
			 
		 }).fail(function(xhr,status,errorThrown){
			alert('Erro ao buscar usuario por nome: '+xhr.responseText); 
		 });
	}
}


function criarDeleteComAjax(){
	
	if(confirm('Deseja excluir este registro ?')){
		
	 var urlAction = document.getElementById("formUser").action;
	 var idUser =  document.getElementById("id").value;
		
	 $.ajax({
		method : "get",
		url : urlAction,
		data: "id="+idUser+"&acao=deletarajax",
		success : function(response){
			limparForm();
			document.getElementById('msg').textContent = response;
		}
		 
	 }).fail(function(xhr,status,errorThrown){
		alert('Erro ao deletar usuario por id: '+xhr.responseText); 
	 });
	 	
	}
}

function criarDelete() {
    if(confirm('Deseja excluir este registro ?')){
	
    document.getElementById("formUser").method ='get'; /*Retorna os elementos html dentro do form*/
    document.getElementById("acao").value = 'deletar';
    document.getElementById("formUser").submit();
    	
    }
    
    }

function limparForm() {
    
    var elementos = document.getElementById("formUser").elements; /*Retorna os elementos html dentro do form*/
    
    for (p = 0; p < elementos.length; p ++){
	    elementos[p].value = '';
    }
}
</script>
	
</body>

</html>
