Este projeto, seguirá o modelo MVC (Model-View-Controller) de desenvolvimento.

Sobre as dependências que utilizamos:
<ul>
  <li>dartz: para utilizar programação funcional com Dart;/li>
  <li>dio: cliente HTTP para Dart, que suporta Interceptors, FormData, Cancelamento de Solicitação, Download de Arquivo, Tempo Limite, etc. </li>
  <li>intl: contém código para lidar com mensagens internacionalizadas / localizadas, formatação e análise de data e número, texto bidirecional e outros      problemas de internacionalização.</li>
  <li>provider:Um wrapper em torno de InheritedWidget para torná-los mais fáceis de usar e mais reutilizáveis.</li>
  <li>path_provider:Um wrapper em torno de InheritedWidget para torná-los mais fáceis de usar e mais reutilizáveis.</li>
  <li>firebase_core:Um plug-in do Flutter para usar a Firebase Core API, que permite a conexão com vários aplicativos do Firebase.</li>
  <li>firebase_auth:Um plug-in Flutter para usar a API Firebase Authentication.</li>
  <li>flutter_native_splash:Um gerador automatico de splash screen.</li>
</ul>

<h3>MovieRepository</h3>

Servirá para se conectar na API do TMDb utilizando dio e converter a resposta em JSON para um objeto (model).
<ul>
  <li>Toda comunicação com serviços (Banco de Dados, APIs, Arquivos, etc) utilizam métodos assíncronos. </li>
  <li>Outro detalhe importante é a parte de tratamento de erros, para isso, usamos try/catch;</li>
  <li>Para finalizar, observe o uso de Either para retornar o objeto correto ou um erro;</li>
</ul>

<h3>MovieController</h3>

O método fetchAllMovies, não sobrescreve a lista de filmes, ele simplesmente adiciona:
<ul>
  <li>moviesResponseModel.movies.addAll(movie.movies);</li>
</ul>

Com isso, é possível criar uma lista infinita.

<h3>MovieDetailController</h3>

Irá fazer o controle dos detalhes dos filmes

<h3>CenteredMessage</h3>

Apresentará um Container para exibir uma mensagem e ícone no centro

<h3>CenteredProgress</h3>

Apresentará um Container para exibir um circulo animado que indica o progresso do carregamento

<h3>MovieCard</h3>

Apresentará um Container para exibir uma imagem do pôster do filme. Essa imagem é acessada em:
<ul>
  <li>url base: https://image.tmdb.org/t/p/w220_and_h330_face/IMAGEM</li>
</ul>

<h3>Constant</h3>

Guarda as constantes utilizada no aplicativo.

<h3>ChipDate</h3>

Vai apresentar um Chip customizado com um ícone de calendário para exibir a data de lançamento do filme.

<h3>Rate</h3>

Vai apresentar uma Row com 2 widgets (Icon e Text) com um ícone de coraçao vermelho e a nota que o filme recebeu até o momento.

<h3>MoviePage</h3>

A lista de filmes.
<ul>
  <li>Na inicialização da página (initState) é chamado o método fetchAllMovie();</li>
  <li>Durante o carregamento uma tela de loading é exibida;</li>
  <li>Caso, algum erro tenha acontecido (por exemplo: falta de internet), uma mensagem de erro é exibida no centro da página;</li>
  <li>O método _initScrollListener configura um Observer para escutar a rolagem da tela, e sempre que a tela chegar no final, é pedido mais filmes para API. Este processo garante uma rolagem infinitas pelos filmes existentes.</li>
  <li>Quando você clicar no pôster do filme, é chamado a tela de detalhes passando o id do filme (método _openDetailPage).</li>
</ul>

<h3>MovieDetailPage</h3>

Definirá a página de detalhes de um filme.
<ul>
<li>Passaremos o id do filme selecionado no construtor da página;</li>
<li>Na inicialização da página é chamado o método fetchMoviebyId();</li>
<li>Durante o carregamento uma tela de loading é exibida;</li>
<li>Caso, algum erro tenha acontecido (por exemplo: falta de internet), uma mensagem de erro é exibida no centro da página;</li>
</ul>

<h3>AuthCheck</h3>
  Widget que valida se o usuário já realizou o login, caso tenha realizado o app irá redirecionar para a MoviePage, caso o contrario para a tela de login
  
<h3>AuthService</h3>
  Serviço de integração com o FireBase com as seguintes responsabilidades:
  <ul>
    <li>Autenticar o usuario</li>
    <li>Buscar por um usuario em específico</li>
    <li>Cadastrar o usuário</li>
    <li>Realizar o login</li>
  </ul>
