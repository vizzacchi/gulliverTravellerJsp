<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!----- Header ----->
<%@include file="../include/cabecalho_paginas.jsp"%>
<%@include file="../include/menu_paginas.jsp"%>

	<!----- Content ----->
	<main>        
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../assets/images/home/carousel_01.jpg" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<div class="carousel-card">
							<h5>Parque Ibirapuera</h5>
							<p>Some representative placeholder content for the first slide.</p>
						</div>
					</div>
				</div>
			    <div class="carousel-item">
				    <img src="..." class="d-block w-100" alt="...">
				    <div class="carousel-caption d-none d-md-block">
				    	<h5>Second slide label</h5>
				    	<p>Some representative placeholder content for the second slide.</p>
				    </div>
			    </div>
			    <div class="carousel-item">
			    	<img src="..." class="d-block w-100" alt="...">
			      	<div class="carousel-caption d-none d-md-block">
			        	<h5>Third slide label</h5>
			        	<p>Some representative placeholder content for the third slide.</p>
			    	</div>
			    </div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
		<!------- Section ------->
		<section>
			<div class="container">
				<div class="row mb-3">
					<div class="col-md-6">
						<h1 class="fw-bold">São Paulo</h1>
					</div>
					<div class="col-md-6 d-md-flex justify-content-md-end">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<span id="valorDolar"></span>
									<img src="../assets/images/cotacao_dollar.png" width="22" height="22">
								</li>
	                            <li class="breadcrumb-item">
	                            	<span id="description"></span>
									<img src="../assets/images/weather.png" width="28" height="28">
	                            </li>
							</ol>
						</nav>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-4 d-grid gap-2">
						<a href="" class="btn btn-outline-primary btn-lg">
							<span>Tipo de Viagem</span>
							<i class="bi bi-airplane"></i>
						</a>
					</div>
					<div class="col-md-4 d-grid gap-2">
						<a href="" class="btn btn-outline-primary btn-lg">
							<span>Como Chegar</span>
							<i class="bi bi-geo-alt"></i>
						</a>
					</div>
					<div class="col-md-4 d-grid gap-2">
						<a href="dicasUteis.jsp" class="btn btn-outline-primary btn-lg">
							<span>Dicas Úteis</span>
							<i class="bi bi-signpost-2"></i>
						</a>
					</div>			
				</div>
			</div>
		</section>
           
	    <!------- Article ------->
	    <article class="container">
	        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
	            <div class="col d-flex">
	                <div class="card">
	                    <a href="hotel.jsp">
	                        <img src="../assets/images/home/Hospedagens.jpg" class="card-img-top" alt="Foto de um quarto de hotel aconchegante">
	                    </a>
	                    <div class="card-body">
	                        <h5 class="card-title text-center fw-bold">Melhores Hospedagens</h5>
	                        <div class="card-text">
	                            <p>
	                                Veja os <a href="hotel.jsp" class="cards-link">hotéis</a> 
	                                em destaque na cidade de São Paulo, explore suas acomodações e serviços.
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col d-flex">
	                <div class="card">
	                    <a href="restaurante.jsp">
	                        <img src="../assets/images/home/Gastronomia.jpg" class="card-img-top" alt="Um chefe de cozinha preparando um belo prato">
	                    </a>
	                    <div class="card-body">
	                        <h5 class="card-title text-center fw-bold">Destaques Gastronomicos</h5>
	                        <div class="card-text">
	                            <p>
	                                São Paulo impressiona qualquer visitante pela diversidade de sua
	                                <span class="cards-link">gastronomia</span>, veja os <a href="restaurante.jsp" class="cards-link">restaurantes</a> em destaque.
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col d-flex">
	                <div class="card">
	                    <a href="historia.jsp">
	                        <img src="../assets/images/home/historia.jpg" class="card-img-top" alt="Um mapa aberto com fotos tiradas em diversos passeios.">
	                    </a>
	                    <div class="card-body">
	                        <h5 class="card-title text-center fw-bold">História</h5>
	                        <div class="card-text">
	                            <p>
	                                Os melhores passeios para quem quer explorar um pouco mais da <a href="historia.jsp" class="cards-link"> história </a> da cidade de São Paulo. 
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col d-flex">
	                <div class="card">
	                    <a href="vidaNoturna.jsp">
	                        <img src="../assets/images/home/FestasNoturnas.jpg" class="card-img-top" alt="Pessoas curtindo uma festa em uma casa noturna">
	                    </a>
	                    <div class="card-body">
	                        <h5 class="card-title text-center fw-bold">Vida Noturna</h5>
	                        <div class="card-text">
	                            <p>
	                                São Paulo a cidade que não dorme, possui uma noite vibrante com as melhores
	                                <a href="vidaNoturna.jsp" class="cards-link">casas noturnas</a> do país.
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col d-flex">
	                <div class="card">
	                    <a href="entretenimento.jsp">
	                        <img src="../assets/images/home/entretenimento.jpg" class="card-img-top" alt="Um mapa mundo com fundo preto, com um avião miniatura sendo empurrado por uma mão">
	                    </a>
	                    <div class="card-body">
	                        <h5 class="card-title text-center fw-bold">Entretenimento</h5>
	                        <div class="card-text">
	                            <p>
	                                Os melhores <a href="entretenimento.jsp" class="cards-link">entretenimentos</a>
	                                quem quer experiências incriveis na cidade de São Paulo.
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col d-flex">
	                <div class="card">
	                    <a href="cultura.jsp">
	                        <img src="../assets/images/home/Cultura.jpg" class="card-img-top" alt="Pintura de um rosto indigena num grafite de rua.">
	                    </a>
	                    <div class="card-body">
	                        <h5 class="card-title text-center fw-bold">Cultura</h5>
	                        <div class="card-text">
	                            <p>
	                                São Paulo é uma <a href="cultura.jsp" class="cards-link">cidade multi-cultural</a>,
	                                de museus as mais diversificadas feiras e exposições, explore.
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col d-flex">
	                <div class="card">
	                    <a href="aluguelCarros.jsp">
	                        <img src="../assets/images/home/aluguelCarros.jpg" class="card-img-top" alt="Carros da mercedes enfileirados a 45 graus">
	                    </a>
	                    <div class="card-body">
	                        <h5 class="card-title text-center fw-bold">Aluguel de Carro</h5>
	                        <div class="card-text">
	                            <p>
	                                De carros populares a super esportivos, veja as principais
	                                <a href="aluguelCarros.jsp" class="cards-link"> locadoras</a> de veículos da cidade de São Paulo. 
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col d-flex">
	                <div class="card">
	                    <a href="parque.jsp">
	                        <img src="../assets/images/home/parquesdeSP.jpg" class="card-img-top" alt="Foto de um belo parque com um lago ao fundo de folhas vermelhas">
	                    </a>
	                    <div class="card-body">
	                        <h5 class="card-title text-center fw-bold">Parques</h5>
	                        <div class="card-text">
	                            <p>
	                                Seja para dar uma caminhada,
	                                fazer um belo piqui-nique ou apenas para relaxar embaixo de uma árvore,
	                                São Paulo oferece diversos <a href="parque.jsp" class="cards-link">parques</a>.
	                            </p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </article>
	</main>

<!----- Footer ----->
<%@include file="../include/rodape_paginas.jsp"%>