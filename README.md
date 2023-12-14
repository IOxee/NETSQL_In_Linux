# SQLNetAutoDeploy

![SQL Server](https://img.shields.io/badge/SQL_Server-Install-orange)
![.NET](https://img.shields.io/badge/.NET_SDK_and_Runtime-Install-blue)
![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04_LTS-green)

## Description
`SQLNetAutoDeploy` is a Bash script designed to automate the installation and configuration of Microsoft SQL Server, .NET SDK, and .NET Runtime on Ubuntu systems. It streamlines the setup process, making it straightforward to prepare a development or production environment for SQL Server and .NET applications.

## Features
- 🚀 **Easy to Use**: Simplifies the setup process with a single script execution.
- 🛠️ **Comprehensive**: Installs SQL Server, .NET SDK, .NET Runtime, and necessary tools.
- 🔒 **SSL Certificate Handling**: Provides options for SSL certificate issues with `sqlcmd`.

## Requirements
- Ubuntu (Tested on 22.04 LTS)
- Root or sudo privileges

## Usage
1. Clone or download the `SQLNetAutoDeploy` script.
2. Make the script executable: `chmod +x SQLNetAutoDeploy.sh`.
3. Run the script as root or with sudo: `sudo ./SQLNetAutoDeploy.sh`.

## What the Script Does
- Detects the Ubuntu version.
- Installs and configures Microsoft SQL Server.
- Installs .NET SDK and .NET Runtime.
- Sets up `mssql-tools` and `unixodbc-dev`.
- Configures PATH for SQL Server tools.
- Provides information for connecting to SQL Server both locally and remotely via SSMS on Windows.

## SSL Certificate Handling
In case of SSL certificate issues with `sqlcmd`, the script provides the option to use `-N -C` parameters to bypass SSL certificate verification.

## Connecting to SQL Server
After running the script, connect to your SQL Server instance:
- **Locally**: Use `sqlcmd -S localhost -U sa -P '<YourPassword>'`.
- **From Windows with SSMS**: Use the IP of the Ubuntu server, port `1433`, username `sa`, and your configured password.

## Contributing
Contributions, issues, and feature requests are welcome! Feel free to check [issues page](#).

## Acknowledgments
- This script is made possible thanks to the open-source community.
- Special thanks to everyone who contributes to this project.

## License
MIT License

Copyright (c) 2023 IO

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
