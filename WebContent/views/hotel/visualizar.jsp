<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="Hotel" scope="session" type="model.Hotel"></jsp:useBean>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Foto" %>
<%@page import="model.Avaliacao" %>
<%@page import="controller.CadastrarAvaliacao" %>

<!----- Header ----->
<%@include file="../../include/cabecalho_default.jsp"%>
<%@include file="../../include/menu_default.jsp"%>

<!----- Content ----->
<main>
	<section class="section-page">
	   	<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<h1 class="fw-bold"><c:out value="${Hotel.nome}"></c:out></h1>
				</div>
				<div class="col-sm-12 col-md-6 d-md-flex justify-content-md-end">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="../index.jsp">Index</a></li>
							<li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
							<li class="breadcrumb-item"><a href="views/hotel.jsp">Hotéis</a></li>
							<li class="breadcrumb-item active" aria-current="page"><c:out value="${Hotel.nome}"></c:out></li>
						</ol>
					</nav>                        
				</div>
			</div>
		</div>
	</section>
	<article class="container">
		<div id="photo-gallery" class="mb-3 px-0 py-0">
			<%
		    	ArrayList<Foto> lista = Hotel.getFotos();
		    %>			
			<% for (Foto r: lista) { %>
				<img src="<%=r.getFoto() %>" class="<% if (lista.indexOf(r) == 0) { %> image-grid-col-2 image-grid-row-2 <% } %>" alt="<%=r.getDescricao() %>" title="<%=r.getTitulo() %>">			
			<% } %>
		</div>
		<div class="row">
			<div class="col-md-12 mb-3">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Descrição</h4>
						<p><c:out value="${Hotel.descricao}"></c:out></p>
					</div>
				</div>
			</div>

			<!------ Informações ------>
			<div class="col-md-7 mb-3">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Avaliações e informações</h4>
						<div class="row mb-3">
							<div class="col-md-6">
								<h5><p><c:out value="${Hotel.numAvaliacao}"></c:out> 
								avaliações nota <c:out value="${Hotel.mediaAvaliacao}"></c:out> estrelas</h5>
								<div class="card-rate">
									<i class="bi bi-star-fill text-warning"></i>
									<i class="bi bi-star-fill text-warning"></i>
									<i class="bi bi-star-fill text-warning"></i>
									<i class="bi bi-star-fill text-warning"></i>
									<i class="bi bi-star-half text-warning"></i>
								</div>
							</div>
							<div class="col-md-6">
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="button" class="btn btn-green" data-bs-toggle="modal" data-bs-target="#modal-comentarios">Comentários</button>
								</div>
							</div>
						</div>
		
						<!--- Modal Avaliações --->
						<div class="modal fade" id="modal-comentarios" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">Todas as avaliações</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="collapse" id="collapseExample">
											<div class="form-floating">
												<textarea class="form-control" id="floatingTextarea2"></textarea>
												<label for="floatingTextarea2">Deixe seu comentário...</label>
											</div>
										</div>
		
				<%
			    	ArrayList<Avaliacao> listaAvaliacao = Hotel.getAvaliacoes();
					
			   %>			
			   <% for (Avaliacao r: listaAvaliacao) { %>
										<!----- Comentários ----->
										<div class="border p-3 mb-3">
											<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-2 g-4 mb-4">
												<div class="col">
													<h5>
														<%=r.getUsuario() %><br><%=r.getData() %>
													</h5>
												</div>
												<div class="col text-end">
													<%=r.getNota() %>
												</div>
											</div>
											<p>
												<%=r.getComentario() %>
											</p>
										</div>
							<% } %>

									</div>
									<div class="modal-footer">
									<%if(session.getAttribute("Usuario")!=null){%>
										<button type="button" class="btn btn-green" data-bs-toggle="modal" data-bs-target="#modal-cad-avaliacao">Inserir Comentários</button>
									<%}else{ %>
										<button type="button" class="btn btn-green" data-bs-toggle="offcanvas"  data-bs-target="#offcanvasNavbar">Faça seu login para deixar para avaliar</button>
										
									<% } %>
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
									</div>
								</div>
							</div>
						</div>
						<!--- Modal Cad Avaliações --->
						<div class="modal fade" id="modal-cad-avaliacao" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">Cadastro de avaliação</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
									    <form method="POST" action="avaliacao.do" class="content" autocomplete="off">
									    	<h6 class="mb-2 text-primary">Faça sua avaliação:</h6>
								            <div class="row mt-3">
								            	<div class="col-md-4 mb-6">
								            		<label for="id-ponto">Cod. Hotel</label>
								            		<input type="text" class="form-control" id="id-ponto" name="id-ponto" readonly value="<c:out value='${Hotel.id}'></c:out>">
								            	</div>
								            	<div class="col-md-8 mb-6">
								            		<label for="nome-ponto">Nome Hotel</label>
								            		<input type="text" class="form-control" id="nome-ponto" name="nome-ponto" readonly value="<c:out value='${Hotel.nome}'></c:out>">
								            	</div>
								            	
								            </div>
								            <div class="row mt-3">
								            	<div class="col-md-4 mb-6">
								                    <div>
						              					<label for="nota">Qual a sua nota?</label>
						                				<input id="nota" name="nota" type="range" oninput="getElementById('exibePercent').innerHTML = this.value;"
						                    				min="0" max="5" value="5" step="0.5" />
						                				<span id="exibePercent"> 5</span>
						                				
								                	</div>
								                </div>
								                <div class="col-md-8 mb-6">
													<div>
														<label for="floatingTextarea2">Descrição:</label>
														<textarea class="form-control" placeholder="Justifique a sua nota..." id="avaliacao" name="avaliacao" style="height: 100px"></textarea>
													</div>
								                </div>
								            </div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-green" data-bs-toggle="modal">Salvar</button>
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
											</div>
										</form>
								</div>
								</div>
							</div>
						</div>		
						<!------ Informações ------>
						<table class="table">
							<tbody>
								<tr>
									<td class="fw-bold text-nowrap"><i class="bi bi-telephone mx-2"></i> Telefone</td>
									<td class="text-end">
										<c:out value="${Hotel.telefone}"></c:out>
									</td>
								</tr>
								<tr>
									<td class="fw-bold text-nowrap"><i class="bi bi-display mx-2"></i> Site</td>
									<td class="text-end"><a href= "<c:out value="${Hotel.site}"></c:out>" target="_black"><c:out value="${Hotel.site}"></c:out></a></td>
								</tr>
								<tr>
									<td class="fw-bold text-nowrap"><i class="bi bi-calendar-event mx-2"></i>Melhor Dia</td>
									<td class="text-end"><c:out value="${Hotel.melhorDia}"></c:out></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!------ Como Chegar ------>
			<div class="col-md-5 mb-3">
				<div class="card">
					<div class="card-body">
						<div id="map" class="mb-3"></div>
						<table class="table">
							<tbody>
								<tr>
									<td class="fw-bold">
										<i class="bi bi-geo-alt-fill mx-2"></i>
									</td>
									<td id="endereco"></td>
								</tr>
								<tr>
									<td class="fw-bold">
										<i class="bi bi-car-front-fill mx-2"></i>
									</td>
									<td id="distancia"></td>
								</tr>
								<tr>
									<td class="fw-bold">
										<i class="bi bi-clock mx-2"></i>
									</td>
									<td id="tempo"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</article>
</main>

<!----- Footer ----->
<%@include file="../../include/rodape_default.jsp"%>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA32PDmcZkbv37_Jb-GU9ZOTu9OW4j1n4o" defer></script>
<script src="../../assets/js/geolocalizacao.js"></script>
<script>geolocation("<c:out value='${Hotel.endereco.tipoLogradouro}'></c:out><c:out value='${Hotel.endereco}'></c:out>,<c:out value='${Hotel.numero}'></c:out><c:out value='${Hotel.endereco.bairro}'></c:out> CEP: <c:out value='${Hotel.endereco.cep}'></c:out>");</script>