package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Avaliacao;
import model.Bairro;
import model.Cidade;
import model.Culinaria;
import model.Destino;
import model.Endereco;
import model.FaixaPreco;
import model.Foto;
import model.HorarioFuncionamento;
import model.Restaurante;
import model.Telefone;
import model.TipoLogradouro;
import model.Uf;
import model.Usuario;

public class RestauranteDao implements DaoBase<Restaurante> {
	
    //DATASOURCE
	private DataSource dataSource;
	
	public RestauranteDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	@Override
	public void create(Restaurante object) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Restaurante> read() {
		try {
			
			List<Restaurante> resultado = new ArrayList<Restaurante>();
			String sql = "SELECT DISTINCT "
							+ " TP.ID, "
							+ " TP.NOME, "
							+ " TP.SITE, "
							+ " TP.FOTO_PERFIL, "
							+ " CONCAT(TE.LOGRADOURO, ', ', TP.NUMERO, ' - ', TB.BAIRRO, ', ', TC.CIDADE, ' - ', TU.UF, ', ', TE.CEP) AS ENDERECO, "
							+ " TL.NUMERO "
					    + "FROM tb_ponto TP "
					    	+ " JOIN tb_restaurante TR ON TR.ID_PONTO = TP.ID "
							+ " LEFT JOIN tb_telefone TL ON TL.ID = TP.ID_TELEFONE "
							+ " LEFT JOIN tb_endereco TE ON TE.ID = TP.ID_ENDERECO "
							+ " LEFT JOIN tb_bairro TB ON TB.ID = TE.ID_BAIRRO "
							+ " LEFT JOIN tb_cidade TC ON TC.ID = TB.ID_CIDADE "
							+ " LEFT JOIN tb_uf TU ON TU.ID = TC.ID_UF "
						+ "ORDER BY TP.NOME ASC";
			
			PreparedStatement stm = dataSource.getConnection().prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Restaurante restaurante = new Restaurante();
				restaurante.setId(rs.getInt("ID"));
				restaurante.setNome(rs.getString("NOME"));
				restaurante.setSite(rs.getString("SITE"));
				restaurante.setFotoPerfil(rs.getString("FOTO_PERFIL"));
				
				//ENDEREÇO				
				Endereco endereco = new Endereco(sql);
				endereco.setLogradouro(rs.getString("ENDERECO"));
				restaurante.setEndereco(endereco);
				
				//TELEFONE
				Telefone telefone = new Telefone();
				telefone.setTelefone(rs.getString("NUMERO"));
				restaurante.setTelefone(telefone);
				
				//Média de avaliações
                //Crio a String SQL que vou ler
                String sqlMedia = "SELECT AVG(`NOTA`) as AVALIACOES_MEDIA "
                                + " FROM `tb_avaliacao` WHERE `ID_PONTO` = " + rs.getInt("ID");
                
                // O ? irá receber o id da chamada
                // gero o Statement a partir da conexao
                PreparedStatement stmMediaAvaliacao = dataSource.getConnection().prepareStatement(sqlMedia);
                
                //Vamos executar o SQL e armazenar em uma objeto ResultSet
                ResultSet rsMediaAvaliacao = stmMediaAvaliacao.executeQuery();
                if(rsMediaAvaliacao.next()) {
                    restaurante.setMediaAvaliacao(rsMediaAvaliacao.getFloat("AVALIACOES_MEDIA"));
                }
				
				resultado.add(restaurante);
			}			
			return resultado;
			
		} catch (Exception e) {
			System.out.println("Erro ao listar Restaurantes " + e.getMessage());
			return null;
		}
	}

	@Override
	public void update(Restaurante object) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Restaurante object) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Restaurante read(Restaurante object) {
		try {
			String SQL = "SELECT DISTINCT "
							+ "	TP.ID AS ID_RESTAURANTE, "
							+ "	TP.NOME AS NOME_RESTAURANTE, "
							+ "	TP.SITE, "
							+ "	TP.FOTO_PERFIL, "
							+ "	TP.DESCRICAO AS DESC_RESTAURANTE, "
							+ "	TP.NUMERO AS NUM_RESTAURANTE, "
							+ "	TP.COMPLEMENTO, "
							+ " TR.REFEICAOLOCAL, "
							+ " TR.ENTREGA, "
							+ " TR.ESTACIONAMENTO, "
							+ " TCU.ID AS ID_CULINARIA, "
							+ " TCU.TIPOCULINARIA, "
							+ " THF.ID AS ID_HORARIOFUNCIONAMENTO,"
							+ " THF.DIA, "
						    + " THF.ABRE, "
						    + " THF.FECHAR, "
							+ "	TE.ID AS ID_ENDERECO, "
							+ "	TE.LOGRADOURO, "
							+ "	TE.CEP, "
							+ "	TE.ID_BAIRRO, "
							+ "	TE.ID_TIPOLOGRADOURO, "
							+ "	TLG.DESCRICAO AS DESC_LOGRADOURO, "
							+ "	TB.BAIRRO, "
							+ "	TB.ID_CIDADE, "
							+ "	TC.CIDADE, "
							+ "	TC.ID_UF, "
							+ "	TU.UF, "
							+ "	TU.DESCRICAO AS DESC_UF, "
							+ "	TL.ID AS ID_TELEFONE, "
							+ "	TL.TIPO AS TIPO_TELEFONE, "
							+ "	TL.NUMERO AS TELEFONE, "
							+ "	TFP.ID AS ID_FAIXAPRECO, "
							+ "	TFP.FAIXA, "
							+ "	TFP.DESCRICAO AS DESC_FAIXA, "
							+ "	TD.ID AS ID_DESTINO, "
							+ "	TD.DESTINO, "
							+ "	TA.ID AS ID_AVALIACAO, "
							+ "	TA.COMENTARIO, "
							+ "	TA.NOTA, "
							+ "	TA.DATA, "
							+ "	TA.ID_USUARIO, "
							+ "	TUS.NOME AS NOME_USUARIO, "
							+ "	TUS.EMAIL "
					+ "FROM tb_ponto TP "
							+ "	JOIN tb_restaurante TR on TR.ID_PONTO = TP.ID "
							+ "	LEFT JOIN gulliver.tb_culinaria TCU ON TCU.ID = TR.ID_CULINARIA "
							+ "	LEFT JOIN gulliver.tb_horario_funcionamento THF ON THF.ID = TR.ID_HORARIOFUNCIONAMENTO "
							+ "	LEFT JOIN tb_telefone TL ON TL.ID = TP.ID_TELEFONE "
							+ "	LEFT JOIN tb_endereco TE ON TE.ID = TP.ID_ENDERECO "
							+ "	LEFT JOIN tb_tipo_logradouro TLG on TE.ID_TIPOLOGRADOURO = TLG.ID "
							+ "	LEFT JOIN tb_bairro TB ON TB.ID = TE.ID_BAIRRO "
							+ "	LEFT JOIN tb_cidade TC ON TC.ID = TB.ID_CIDADE "
							+ "	LEFT JOIN tb_uf TU ON TU.ID = TC.ID_UF "
							+ "	LEFT JOIN tb_faixa_preco TFP on TFP.ID = TP.ID_FAIXAPRECO "
							+ "	LEFT JOIN tb_destino TD on TD.ID = TP.ID_DESTINO "
							+ "	LEFT JOIN tb_avaliacao TA ON TA.ID = TP.ID_AVALIACAO "
							+ "	LEFT JOIN tb_usuario TUS on TUS.ID = TA.ID_USUARIO "
					+ "WHERE TP.ID = ?";
			
			// O ? IRÁ RECEBER O (ID) DA CHAMADA
			PreparedStatement stm = dataSource.getConnection().prepareStatement(SQL);
			stm.setInt(1, object.getId());
			
			//EXECUTA O SQL E ARMAZENA EM UM OBJETO ResultSet
			ResultSet rs = stm.executeQuery();
			
			//O MÉTODO next() INDICA SE HÁ REGISTRO NO RESULTADO
			if(rs.next()) {
				Restaurante restaurante = new Restaurante();
				restaurante.setId(rs.getInt("ID_RESTAURANTE"));
				restaurante.setNome(rs.getString("NOME_RESTAURANTE"));
				restaurante.setSite(rs.getString("SITE"));
				restaurante.setFotoPerfil(rs.getString("FOTO_PERFIL"));
				restaurante.setDescricao(rs.getString("DESC_RESTAURANTE"));
				restaurante.setNumero(rs.getInt("NUM_RESTAURANTE"));
				restaurante.setComplemento(rs.getString("COMPLEMENTO"));
				restaurante.setRefeicaoLocal(rs.getBoolean("REFEICAOLOCAL"));
				restaurante.setEntrega(rs.getBoolean("ENTREGA"));
				restaurante.setEstacionamento(rs.getBoolean("ESTACIONAMENTO"));
				
				//CULINÁRIA
				Culinaria culinaria = new Culinaria();
				culinaria.setId(rs.getInt("ID_CULINARIA"));
				culinaria.setTipoCulinaria(rs.getString("TIPOCULINARIA"));
				
				//HORÁRIO FUNCIONAMENTO
				HorarioFuncionamento horario = new HorarioFuncionamento();
				horario.setId(rs.getInt("ID_HORARIOFUNCIONAMENTO"));
				horario.setDia(rs.getString("DIA"));
				horario.setAbre(rs.getDate("ABRE").toLocalDate());
				horario.setFecha(rs.getDate("FECHAR").toLocalDate());
				
				restaurante.setCulinaria(culinaria);
				restaurante.setHorarioFuncionamento(null);
		
				//ENDEREÇO
				Endereco endereco = new Endereco();
				endereco.setId(rs.getInt("ID_ENDERECO"));
				endereco.setLogradouro(rs.getString("LOGRADOURO"));
				endereco.setCep(rs.getString("CEP"));
				
				//BAIRRO
				Bairro bairro = new Bairro();
				bairro.setId(rs.getInt("ID_BAIRRO"));
				bairro.setBairro(rs.getString("BAIRRO"));
				
				//CIDADE
				Cidade cidade = new Cidade();
				cidade.setId(rs.getInt("ID_CIDADE"));
				cidade.setCidade(rs.getString("CIDADE"));
				
				//UF
				Uf uf = new Uf();
				uf.setId(rs.getInt("ID_UF"));
				uf.setUf(rs.getString("UF"));
				uf.setDescricao(rs.getString("DESC_UF"));
				
				//LOGRADOURO
				TipoLogradouro tipoLogradouro = new TipoLogradouro();
				tipoLogradouro.setId(rs.getInt("id_TIPOLOGRADOURO"));
				tipoLogradouro.setTipoLogradouro(rs.getString("DESC_LOGRADOURO"));
				
				cidade.setUf(uf);
				bairro.setCidade(cidade);
				endereco.setBairro(bairro);
				endereco.setTipoLogradouro(tipoLogradouro);
				
				restaurante.setEndereco(endereco);
								
				//TELEFONE
				Telefone telefone = new Telefone();
				telefone.setId(rs.getInt("ID_TELEFONE"));
				telefone.setTipo(rs.getString("TIPO_TELEFONE"));
				telefone.setTelefone(rs.getString("TELEFONE"));
				
				restaurante.setTelefone(telefone);
				
				/*************************
				//CARREGA LISTA DE FOTOS*/
				ArrayList<Foto> fotos = new ArrayList<Foto>();
                
                String SQLFoto = "SELECT "
                                    + " TF.ID AS ID_FOTO, "
                                    + " TF.FOTOS, "
                                    + " TF.DESCRICAO AS DESC_FOTOS, "
                                    + " TF.TITULO AS TITULO_FOTOS "
                                + "FROM tb_foto TF "
                                + "WHERE TF.ID_PONTO = ?";
                
                // O ? IRÁ RECEBER O (ID) DA CHAMADA
                PreparedStatement stmFoto = dataSource.getConnection().prepareStatement(SQLFoto);
                stmFoto.setInt(1, object.getId());
                
                //EXECUTA O SQL E ARMAZENA EM UM OBJETO ResultSet
                ResultSet rsFoto = stmFoto.executeQuery();
                                
                //O MÉTODO next() INDICA SE HÁ REGISTRO NO RESULTADO
                while(rsFoto.next()) {
                    Foto foto = new Foto();
                    foto.setId(rsFoto.getInt("ID_FOTO"));
                    foto.setFoto(rsFoto.getString("FOTOS"));
                    foto.setDescricao(rsFoto.getString("DESC_FOTOS"));
                    foto.setTitulo(rsFoto.getString("TITULO_FOTOS"));
                    fotos.add(foto);                
                }
                restaurante.setFotos(fotos);
				
				//FAIXA DE PREÇO
				FaixaPreco faixaPreco = new FaixaPreco();
				faixaPreco.setId(rs.getInt("ID_FAIXAPRECO"));
				faixaPreco.setFaixa(rs.getInt("FAIXA"));
				faixaPreco.setDescricao(rs.getString("DESC_FAIXA"));
				
				restaurante.setFaixaPreco(faixaPreco);

				//AVALIAÇÕES	
				ArrayList<Avaliacao> avaliacoes = new ArrayList<Avaliacao>();
				String sqlAvaliacao = "SELECT "
                				        + "TA.ID as ID_AVALIACAO, "
                				        + "TA.NOTA, "
                				        + "TA.DATA, "
                				        + "TA.COMENTARIO, "
                				        + "TA.ID_USUARIO, "
                				        + "TA.ID_PONTO, "
                	                    + "TU.NOME,"
                	                    + "TU.EMAIL,"
                	                    + "TU.SENHA,"
                	                    + "TU.ID_PERFIL,"
                	                    + "TU.ATIVO AS SIT_USUARIO, "
                	                    + "TP.PERFIL, TP.ATIVO AS SIT_PERFIL "
                	                + "FROM `tb_avaliacao` TA "
                	                     + "JOIN tb_usuario TU ON TA.ID_USUARIO = TU.ID "
                	                     + "JOIN tb_usuario_perfil TP ON TP.ID = TU.ID_PERFIL "
                	                + "WHERE TA.ID_PONTO = ?";
	            
	            PreparedStatement stmAvaliacao = dataSource.getConnection().prepareStatement(sqlAvaliacao);
	            stmAvaliacao.setInt(1, object.getId());
	            ResultSet rsAvaliacao = stmAvaliacao.executeQuery();
	            
	            //O MÉTODO next() INDICA SE HÁ REGISTRO NO RESULTADO
	            while(rsAvaliacao.next()) {
	                Avaliacao avaliacao = new Avaliacao();
	                avaliacao.setId(rsAvaliacao.getInt("ID_AVALIACAO"));
	                avaliacao.setComentario(rsAvaliacao.getString("COMENTARIO"));
	                avaliacao.setNota(rsAvaliacao.getDouble("NOTA"));
	                avaliacao.setData(rsAvaliacao.getDate("DATA").toLocalDate());
	                
	                //USUÁRIO   
	                Usuario usuario = new Usuario();
	                usuario.setId(rsAvaliacao.getInt("ID_USUARIO"));
	                usuario.setNome(rsAvaliacao.getString("NOME"));
	                usuario.setEmail(rsAvaliacao.getString("EMAIL"));
	                
	                avaliacao.setUsuario(usuario);
	                
	                avaliacoes.add(avaliacao);
	            }           
							
				restaurante.setAvaliacao(avaliacoes);
				//Numero de Avaliações
                
                //Crio a String SQL que vou ler
                String sqlNumAvaliacao = "SELECT COUNT(`NOTA`) as NUM_AVALIACOES "
                                        + " FROM `tb_avaliacao` WHERE `ID_PONTO` = ?";
                
                // O ? irá receber o id da chamada
                // gero o Statement a partir da conexao
                PreparedStatement stmNumAvaliacao = dataSource.getConnection().prepareStatement(sqlNumAvaliacao);
                //preenche o ?
                stmNumAvaliacao.setInt(1, object.getId());
                
                //Vamos executar o SQL e armazenar em uma objeto ResultSet
                ResultSet rsNumAvaliacao = stmNumAvaliacao.executeQuery();
                if(rsNumAvaliacao.next()) {
                    restaurante.setNumAvaliacao(rsNumAvaliacao.getFloat("NUM_AVALIACOES"));
                }   

                //Média de avaliações
                //Crio a String SQL que vou ler
                String sqlMediaAvaliacao = "SELECT AVG(`NOTA`) as AVALIACOES_MEDIA "
                                + " FROM `tb_avaliacao` WHERE `ID_PONTO` = ?";

                // O ? irá receber o id da chamada
                // gero o Statement a partir da conexao
                PreparedStatement stmMediaAvaliacao = dataSource.getConnection().prepareStatement(sqlMediaAvaliacao);
                //preenche o ?
                stmMediaAvaliacao.setInt(1, object.getId());
                
                //Vamos executar o SQL e armazenar em uma objeto ResultSet
                ResultSet rsMediaAvaliacao = stmMediaAvaliacao.executeQuery();
                if(rsMediaAvaliacao.next()) {
                    restaurante.setMediaAvaliacao(rsMediaAvaliacao.getFloat("AVALIACOES_MEDIA"));
                }   

				//DESTINO
				Destino destino = new Destino();
				destino.setId(rs.getInt("ID_DESTINO"));
				destino.setDestino(rs.getString("DESTINO"));
				
				restaurante.setDestino(destino);
				
				return restaurante;		
			}
			else {
				return null;
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("RestauranteDao.read=" + ex.getMessage());
		}
		return null;
	}
}