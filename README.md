zte-ac30-web
============

Custom web interface for MiFi ZTE AC30 by Frol via http://prostoksi.com

Lifehacks (in Russian)
----------------------

Original links:
* https://plus.google.com/u/0/115442448872340245030/posts/WJ5eZmyjKGk
* https://plus.google.com/u/0/115442448872340245030/posts/HreScaRxZup

### для анлока пользуются утилитой DC-unlocker

Cкачать DC-unlocker бесплатно можно с офсайта, но за анлок нужно заплатить кредиты и если делать самому, то выйдет это 7 евро... Есть донглы, которые выгодно покупать при массовом разлоке и тогда стоимость разлока бесплатная, поэтому у людей, которые этим занимаются есть такие донглы. Пытался я ломать эту софтину (для анлока она связывается с сервером через 443 порт, но там ниразу не https), за Wireshark сервер меня на сутки ещё и забанил (так же по слухам банит за кейлогеры и ещё пару утилит), за Artmoney не забанили, но ничего через неё не получилось выудить. На этом мой энтузиазм ковыряния этой софтины временно кончился.

### для прошивки CDMA оператора анлок не нужен

... но нужна софтина, которая зальёт PRL оператора (легко гуглится), нужна софтина Магнус (или QPST, но в первой есть прессеты под украинский операторы) (бесплатная полностью, но про помощь разработчику через необязательный донат не забывайте!). У меня самостоятельно заставить всё работать не получилось, как выяснилось нужно было узнать и правильно указать CHAP

### по WiFi можно достучаться через telnet к busybox

Можно пофиксить web-интерфейс слегка:
1. для начала нужно поправить iptables для telnet доступа, есть два способа это сделать (НЕ нужно делать оба!):
    1. через утилиту curl (в linux или в powershell в windows):

        ```
        curl -d "user_disable=admin&psw=admin&user=admin" http://192.168.0.1/goform/login
        curl -d "command=iptables -D INPUT -p tcp --dport 23 -j DROP" http://192.168.0.1/goform/SystemCommand
        ```
    2. Создать, а потом открыть в браузере на своём компьютере HTML файл: ac30_telnet.html, с содержимым:

        ```
        <!-- START -->
        Адрес модема:<input type=text value='192.168.0.1' onblur='document.getElementById("f").action="http://"+this.value+"/goform/SystemCommand";'>
        <div>
        <iframe name=x id=x style='display:none;'></iframe>
        <form id=f action='http://192.168.0.1/goform/SystemCommand' method=post target=x >
        <input type=hidden name=command value='iptables -D INPUT -p tcp --dport 23 -j DROP'>
        <input type=submit value="enable telnet">
        </form>
        <!-- END -->
        ```

        После этого заходим на модем просто: `telnet 192.168.0.1` (логин root без пароля)
2. в админке можно раскомментировать разные режимы CDMA only, GSM only, GSM preferred, CDMA, EVDO, CDMA and EVDO - просто в `/mnt/flash/zte_dir_app_linux/web/air_network/net_select.asp` в JS немного раскомментировать и в соответсвии с этим JS создать необходимый HTML.
3. В продолжение к (2), я думаю, в сорцах админки очень много нужных закомментированных крутилок, например настройки APN - можно, конечно, вручную туда заходить по ссылке http://192.168.0.1/air_network/multi_apn.asp, но рекомендую запихнуть аккуратненько эту кнопочку в веб-интерфейс.

Можно использовать готовую модифицированную админку:

1. Повторить пункт (1) из списка выше
2. В сорцах админки очень много нужных, но закомментированных крутилок:
    1. (вариант А) Если есть интернет на устройстве, то можно прошивку залить в автоматическом режиме (возможно ftp могут закрыть за неактивность, но можно будет сделать по аналогии с любым другим ftp, даже локальным). В telnet вводим команду:

        ```
        cd /mnt/flash/ && ftpget -u fees0_11439542 -p zteac30 ftp.0fees.net web.tar htdocs/web.tar && rm -rf zte_dir_app_linux/web && tar -xvf web.tar -C zte_dir_app_linux/
        ```
    2. (вариант В) Автоматический режим: Я сделал простую загрузку прошивки - просто откройте этот HTML в браузере и нажмите кнопку - это занимает около 5 минут ничего не делания https://www.dropbox.com/s/ea0fcin6bhmx4lq/uploadfirmware.html
    3. (вариант С) Полуавтоматический режим: Мою модифицированную админку ( https://www.dropbox.com/s/ckj73jlu76iduhp/web.tar.bz2 ) можно залить так:
        1. подключаем модем к USB
        2. в подключённый диск (раздел) копируем файл `web.tar`
        3. заходим через `telnet` и выполняем команду:

            ```
            cd /mnt/flash/ && mount -o loop zte_udisk_xp zte_udisk_linux && rm -rf zte_dir_app_linux/web && tar -xvf zte_udisk_linux/web.tar -C zte_dir_app_linux/
            ```
    4. (вариант D) Ручной режим редактирования админки: в админке можно раскомментировать разные режимы CDMA only, GSM only, GSM preferred, CDMA, EVDO, CDMA and EVDO - просто в ```/mnt/flash/zte_dir_app_linux/web/air_network/net_select.asp``` в JS немного раскомментировать и в соответсвии с этим JS создать необходимый HTML.

### Если не подходит IMEI как логин к WiFi

Cледует попробовать пароль: ac30pass
