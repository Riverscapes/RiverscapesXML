############################################################################################
# Dev Container for riverscapes-tools
############################################################################################
FROM mcr.microsoft.com/devcontainers/python:3.11 AS worker

# Some preliminary dependencies
RUN apt update && apt upgrade -y && apt autoremove -y

# Now install any lingering dependencies
COPY requirements.docker.txt /workspaces/requirements.txt
RUN pip --timeout=120 install -r /workspaces/requirements.txt

# Now install user preferences 
USER vscode
RUN wget https://raw.githubusercontent.com/Riverscapes/environment/master/nar-ys.zsh-theme -O ~/.oh-my-zsh/custom/themes/nar-ys.zsh-theme
RUN wget https://raw.githubusercontent.com/Riverscapes/environment/master/.aliases -O ~/.aliases
RUN wget https://raw.githubusercontent.com/Riverscapes/environment/master/.zshrc -O ~/.zshrc
