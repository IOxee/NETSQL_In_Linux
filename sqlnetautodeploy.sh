#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

echo_red() {
    echo -e "${RED}$1${NC}"
}

echo_green() {
    echo -e "${GREEN}$1${NC}"
}

echo_purple() {
    echo -e "${PURPLE}$1${NC}"
}

banner() {
    echo -e "${PURPLE}$1${NC} "██╗░█████╗░██╗░░██╗███████╗███████╗
    echo -e "${PURPLE}$1${NC} "██║██╔══██╗╚██╗██╔╝██╔════╝██╔════╝
    echo -e "${PURPLE}$1${NC} "██║██║░░██║░╚███╔╝░█████╗░░█████╗░░
    echo -e "${PURPLE}$1${NC} "██║██║░░██║░██╔██╗░██╔══╝░░██╔══╝░░
    echo -e "${PURPLE}$1${NC} "██║╚█████╔╝██╔╝╚██╗███████╗███████╗
    echo -e "${PURPLE}$1${NC} "╚═╝░╚════╝░╚═╝░░╚═╝╚══════╝╚══════╝
    echo_green "This script will install .NET SDK and Runtime - SQL Server and SQL Server Tools on Ubuntu."
}


main() {
    echo_green "Start the installation process of SQL Server i .net"

    echo_green "Detecting the ubuntu version ..."
    ubuntu_version=$(lsb_release -rs)
    echo_green "Ubuntu version detected: $ubuntu_version"

    clear

    echo_green "Microsoft GPG Import from GPG ..."
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc

    clear

    echo_green "Microsoft deposit configuration for SQL Server ..."
    curl https://packages.microsoft.com/config/ubuntu/$ubuntu_version/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

    clear

    echo_green "SQL server installation..."
    sudo apt-get update
    sudo apt-get install -y mssql-server

    clear

    echo_green "SQL Server Service Settings..."
    sudo /opt/mssql/bin/mssql-conf setup

    clear

    echo_green "SQL server service check ..."
    systemctl status mssql-server --no-pager

    clear

    echo_green "Installation of mssql-tools and unixodbc..."
    sudo apt-get install -y mssql-tools unixodbc-dev

    clear

    echo_green "Add SQL Server to the route tools ..."
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bash_profile
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
    source ~/.bashrc

    clear

    echo_green "Installation .NET SDK and Runtime..."
    sudo snap install dotnet-sdk --classic --channel=7.0
    sudo snap install dotnet-runtime --classic --channel=7.0

    clear

    echo_green "Completed installation. Installed .Net versions:"
    dotnet --list-sdks
    dotnet --list-runtimes | awk '{print "- " $0}'

    ip_address=$(hostname -I | awk '{print $1}')

    echo ""
    echo_green "Database connection:"
    echo "  - Locally: sqlcmd -S localhost -U sa -P '<YourPassword>'"
    echo ""
    echo_red "If you have problems with the SSL certificate, you can use SQLCMD with the -n -c parameters to omit the certificate verification."
    echo ""
    echo_green "Windows configuration with SSMS:"
    echo "  - Ubuntu server IP: $ip_address"
    echo "  - Port: 1433"
    echo "  - User: sa"
    echo "  - Password: [The password you have set up]"
    echo "Make sure that the firewall of the Ubuntu machine allows remote connections to the port 1433."

}

if [ "$(id -u)" == "0" ]; then
    banner
    sleep 5

    echo ""
    main
else
    echo_red "This script must be executed with administrator permits."
fi
