# Qt5.14.2 Cross compile (build) Linux

Для установки и дальнейшей сборки проектов на виртуальной машине с Ubuntu 20.04.06 потребуется:
1) Скачать Ubuntu 20.04.06 c официального сайта (https://releases.ubuntu.com/20.04/) - Desktop image
2) Скачать Oracle VirtualBox с официального сайта (https://www.virtualbox.org/)
3) Скачать qt-everywhere-src-5.14.2 с официального сайта или с моего диска (https://disk.yandex.ru/d/rYmjasPqaCJAVg)
4) Скачать проект с GitHub

## Создаём образ Ubuntu 20.04.06

1) Запускуем Oracle VirtualBox
2) Нажимаем "Создать"
3) Задаём "Имя" и выбираем ISO файл нашей Ubuntu 20.04.06
4) Задаём "Имя пользователя" - user (Для большего удобства)
5) Выделяем не менее 20 гб на жестком диске

## Подготовка пространства

Для корректной работы скриптов необходимо расположить их в определнные места и изменить параметры (Для примера дальше будет использоваться имя пользователя user):
1) С помощью проводника или терминала заходим в папку /home/user и копируем архив qt-everywhere-src-5.14.2.tar и 2 скрипта: Qt_installer.sh и Qt_add_path.sh
2) Далее создаём папку Projects в /home/user (В ней могут хранится не только проекты для Qt)
3) В папке Projects создаём папку Qt
4) В папке Qt создаём папку AppImage и копируем туда всё из архива проекта папки AppImage
5) Копируем скрипт Builder.sh в папку Qt

В результате подготовки у вас должны быть:

/home/user/qt-everywhere-src-5.14.2.tar<br />
/home/user/Qt_installer.sh<br />
/home/user/Qt_add_path.sh<br />
/home/user/Projects/Qt/AppImage/Appimage.sh<br />
/home/user/Projects/Qt/AppImage/linuxdeployqt-continuous-x86_64.AppImage<br />
/home/user/Projects/Qt/Builder.sh<br />

Проекты должны хранится в папке Qt в виде MainWindow/MainWindow.pro (MainWindow/MainWindow.pro - лишь пример)

## Установка Qt5.14.2

Для установки необходимо:
1) Изменить параметры в скрипте Qt_installer.sh (NAME_USER, PATH_QT_INSTALLER и QT_DIR_NAME) (При быстрой установке достаточно изменить NAME_USER)
2) Изменить параметры в скрипте Qt_add_path.sh (NAME_USER, PATH_QT_INSTALLER и QT_DIR_NAME) (При быстрой установке достаточно изменить NAME_USER)
3) Дать Qt_installer.sh и Qt_add_path.sh права для выполнения : chmod +x Qt_installer.sh; chmod +x Qt_add_path.sh;
4) Запустить скрипт Qt_installer.sh (в консоле ./Qt_installer.sh)
5) Если Qt_installer.sh завершается без ошибок - запускаем скрипт Qt_add_path.sh

## Сборка проект

Для сборки проекта необходимо:
1) Изменить параметры в скрипте Builder.sh (NAME_USER, QT_DIR_NAME и NAME_PROJECT)
2) Дать Builder.sh права для выполнения (если до этого не были выданы) : chmod +x Builder.sh
3) Запустить скрипт Builder.sh

Могут возникнуть проблемы с работой с Bluetooth - решение (https://stackoverflow.com/questions/40901662/qtbluetooth-not-functional-on-linux) (Если вдруг ссылка не работает - необходимо найти в qt-everywhere-src-5.14.2 qtconnectivity; вызвать сборку (./полныйПутьДоqmake полныйПутьдоqtconnectivity.pro); если везде написано Yes - запускаем make -j8 и make install -j8)

В результате сборки проекта будет создата папка Debug_$NAME_PROJECT с собранным проектом

## AppImage

Для преобразования собранного проекта в AppImage (AppImage - это скомпанованный файл, который содержит необходимые библиотеки для работы на других устройствах) необходимо:
1) Зайти в папку /home/user/Projects/Qt/AppImage/
2) Изменить параметры в скрипте Appimage.sh (NAME_USER и NAME_PROJECT)
3) Запускаем скрипт Appimage.sh (При получении ошибки Categories entry not found in desktop file .desktop file is missing a Categories= key - смотрите комментарий в Appimage.sh)
4) Переименновываем созданный Application-x86_64.AppImage в название нашего проекта