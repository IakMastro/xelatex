# XeLaTex Thesis

LaTeX is a very powerful tool to use on to make very beautiful PDFs really fast and really easily!

This project is for those who are looking for a template either for their assignments or for their thesis to use!

It is completely containerized and everything is quarantined from the main system.

## Requirements

* A machine that runs Docker, either Linux, MacOS or Windows with WSL support

## How to install

### Debian-Ubuntu

```sh
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# For Debian
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# For Ubuntu
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
```

### Kali

```sh
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
```

### Arch-Manjaro

```sh
sudo pacman -S docker docker-compose
sudo systemctl enable docker.service --now
sudo groupadd docker
sudo usermod -aG docker $USER
```

### Windows-MacOS

You can download [Docker Desktop](https://www.docker.com/products/docker-desktop) to use Docker on Windows/Mac

## How to launch

### Command

```sh
./run.sh <arg>
```

Where argument is either assignments and thesis.

When the build will finish run ``xelatex main.tex`` for the thesis template or ``xelatex -escape-shell main.tex`` for the assignments template.
