# Simple Docker

Введение в докер.


## Contents

  1. [Готовый докер](#part-1-готовый-докер) 
  2. [Операции с контейнером](#part-2-операции-с-контейнером) 

## Part 1. Готовый докер

  - Взять официальный докер образ с **nginx** и выкачать его при помощи `docker pull`
  ![nginx-off](misc/images/nginx-off.png "Official image of Nginx")
  ![nginx-pull](misc/images/nginx-pull.png "Pulling image of Nginx")

  - Проверить наличие докер образа через `docker images`
  ![docker-images](misc/images/docker-images.png "docker images")

  - Запустить докер образ через `docker run -d [image_id|repository]`
  ![docker-run-d](misc/images/docker-run-d.png "docker run -d")

  - Проверить, что образ запустился через `docker ps`
  ![docker-ps](misc/images/docker-ps.png "docker ps")

  - Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`
  ![docker-inspect](misc/images/docker-inspect.png "docker inspect")
    - размер контейнера
    ![docker-size](misc/images/docker-size.png "docker inspect -f")
    - список замапленных портов
    ![docker-exposed-ports](misc/images/docker-exposed-ports.png "docker inspect -f")
    - ip контейнера
    ![docker-ipaddress](misc/images/docker-ipaddress.png "docker inspect -f")

  - Остановить докер образ через `docker stop [container_id|container_name]`, проверить, что образ остановился через `docker ps`
  ![docker-stop](misc/images/docker-stop.png "docker stop -> docker ps")

  - Запустить докер с замапленными портами 80 и 443 на локальную машину через команду *run*
  ![docker-publish](misc/images/docker-publish.png "docker run -p -> inspect -f")

  - Проверить, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**
  ![docker-telnet](misc/images/docker-telnet.png "telnet localhost 80 -> GET /")

  - Перезапустить докер контейнер через `docker restart [container_id|container_name]`
  ![docker-restart](misc/images/docker-restart.png "docker restart ")

  - Проверить любым способом, что контейнер запустился
  ![docker-restart2](misc/images/docker-restart2.png "docker ps")

## Part 2. Операции с контейнером

  - Прочитать конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*
  ![nginx-conf](misc/images/nginx-conf.png "docker exec cat /etc/nginx/nginx.conf")

  - Создать на локальной машине файл *nginx.conf*
  ![nginx-conf2](misc/images/nginx-conf2.png "cat nginx.conf на локальной машине")

  - Настроить в нем по пути */status* отдачу страницы статуса сервера **nginx**
  ![nginx-conf3](misc/images/nginx-conf3.png "mcedit nginx.conf на локальной машине")

  - Скопировать созданный файл *nginx.conf* внутрь докер образа через команду `docker cp`
  ![docker-cp](misc/images/docker-cp.png "docker cp")

  - Перезапустить **nginx** внутри докер образа через команду *exec*
  ![nginx-reload](misc/images/nginx-reload.png "docker exec service nginx reload")

  - Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
  ![docker-telnet2](misc/images/docker-telnet2.png "telnet localhost 80 -> GET /status")

  - Экспортировать контейнер в файл *container.tar* через команду *export*
  ![docker-export](misc/images/docker-export.png "docker export")

  - Остановить контейнер
  ![docker-stop2](misc/images/docker-stop2.png "docker stop -> docker ps")

  - Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры
  ![docker-rmi](misc/images/docker-rmi.png "docker rmi -f")

  - Удалить остановленный контейнер - удалился с образом.
  ![docker-container-ls](misc/images/docker-container-ls.png "docker container ls")

  - Импортировать контейнер обратно через команду *import*
  ![docker-import](misc/images/docker-import.png "docker import")

  - Запустить импортированный контейнер
  ![docker-run-imported](misc/images/docker-run-imported.png "docker run -d")
    - Это не сработало, так как при экспорте сохраняется только файловая структура контейнера с утерей всех метаданных, таких как переменные среды или команда по умолчанию. Для требуемого результата следует использовать команду *commit*
  ![docker-commit](misc/images/docker-commit.png "docker commit")

  - Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
  ![docker-telnet3](misc/images/docker-telnet3.png "telnet localhost 80 -> GET /status")