# dotfiles

Configuración personal en `~/.config`. Probado en **Arch Linux** (CachyOS).

---

## Herramientas esenciales

### Terminal & Shell

| Herramienta                                | Propósito                                                | Instalar             |
| ------------------------------------------ | -------------------------------------------------------- | -------------------- |
| [WezTerm](https://wezfurlong.org/wezterm/) | Emulador de terminal GPU-accelerated, config en Lua      | `pacman -S wezterm`  |
| [Zellij](https://zellij.dev)               | Multiplexor de terminal moderno (layouts, plugins)       | `pacman -S zellij`   |
| [Starship](https://starship.rs)            | Prompt cross-shell minimalista y rápido                  | `pacman -S starship` |
| [Atuin](https://atuin.sh)                  | Historial de shell cifrado, sincronizable y con búsqueda | `pacman -S atuin`    |

**Activar Atuin en Zsh:**

```sh
echo 'eval "$(atuin init zsh)"' >> ~/.zshrc

```

**Activar Starship en Zsh:**

```sh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

```

---

### Editores & Dev tools

| Herramienta                                                                | Propósito                                | Instalar               |
| -------------------------------------------------------------------------- | ---------------------------------------- | ---------------------- |
| [Neovim](https://neovim.io)                                                | Editor modal extensible                  | `pacman -S neovim`     |
| [Lazygit](https://github.com/jesseduffield/lazygit)                        | TUI para git                             | `pacman -S lazygit`    |
| [opencode](https://opencode.ai)                                            | AI coding agent en terminal              | `yay -S opencode-bin`  |
| [GitHub CLI](https://cli.github.com)                                       | CLI oficial de GitHub                    | `pacman -S github-cli` |
| [ripgrep](https://github.com/BurntSushi/ripgrep)                           | Búsqueda en archivos ultrarrápida (`rg`) | `pacman -S ripgrep`    |
| [fzf](https://github.com/junegunn/fzf)                                     | Fuzzy finder para shell, vim y scripts   | `pacman -S fzf`        |
| [jq](https://jqlang.github.io/jq/) / [yq](https://github.com/mikefarah/yq) | Procesamiento de JSON / YAML en CLI      | `pacman -S jq yq`      |
| [direnv](https://direnv.net)                                               | Variables de entorno por directorio      | `pacman -S direnv`     |
| [Flameshot](https://flameshot.org)                                         | Capturas de pantalla con anotaciones     | `pacman -S flameshot`  |

**Activar direnv en Zsh:**

```sh
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc

```

---

### Python

| Herramienta                        | Propósito                                                    | Instalar                   |
| ---------------------------------- | ------------------------------------------------------------ | -------------------------- |
| [uv](https://docs.astral.sh/uv)    | Package & project manager Python ultrarrápido                | `pacman -S uv`             |
| [VisiData](https://visidata.org)   | TUI para explorar datos tabulares (CSV, JSON, Parquet...)    | `uv tool install visidata` |
| [pgcli](https://www.pgcli.com)     | CLI para PostgreSQL con autocompletado y syntax highlighting | `uv tool install pgcli`    |
| [Marimo](https://marimo.io)        | Notebooks Python reactivos y reproducibles                   | `uv tool install marimo`   |
| [dbt-core](https://www.getdbt.com) | Transformaciones SQL con testing y documentación             | `uv tool install dbt-core` |

> Preferir `uv tool install` sobre pip global para mantener las herramientas aisladas.

---

### Data & Analytics

| Herramienta                      | Propósito                                                | Instalar           |
| -------------------------------- | -------------------------------------------------------- | ------------------ |
| [DuckDB CLI](https://duckdb.org) | OLAP SQL en local sin servidor, soporta Parquet/CSV/JSON | `pacman -S duckdb` |

**Uso rápido de DuckDB:**

```sh
# Consultar un Parquet directamente
duckdb -c "SELECT * FROM 'datos.parquet' LIMIT 10"

# Modo interactivo
duckdb

```

---

### Nube & Infra

| Herramienta                                                              | Propósito                   | Instalar             |
| ------------------------------------------------------------------------ | --------------------------- | -------------------- |
| [gcloud CLI](https://cloud.google.com/sdk)                               | Google Cloud SDK            | ver sección abajo    |
| [Docker](https://www.docker.com) / [Podman](https://podman.io)           | Contenedores                | ver sección abajo    |
| [Terraform](https://www.terraform.io) / [OpenTofu](https://opentofu.org) | Infraestructura como código | `pacman -S opentofu` |

**Docker:**

```sh
pacman -S docker docker-compose
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
# Reiniciar sesión para aplicar el grupo

```

**Podman** (alternativa sin daemon, rootless):

```sh
pacman -S podman podman-compose

```

---

## Configuración de gcloud CLI

### Instalación

```sh
# Desde AUR (recomendado — se mantiene actualizado)
yay -S google-cloud-cli

# O desde el instalador oficial
curl [https://sdk.cloud.google.com](https://sdk.cloud.google.com) | bash
exec -l $SHELL

```

### Setup inicial

```sh
# Login y configuración de proyecto por defecto
gcloud init

# Seleccionar cuenta y proyecto interactivamente
gcloud config set project TU_PROJECT_ID
gcloud config set compute/region us-central1  # ajustar según tu región

```

### Application Default Credentials (ADC)

```sh
# Generar credenciales ADC con tu cuenta personal
gcloud auth application-default login

# Verificar que quedaron bien configuradas
gcloud auth application-default print-access-token

# Ver la ruta del archivo de credenciales
echo $GOOGLE_APPLICATION_CREDENTIALS
# Por defecto: ~/.config/gcloud/application_default_credentials.json

```

> ```
> gcloud/application_default_credentials.json
> gcloud/credentials.db
> gh/hosts.yml
>
> ```

### Múltiples proyectos (configuraciones nombradas)

```sh
# Crear una configuración por proyecto/cliente
gcloud config configurations create mi-proyecto-prod
gcloud config set project mi-proyecto-prod
gcloud config set account tu@email.com

# Listar y cambiar entre configuraciones
gcloud config configurations list
gcloud config configurations activate mi-proyecto-prod

```

---

## Post-instalación checklist

### Sistema base

- [ ] Instalar `yay` (AUR helper): `pacman -S --needed base-devel git && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si`
- [ ] Instalar `zsh` y establecerlo como shell: `pacman -S zsh && chsh -s $(which zsh)`
- [ ] Clonar este repositorio en `~/.config`

### Autenticación

- [ ] Generar claves SSH: `ssh-keygen -t ed25519 -C "tu@email.com"`
- [ ] Agregar clave pública a GitHub: `gh auth login` o manualmente en github.com/settings/keys
- [ ] Autenticar gcloud: `gcloud init && gcloud auth application-default login`
- [ ] Autenticar GitHub CLI: `gh auth login`

### Editores

- [ ] Instalar plugins de Neovim: abrir `nvim` y ejecutar `:Lazy sync`
- [ ] Verificar LSPs instalados: `:Mason` dentro de nvim

### Shell

- [ ] Verificar que Starship, Atuin y direnv estén activados en `~/.zshrc`
- [ ] Sincronizar historial de Atuin: `atuin login` (opcional, requiere cuenta)

### Python

- [ ] Verificar uv: `uv --version`
- [ ] Instalar herramientas globales: `uv tool install visidata pgcli marimo dbt-core`

### Docker

- [ ] Verificar que el usuario esté en el grupo `docker`: `groups | grep docker`
- [ ] Test: `docker run hello-world`

### Verificación final

- [ ] `wezterm --version`
- [ ] `zellij --version`
- [ ] `nvim --version`
- [ ] `duckdb --version`
- [ ] `gcloud --version`
- [ ] `opencode --version`
