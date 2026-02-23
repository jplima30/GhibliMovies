# Ghibli Movies 🎬

Um aplicativo iOS nativo desenvolvido para o Desafio Técnico, focado em exibir o catálogo de filmes do Studio Ghibli consumindo a [Studio Ghibli API](https://ghibliapi.vercel.app).

## 📱 Visual do Projeto

### 🎬 Catálogo e Interação
A jornada do utilizador consiste na exploração do catálogo completo de obras do Studio Ghibli, com transições fluidas para os detalhes de cada filme e feedback visual claro em caso de falhas de rede.

| Lista de Filmes | Detalhes da Obra |
|:---:|:---:|
| <img src="project_image/Home.png" width="200"> | <img src="project_image/Detalhes.png" width="200"> |
| **Catálogo Assíncrono** | **Informações Detalhadas** |

---

## ⚙️ Funcionalidades
* Listagem completa de filmes do Studio Ghibli.
* Tela de detalhes com informações aprofundadas (diretor, produtor, ano de lançamento, descrição).
* Tratamento de estados visuais (Loading, Success, Error com opção de Retry).

## 🏗️ Arquitetura Escolhida
O projeto foi desenvolvido utilizando o padrão **MVVM (Model-View-ViewModel)** com um fluxo de dados reativo via SwiftUI. 
* A interface (View) reage automaticamente às mudanças de estado publicadas pela ViewModel.
* A lógica de apresentação e o gerenciamento de estados (`.loading`, `.success`, `.error`) estão totalmente isolados na ViewModel, garantindo que as Views fiquem limpas e focadas apenas na renderização visual.

## 🛠️ Decisões Técnicas
* **Injeção de Dependência e Protocolos:** Criei o `MovieServiceProtocol` para abstrair a camada de rede. Isso permitiu criar um `MockMovieService` e testar a lógica da ViewModel de forma isolada, sem depender de requisições reais à internet.
* **Concorrência Moderna:** Utilização extensiva de `async/await` e isolamento de atores (`@MainActor`) para garantir que as atualizações de interface ocorram na thread principal de forma segura e legível.
* **Testes Unitários:** Implementação de testes automatizados (Arrange, Act, Assert) para validar o comportamento da ViewModel em todos os seus cenários (sucesso, erro e estado inicial).

## 🚀 O que faria diferente com mais tempo
* **Cache de Imagens:** Implementação de um sistema de cache local (em memória ou disco) para as capas dos filmes (`AsyncImage` customizado). Isso evitaria downloads repetidos durante o scroll da lista, otimizando o uso de bateria, dados móveis e eliminando tempos de espera constantes.
* **Paginação (Infinite Scroll):** Embora a API atual devolva os filmes de uma só vez, num cenário real e expansível (como um catálogo da Netflix), carregar todos os dados simultaneamente causaria lentidão e um uso elevado de memória. A adição de paginação prepararia a aplicação para escalar de forma eficiente.
* **Testes de UI:** Adição de testes automatizados de interface para garantir que a navegação e a apresentação visual funcionam corretamente na perspetiva do utilizador final.

## 📊 Processo de Desenvolvimento
O desenvolvimento foi guiado pela criação de pequenas *Issues* no GitHub, garantindo entregas contínuas e rastreáveis:
* **Configuração Inicial (#1):** Criação da estrutura base do projeto, ativação dos testes unitários e definição da arquitetura de pastas (Features, Data, Models, Utils).
* **Desenvolvimento da Interface Visual (#3 e #18):** Criação do componente `MovieCardView` com carregamento assíncrono de imagens (`AsyncImage`) e refinamento da hierarquia visual com metadados (ano e duração).
* **Navegação e Detalhes (#8):** Implementação do fluxo de navegação (`NavigationLink`) e construção da tela `MovieDetailView` recebendo os dados diretamente da lista.
* **Refatoração e Estados (#15 e #21):** Implementação do `ViewState` para gerir carregamento, sucesso e erros. Adição de funcionalidades de *Pull-to-Refresh* (`.refreshable
