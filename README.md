# fliper_test_rmn

## Fliper Flutter Test [RMN]

<p align="center">Teste em <b>Flutter</b> para avaliação do empresa Fliper! 🚀</p>

<div align="center">

![technology](https://img.shields.io/badge/technology%20-Flutter%2FDart-blue)
![platfform](https://img.shields.io/badge/plattform-iOS%2FAndroid-orange)
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

	https://github.com/RMNDevelopmentMobility/fliper_test_rmn.git

**_Passo 2:_**

Vá para a raiz do projeto e execute o seguinte comando no console para obter as dependências necessárias: 

	flutter pub get 

**_Passo 3:_**

Este projeto usa a biblioteca _inject_ que trabalha com geração de código, execute o seguinte comando para gerar os arquivos: 

	flutter pub run build_runner build --delete-conflicting-outputs
	
**_Passo 4:_**

Rode o projeto em um emuldor ou device com o comando: 

	flutter run

### Folder Structure

Aqui está a estrutura de pasta principal que este projeto flutter fornece. 

	flutter-first-poc/
	|- .dart_tool
	|- android
	|- assets
	|- build
	|- ios
	|- lib
	|- test
	|- web
	
Aqui está a estrutura de pastas que foi utilizada neste projeto

	lib/
	|- app/
	   |- modules/
	   |- shared/
	      |- colors/
	      |- constants/
	      |- http/
	      |- theme/
	      |- utils/
	   |- app_module.dart
	   |- app_widget.dart
	|- generated_plugin_registrant.dart
	|- main.dart

Agora, vamos mergulhar na pasta lib/app que contém o código principal do aplicativo.
	
	1- modules - Contém separadamente os módulos que compõem o aplicativo. Base do Flutter Modular utilizado neste projeto. 
	2- shared — Contém as subpastas que são compartilhadas por todo o projeto. Possui os utilitários / funções comuns do aplicativo
	3- app_module.dart — Este arquivo contém todas as rotas para os módulos do aplicativo. Responsável também pela injeção de dependências das classes store.
	4- app_widget.dart — Contém as configurações de nível de aplicativo, ou seja, tema, título, orientação, etc.
	5- main.dart - Este é o ponto de partida do aplicativo. Inicializa as classes do Hive, configura o Loading para todo o aplicativo e inicializa o módulo principal da estrutura Modular - AppModule().

**_modules_**

Por utilizar o Flutter Modular este diretório é um dos mais importantes do projeto, contendo todos os módulos que compôem o aplicativo. 
Cada módulo pode conter a seguinte estrutura de pastas/arquivos baseada na **arquitetura MVC** (dependendo da complexidade do mesmo), conforme mostrado no exemplo abaixo: 

	modules/
	   |- agendamentos/
	      |- controllers/
	         |- errors/
		    |- wealthsummary_failure.dart
		 |- repositories/
		    |- wealthsummary_repository.dart
		    |- i_wealthsummary_repository.dart
	         |- agendamentos_store.dart
	      |- models/
	      |- views/
	         |- cards/
		 |- wealthsummary_page.dart
	      |- wealthsummary_module.dart
	      

Explicando melhor a estrutura que cada módulo pode conter, temos abaixo.

	1- controllers — Contém as classes de stores e as subpastas da camada Controler da arquiteruta MV[C].
	   1.1- errors - Contém as classes de erros para tratamento das exceptions da comunicação com as APIs que o módulo consome.
	   1.2- repositories — Contém as classes de interface/comunicação com as APIs que o módulo consome.
	   1.3- nomemodulo_store.dart — Contém a classe store do módulo que utiliza as funções das classes da pasta repositories.
	2- models - Contém os modelos de dados do módulo, camada Model da arquiteruta [M]VC.
	3- views - Contém toda a UI do módulo, podendo conter subpastas como: cards, tabs, tiles, etc. Camada Model da arquiteruta M[V]C.
	4- nomemodulo_module.dart — Este arquivo contém todas as rotas internas do módulos. Responsável também pela injeção de dependências da classe store.
	
### Libraries & Tools Used
* [cupertino_icons](https://github.com/flutter/cupertino_icons)
* [flutter_modular](https://github.com/Flutterando/modular)
* [mobx](https://github.com/mobxjs/mobx.dart)
* [flutter_mobx](https://github.com/mobxjs/mobx.dart)
* [hasura_connect](https://github.com/Flutterando/hasura_connect)
* [dartz](https://github.com/spebbe/dartz)
* [connectivity](https://github.com/flutter/plugins)
* [intl](https://github.com/dart-lang/intl) 
* [flutter_native_splash](https://github.com/jonbhanson/flutter_native_splash)
* [flutter_launcher_icons](https://github.com/fluttercommunity/flutter_launcher_icons)
