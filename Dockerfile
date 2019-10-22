FROM python:3

MAINTAINER NMSolutions <support@nmsolutions.eu>

LABEL io.k8s.description="Python-OKD" \
      io.k8s.display-name="Python-WebFilelist" \
      io.openshift.expose-services="7070:tcp" \
      io.openshift.tags="pyweb-okd"

ENV PATH="${PATH}:/usr/bin:/usr/src/app"

RUN groupadd -r rfbocr && useradd -r -g rfbocr -d /home/rfbocr -m rfbocr

RUN pip install httpserver

VOLUME /uploads
WORKDIR /uploads

USER rfbocr

EXPOSE 7070

CMD [ "python", "-m", "http.server", "--bind", "0.0.0.0", "7070" ]


