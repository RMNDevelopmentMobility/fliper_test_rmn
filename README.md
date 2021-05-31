# fliper_test_rmn

## Fliper Flutter Test [RMN]

<p align="center">Teste em <b>Flutter</b> para avaliação do empresa Fliper! 🚀</p>

<div align="center">

![technology](https://img.shields.io/badge/technology%20-Flutter%2FDart-blue)
![platfform](https://img.shields.io/badge/plattform-iOS%2FAndroid-orange)
![bitrise](https://app.bitrise.io/app/48fe63cfe53aba9f/status.svg?token=lvOVHFM-8ANKgQY8tkiwxg&branch=master)
![unit-tests](https://img.shields.io/badge/unit%20tests-✔-brightgreen)
![widget-tests](https://img.shields.io/badge/widget%20tests-✔-brightgreen)

</div>

## Overview
Projeto Flutter criado pela CLI Slidy.

Este repositório serve como base para futuros projetos de aplicativos em Flutter, atendendo a premissa de termos um único código para ambas plataformas mobile de maior relevância no mundo (Android e iOS).

Padrão arquitetural baseado em **MVC** e criado pelo conjunto: **CLI Slidy + Flutter Modular** (+ MobX).


## Index
* [Overview](#Overview)
* [Project Architecture](#Project-Architecture)
* [State Management and Reactivity](#PState-Management-Reactivity)
* [Getting Started](#Getting-Started)
	* [Prerequisites / Installation](#Prerequisites-Installation)
	* [How to Use](#How-to-Use)
* [Folder Structure](#Folder-Structure)
* [Libraries & Tools Used](#Libraries-Tools-Used)
* [Bitrise Configuration](#Bitrise-Configuration)
	
	
## Project Architecture
O padrão arquitetural adotado neste projeto é o **MVC (Model-View-Controller)**. 

A estruturação de pastas e subpastas (detalhadas mais abaixo) do código fonte está amplamente baseada no padrão arquitetural referido.

<p align="center">
  <a href="https://github.com/grupofleury/flutter-first-poc">
    <img src="https://github.com/RMNDevelopmentMobility/poc_fleury/blob/master/assets/Flutter_POC_MVC.png" height="250" width="600" alt="Flutter_POC_MVC" />
  </a>
</p>

*** Como boa prática, a subcamada Repository dentro da camada Controller é fortemente utilizada, separando as classes de interface/comunicação com as APIs externas consumidas pelo aplicativo.

## State Management and Reactivity
O gerenciamento de estado utilizada no projeto é feito com o MobX.

MobX consiste em ser uma biblioteca de gerenciamento de estado que possui o objetivo de simplificar a comunicação dos dados reativos com a interface do usuário, possuindo 3 pilares:
-   Actions
-   Observables
-   Reactions

<p align="center">
  <a href="https://github.com/grupofleury/flutter-first-poc">
    <img src="https://github.com/RMNDevelopmentMobility/poc_fleury/blob/master/assets/MobX_dart.png" height="300" width="600" alt="MobX_dart" />
  </a>
</p>

**Referência MobX** (https://pub.dev/packages/mobx)

## Getting Started
Este projeto é um ponto de partida para um aplicativo Flutter dentro do Grupo Fleury.

Alguns recursos para você começar, se este for seu primeiro projeto Flutter:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

Para obter ajuda para começar a usar o Flutter, consulte a [documentação online](https://flutter.dev/docs), que oferece tutoriais, exemplos, orientação sobre desenvolvimento móvel e uma referência completa de API. 

### Prerequisites / Installation
Passos necessário para preparar o ambiente antes de rodar este projeto:
-   Instalar o **Git** (https://git-scm.com/downloads)
-   Instalar o **Flutter** (https://flutter.dev/docs/get-started/install)
-   Instalar o **Dart SDK** (https://dart.dev/get-dart)
-   Ative a CLI Slidy (https://github.com/Flutterando/slidy)
-   Obter alguma IDE para o desenvolvimento. Ex.: Visual Studio Code
	- Plugins específicos podem auxiliar no desenvolvimento, abaixo segue a lista com alguns deles para o VSCode:
		- Flutter (dart-code.flutter)
		- Dart (dart-code.dart-code)
		- Bracket Pair Colorizer 2 (coenraads.bracket-pair-colorizer-2)
		- Material Icon Theme (pkief.material-icon-theme)
		- Visual Studio Keymap (ms-vscode.vs-keybindings)

### How to Use
**_Passo 1:_**

Baixe ou clone este repositório usando o link abaixo:

	https://github.com/grupofleury/flutter-first-poc.git

**_Passo 2:_**

Vá para a raiz do projeto e execute o seguinte comando no console para obter as dependências necessárias: 

	flutter pub get 

**_Passo 3:_**

Este projeto usa a biblioteca _inject_ que trabalha com geração de código, execute o seguinte comando para gerar os arquivos: 

	slidy run mobx_build_clean

### Folder Structure

Aqui está a estrutura de pasta principal que este projeto flutter fornece. 

	flutter-first-poc/
	|- .dart_toll
	|- .idea	
	|- .slidy
	|- .vscode
	|- android
	|- assets
	|- bitrise
	|- build
	|- fonts
	|- gen
	|- ios
	|- keystore_profile
	|- lib
	|- test
	
Aqui está a estrutura de pastas que usamos neste projeto

	lib/
	|- app/
	   |- controllers/
	      |- repositories/
	      |- app_controller.dart
	   |- data/
	   |- modules/
	   |- shared/
	      |- components/
	      |- http/
	      |- utils/
	   |- app_module.dart
	   |- app_widget.dart
	|- main.dart

Agora, vamos mergulhar na pasta lib/app que contém o código principal do aplicativo.

	1- controllers - Contém as classes de controller da base do aplicativo.
	   1.1 - repositories — Contém as classes de interface/comunicação com as APIs que o aplicativo consome.
	   1.2- app_controller.dart — Contém a classe controller do aplicativo que gerencia a sequencia de abertura dos módulos, grava no Hive o pré-agendamento e realiza o post do pré-agendamento na API correspondente (utilizando as funções das classes da pasta repositories).
	2- data - Contém a camada de dados do projeto, incluindo as classes dos arquivos Hive como cache local.
	3- modules - Contém separadamente os módulos que compõem o aplicativo. Base do Flutter Modular utilizado neste projeto. 
	4- shared — Contém as subpastas que são compartilhadas por todo o projeto. Possui os utilitários / funções comuns do aplicativo
	5- app_module.dart — Este arquivo contém todas as rotas para os módulos do aplicativo. Responsável também pela injeção de dependências das classes controller.
	6- app_widget.dart — Contém as configurações de nível de aplicativo, ou seja, tema, título, orientação, etc.
	7- main.dart - Este é o ponto de partida do aplicativo. Inicializa as classes do Hive, configura o Loading para todo o aplicativo e inicializa o módulo principal da estrutura Modular - AppModule().

**_modules_**

Por utilizar o Flutter Modular este diretório é um dos mais importantes do projeto, contendo todos os módulos que compôem o aplicativo. 
Cada módulo pode conter a seguinte estrutura de pastas/arquivos baseada na **arquitetura MVC** (dependendo da complexidade do mesmo), conforme mostrado no exemplo abaixo: 

	modules/
	   |- agendamentos/
	      |- controllers/
	         |- errors/
		    |- agendamentos_failure.dart
		 |- repositories/
		    |- agendamentos_repository.dart
		    |- i_agendamentos_repository.dart
	         |- agendamentos_controller.dart
	      |- models/
	      |- views/
	         |- cards/
		 |- tabs/
		 |- tiles/
		 |- agendamentos_page.dart
		 |- cancelamentos_page.dart
		 |- detalhe_agendamentos_page.dart
	      |- agendamentos_module.dart
	      

Explicando melhor a estrutura que cada módulo pode conter, temos abaixo.

	1- controllers — Contém as classes de controllers e as subpastas da camada Controler da arquiteruta MV[C].
	   1.1- errors - Contém as classes de erros para tratamento das exceptions da comunicação com as APIs que o módulo consome.
	   1.2- repositories — Contém as classes de interface/comunicação com as APIs que o módulo consome.
	   1.3- nomemodulo_controller.dart — Contém a classe controller do módulo que utiliza as funções das classes da pasta repositories.
	2- models - Contém os modelos de dados do módulo, camada Model da arquiteruta [M]VC.
	3- views - Contém toda a UI do módulo, podendo conter subpastas como: cards, tabs, tiles, etc. Camada Model da arquiteruta M[V]C.
	4- nomemodulo_module.dart — Este arquivo contém todas as rotas internas do módulos. Responsável também pela injeção de dependências da classe controller.
	
### Libraries & Tools Used
* [flutter_mobx](https://github.com/mobxjs/mobx.dart)
* [mobx](https://github.com/mobxjs/mobx.dart)
* [flutter_modular](https://github.com/Flutterando/modular)
* [dio](https://github.com/flutterchina/dio)
* [oauth_dio](https://github.com/salomaosnff/oauth_dio) #(sem menção ao null safety)
* [flutter_secure_storage](https://github.com/mogol/flutter_secure_storage)
* [camera](https://github.com/flutter/plugins)
* [path_provider](https://github.com/flutter/plugins)
* [hive](https://github.com/hivedb/hive)
* [file_picker](https://github.com/miguelpruivo/flutter_file_picker)
* [flutter_pdfview](https://github.com/endigo/flutter_pdfview)
* [geolocator](https://github.com/Baseflow/flutter-geolocator)
* [google_place](https://github.com/bazrafkan/google_place) #(sem menção ao null safety)
* [geocoder](https://github.com/aloisdeniel/flutter_geocoder) #(sem menção ao null safety)
* [flutter_dotenv](https://github.com/java-james/flutter_dotenv)
* [mask_text_input_formatter](https://github.com/siqwin/mask_text_input_formatter)
* [flutter_easyloading](https://github.com/kokohuang/flutter_easyloading) #(sem menção ao null safety)
* [expandable](https://github.com/aryzhov/flutter-expandable) #(sem menção ao null safety)
* [manage_calendar_events](https://github.com/lakshmanaprabhu/manage_calendar_events) #(sem menção ao null safety)
* [flutter_launcher_icons](https://github.com/fluttercommunity/flutter_launcher_icons)
* [photo_view](https://github.com/fireslime/photo_view)
* [dartz](https://github.com/spebbe/dartz)
* [connectivity](https://github.com/flutter/plugins)
