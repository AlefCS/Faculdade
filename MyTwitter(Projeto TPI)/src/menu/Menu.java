package menu;

import java.util.Scanner;

import perfis.*;
import perfis.exceptions.PEException;
import twitter.*;

public class Menu {
	public static void imprimirLinhasCabecalho(String usuario) {
		for (int i = 0; i < 5 + usuario.length(); i++) {
			System.out.print("=");
		}
		System.out.println("");
	}
	public static void imprimirMenuUsuario(String usuario) {
		System.out.println("");
		imprimirLinhasCabecalho(usuario);
		System.out.println("OLÁ " + usuario + "!");
		imprimirLinhasCabecalho(usuario);
		System.out.println("1. Tweetar");
		System.out.println("2. Ver timeline");
		System.out.println("3. Ver seus tweets");
		System.out.println("4. Seguir");
		System.out.println("5. Número de seguidores");
		System.out.println("6. Listar seguidores");
		System.out.println("7. Sair");
		System.out.println("8. Fechar");
		System.out.println("");
		System.out.print("Escolha uma opção: ");
	}
	
	public static void imprimirMenuInicial() {
		System.out.println("");
		System.out.println("======================");
		System.out.println("BEM VINDO AO MyTwitter");
		System.out.println("======================");
		System.out.println("1. Criar perfil");
		System.out.println("2. Desativar perfil");
		System.out.println("3. Acessar perfil");
		System.out.println("4. Fechar");
		System.out.println("");
		System.out.print("Escolha uma opção: ");
	}
	/*
	public static String pedirUsuario() {
		System.out.println("");
		System.out.print("Usuário:");
		Scanner ler = new Scanner(System.in);
		ler.nextLine();
		String usuario = ler.nextLine();
		ler.close();
		return usuario;		
	}
	*/
	public static void main(String[] args) {
		String usuario;
		MyTwitter twitter = new MyTwitter();
		Scanner leitor = new Scanner(System.in);
		String entrada = "5";
		//int entrada = 5;
		while(entrada != "4") {
			imprimirMenuInicial();
			//entrada = leitor.nextInt();
			entrada = leitor.nextLine();
			switch (entrada) {
			case "1":
				String pessoaTipo = "0";
				System.out.println("");
				boolean opcaoInvalida = false;
				while(pessoaTipo.charAt(0) != '1' && pessoaTipo.charAt(0) != '2') {
					if (opcaoInvalida) {
						System.out.println("");
						System.out.println("ERRO - OPÇÃO INVÁLIDA!");
						System.out.println("");
					}
					System.out.println("Escolha uma opção:");
					System.out.println("1. Pessoa Física");
					System.out.println("2. Pessoa Jurídica");
					pessoaTipo = leitor.nextLine();
					//pessoaTipo = leitor.nextInt();
					opcaoInvalida = true;
				}
				System.out.println("");
				System.out.print("Usuário: ");
				usuario = leitor.nextLine();
				Perfil pessoa;
				if (pessoaTipo.charAt(0) == '1') {
					System.out.println("");
					System.out.print("Informe o CPF: ");
					long cpf = leitor.nextLong();
					leitor.nextLine();
					pessoa = new PessoaFisica(usuario, cpf);
					
				} else {
					System.out.println("");
					System.out.print("Informe o CNPJ: ");
					long cnpj = leitor.nextLong();
					leitor.nextLine();
					pessoa = new PessoaJuridica(usuario, cnpj);
				}
				try {
					twitter.criarPerfil(pessoa);
				} catch (PEException pee) {
					System.out.println("");
					System.out.println("ERRO! " + pee.getMessage());
				}
				break;
			case "2":
				System.out.println("");
				System.out.print("Usuário: ");
				usuario = leitor.nextLine();
				try {
					twitter.cancelarPerfil(usuario);
				} catch (Exception e) {
					System.out.println("");
					System.out.println("ERRO! " + e.getMessage());
				}
				break;
			case "3":
				System.out.println("");
				System.out.print("Usuário: ");
				usuario = leitor.nextLine();
				boolean sair = false;
				while (entrada != "7" && sair == false) {
					imprimirMenuUsuario(usuario);
					entrada = leitor.nextLine();
					switch (entrada) {
						case "1":
							String mensagem;
							System.out.println("");
							System.out.println("Tweet:");
							mensagem = leitor.nextLine();
							try {
								twitter.tweetar(usuario, mensagem);
							} catch (Exception e) {
								System.out.println("");
								System.out.println("ERRO! " + e.getMessage());
							}
							break;
						case "2":
							System.out.println("");
							try {
								for (Tweet tweet : twitter.timeline(usuario)) {
									System.out.println(tweet.getMensagem());
								}
							} catch (Exception e) {
								System.out.println("");
								System.out.println("ERRO! " + e.getMessage());
							}
							break;
						case "3":
							System.out.println("");
							try {
								for (Tweet tweet : twitter.tweets(usuario)) {
									System.out.println(tweet.getMensagem());
								}
							} catch(Exception e) {
								System.out.println("");
								System.out.println("ERRO! " + e.getMessage());
							}
							break;
						case "4":
							String usuarioSeguido;
							System.out.println("");
							System.out.println("Digite o nome do usuário a ser seguido:");
							usuarioSeguido = leitor.nextLine();
							try {
								twitter.seguir(usuario, usuarioSeguido);
							} catch (Exception e) {
								System.out.println("");
								System.out.println("ERRO! " + e.getMessage());
							}			
							break;
						case "5":
							try {
								System.out.println("");
								System.out.println("Você tem " + twitter.numeroSeguidores(usuario) + " seguidor(es).");
							} catch (Exception e) {
								System.out.println("");
								System.out.println("ERRO! " + e.getMessage());
							}
							break;
						case "6":
							try {
								System.out.println("");
								for (Perfil seguidor : twitter.seguidores(usuario)) {
									System.out.println(seguidor.getUsuario());
								}
							} catch (Exception e) {
								System.out.println("ERRO! " + e.getMessage());
							}
							break;
						case "7":
							sair = true;
							break;
						case "8":
							System.exit(0);
							break;
						default:
							System.out.println("");
							System.out.println("ERRO - OPÇÃO INVÁLIDA!");
							break;
					}
				}
				break;
			case "4":
				System.exit(0);
				break;
			default:
				System.out.println("");
				System.out.println("ERRO - OPÇÃO INVÁLIDA!");
				break;
			}
			
		}
		leitor.close();
	}
}