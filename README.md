## Resumo da aula de hoje

Hoje, começamos a aula baixando o Git e aprendendo como conectá-lo ao GitHub. Em seguida, instalamos o Visual Studio Code e fizemos login com nossa conta do GitHub. Depois disso, baixamos a extensão Live Share, que permitiu acompanhar a tela do professor em tempo real.

Na sequência, criamos uma pasta com o nosso nome e organizamos sua estrutura com as seguintes subpastas: mobile, projetos, backend e frontend. Por fim, realizamos o resumo da aula, reforçando os principais conteúdos aprendidos.

Primeiro, utilizamos o comando cd para acessar a pasta Documents. Em seguida, usamos o comando mkdir para criar uma nova pasta principal. Depois, entramos nessa pasta com o comando cd.

Dentro dela, criamos outras pastas para organizar o projeto, separando em mobile, frontend, backend e projeto, todas criadas com o comando mkdir. Para verificar se as pastas foram criadas corretamente, utilizamos o comando dir, que lista todos os diretórios existentes.

Por fim, acessamos a pasta mobile e criamos um arquivo README.md usando o comando type nul > README.md, que será usado para documentação do projeto.

## Introdução ao Desenvolvimento Mobile

### Tipo de Desenvolvimento

- Nativo
    - Android:
        - SDK : Android SDK
        - IDE : Android Studio
        - Linguagens: Kotlin e Java
        - Ambientes: mac, win, linux

    - Ios:
        - SDK: cocoa touch
        - IDE: Xcode
        - Linguagens: Swift/ Objectype-c
        - Ambiente: Mac

- Multiplataforma
    - React Native:
        - SDK: Node.js
        - IDE: VScode,
        - Linguagens: JavaScript / TypeScript
        - Ambiente: Mac, Win, Linux

    - Flutter:
        - SDK: Flutter SDK
        - IDE: VScode, Android Studios
        - Linguagens: Dart
        - Ambiente: Mac, Win, Linux

## Preparação do Ambiente de Desenvolvimento

## instalação do FlutterSDK
- download do arquivo ZIP na página flutter.dev
- inclusão do flutter na pasta C:\src
- Inclusão do flutter\bin nas variaveis de ambientes
- teste o flutter --verison

### Instalação do AndroidSDK
- download do android SDK - command line Tools
- adicionar o command-line ao c:\src\AndroidSDK
- adicionar o SDKManager as varáveis de Ambiente
- download dos pacotes
    - emulador
    - platforms
    - platform-tools
    - build-tools

- adicionar ADB e o Emulator as Variáveis de Ambiente

- Criação da Imagem do Emulador - via sdkmanager
- Build do Emulador - via sdkmanager

### Criação de Projetos e Códigos da Linha de Comando

- Criação de projetos
    - Flutter create nome_do_app
        - Flags
            - --empty : Cria um palicativo "vazio" (hello word!)
            - --plataforms : permite a seleção de uma plataforma de desenvolvimento
                - ex: --plataforms=android (a criação do projeto será somente para plataformas android)
    - exemplo de criação de uma aplicativo android vazio
        - flutter create nome_do_app --empty --platforms=android
        - obs: Nome aplicativo: todas as letras minusculas, separação de palavras com "_";
    - flutter doctor 
        - permite correção de pequnos problema no flutter e identificação dos parametros funcionais em relçao as plataformas de desenvolvimento
        - sempre rodar flutter doctor no começo do desemvolvimento
    - flutter clean
        - limpa cache do build(APAGA O APK ANTERIOR)
    - flutter run -v
        - build do app (apk)

- gerenciamento de dependências do PubSpec()
    - instalação
        - Flutter pu add nome_depencendia
    - Baixar instalador de dependencias projetadas
        - flutter pub get
    - outros comando do flutter pub(dependências)
        - flutter pub outdated ( verifica se as dependências estão desatualizadas)
        - flutter pub upgrade (Atualiza as dependencias do flutter pub)
    
    ### Estrutura de um Aplicativo

#### A Hierarquia de Árvore

Gráfico com Demosntração da Hierarquia

```mermaid

graph BT

    MA['MaterialAPP']
    STL['StateLess Widget']
    STF['StateFul Widget']
    SC['Scaffold']
    ABar['AppBar']
    BD["Body"]
    BNBar["BottonNavigationBar"]
    DW["Drawer"]
    FAB["FloatActionButton"]
    SB["SnackBar"]

    MA --> STL, STF
    STF & STL --> SC
    SC --> ABar & BD & BNBar & DW & FAB & SB


```