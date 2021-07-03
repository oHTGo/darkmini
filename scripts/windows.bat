@ECHO OFF 
:: This batch file details Windows 10, hardware, and networking configuration.
TITLE Dark Mini

SET PATH_SCRIPT=%CD%

if exist %PATH_SCRIPT%\scripts\refind\ (
    echo Please wait for the installation...
) else (
    echo Vui lòng tải xuống rEFInd theo đường dẫn, giải nén và copy thư mục "refind" vào thư mục "scripts"
    PAUSE
    START https://sourceforge.net/projects/refind/
    EXIT /B 404
)

> nul mountvol R: /S
cd /d R:\EFI

if exist refind\ (
    echo "rEFInd" is already installed
) else (
    echo "rEFInd" will be installed
    xcopy /E %PATH_SCRIPT%\scripts\refind R:\EFI\refind\
    cd refind\
    rename refind.conf-sample refind.conf
    cd ..
    echo Please download EasyUEFI and follow the instructions of the following website...
    START https://www.easyuefi.com/resource/set-up-multi-boot-windows-linux-and-mac-using-refind-and-easyuefi.html
)


cd refind\
> nul findstr /c:"include themes/darkmini/theme-mini.conf" refind.conf && (
    echo Theme 'darkmini' was added
) || (
    echo Theme 'darkmini' has been added
    echo %NL%include themes/darkmini/theme-mini.conf >> refind.conf
)

if exist themes\ (
    echo Folder "themes" exists
) else (
    echo Folder "themes" does not exist, will be created
    xcopy /E %PATH_SCRIPT%\ R:\EFI\refind\themes\darkmini\
)

cd /d %PATH_SCRIPT%

PAUSE