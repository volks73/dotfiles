REM Installation batch file for dotfiles on Windows.
REM Created by Christopher R. Field (volks73)
REM Date Created: 2018-05-18
REM
REM Use this script to automate the installation of configuration files on
REM a Windows systems. Simply double-click to run the batch file.
set PWD=%cd%
mklink %HOME%\_vimrc %PWD%\vimrc
mklink %HOME%\_gvimrc %PWD%\gvimrc
mklink %HOME%\.spacemacs %PWD%\spacemacs
