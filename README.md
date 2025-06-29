# Olá, eu sou o Moisés! 👋

## 🚀 Sobre mim
Estou me formando em analise e desenvolvimento de sistema, atualmente foco meus estudos em lua, java, e aprendendo Linux.


### 🤙 Conecte-se comigo
 [![LinkedIn](https://img.shields.io/badge/LinkedIn-1572B6?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mois%C3%A9s-junior-29aa90199/)

[![dio.me](https://img.shields.io/badge/dio-1572B6?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.dio.me/users/moiseslima89507)


### 🧠 GitHub Stats

![GitHub Stats](https://github-readme-stats.vercel.app/api?username=moiseslima89&theme=transparent&bg_color=000&border_color=30A3DC&show_icons=true&icon_color=30A3DC&title_color=E94D5F&text_color=FFF)

[![GitHub Streak](https://streak-stats.demolab.com/?user=moiseslima89&theme=bear&background=000&border=30A3DC&dates=FFF)](https://github.com/moiseslima89?tab=stars)


### 👩‍💻 Habilidades 


[![My Skills](https://skillicons.dev/icons?i=java,aws,git,linux,windows,mysql,lua,=light)](https://skillicons.dev)


###  👩‍💻 Repositorio
[![Repo Card](https://github-readme-stats.vercel.app/api/pin/?username=moiseslima89&repo=Morningstarcity&bg_color=000&border_color=30A3DC&show_icons=true&icon_color=30A3DC&title_color=E94D5F&text_color=FFF)](https://github.com/moiseslima89/Morningstarcity/)


# 🎮 Pause System - MorningstarCity

Este recurso é um sistema completo de **Passe de Batalha** e **Loja In-Game** desenvolvido para servidores FiveM utilizando **vRP** (Creative Framework). Ele oferece uma experiência de progressão para jogadores e ferramentas administrativas para monitoramento e controle.

---

## ✨ Funcionalidades

### 🎁 Passe de Batalha (Rolepass)
- Sistema de pontos automático (1 ponto por minuto online).
- Recompensas separadas por tipo:
  - Gratuito (Free)
  - Premium (necessita compra com gemas).
- Resgate de recompensas ao alcançar metas de pontos.
- Reinício automático mensal.

### 💎 Loja de Itens (Shop)
- Itens compráveis com gemas.
- Sistema de descontos.
- Interface de carrossel para promoções.
- Histórico de compras armazenado e exibido.

### 📦 Caixas Misteriosas (Boxes)
- Abertura de caixas com recompensas aleatórias.
- Sistema de compra e resgate de prêmios.
- Descontos aplicáveis por caixa.

### ⚙️ Ferramentas Administrativas
- Comando `/addpoints [id] [quantidade]` exclusivo para administradores.
- Armazenamento persistente de dados.
- Integração com Discord para logs de compra/resgate.

---

## 📁 Estrutura do Projeto

```
pause/
├── fxmanifest.lua                # Manifesto do recurso
├── client-side/core.lua         # Lógica do cliente (UI, notificações, etc.)
├── server-side/core.lua         # Lógica do servidor (rolepass, loja, pontos)
├── shared-side/shared.lua       # Dados compartilhados (itens, caixas, trabalhos)
└── web-side/                    # Interface HTML integrada ao menu pause
    ├── index.html
    └── assets/
```

---

## 🛠️ Requisitos

- vRP Creative
- Banco de dados com tabelas `playerdata` e `entitydata`
- Sistema de inventário compatível
- Integração com webhook Discord (opcional)

---

## 📦 Instalação

1. Coloque a pasta `pause` em sua pasta de recursos (`resources/`).
2. Adicione no seu `server.cfg`:
   ```
   ensure pause
   ```
3. Verifique se as dependências como `vrp`, `inventory`, e sons estão corretamente integradas.

---

## 📋 Comandos

- `/addpoints [id] [quantidade]`  
  > Adiciona pontos manualmente ao jogador. Apenas para administradores.

---

## 🧠 Observações

- O sistema concede **1 ponto por minuto online** automaticamente.
- O máximo acumulável de pontos é de **15.000 por mês**.
- Os dados são resetados automaticamente a cada mês.

---

## 📷 Interface

A interface HTML estilizada apresenta:
- Foto de fundo personalizada
- Itens em destaque com desconto
- Itens do passe (Free e Premium)
- Status do jogador (nome, saldo, plano de saúde, etc.)

---

## 📜 Licença

Este recurso é fechado para uso interno em servidores autorizados. Modificações e redistribuições não são permitidas sem autorização prévia.
