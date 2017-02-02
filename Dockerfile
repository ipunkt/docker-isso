FROM wonderfall/isso:0.10

COPY isso.conf.tpl /opt/config/isso.conf.tpl
COPY run.sh /run.sh
ENTRYPOINT ["/run.sh"]
