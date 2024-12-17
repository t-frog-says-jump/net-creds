FROM  dh-mirror.gitverse.ru/python:2.7.18-slim-buster AS builder

RUN \
        python2 -m pip install virtualenv && \
        python2 -m virtualenv /opt/venv

COPY requirements.txt .

RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt


FROM dh-mirror.gitverse.ru/python:2.7.18-slim-buster AS runner

RUN \
        addgroup --system net-creds && \
        adduser --system --no-create-home --group net-creds

COPY \
        --chown=net-creds:net-creds --chmod=700 --from=builder \
        /opt/venv /opt/venv

COPY --chown=net-creds:net-creds --chmod=700  net-creds.py ./

USER net-creds

ENTRYPOINT [ "/opt/venv/bin/python", "net-creds.py", "--pcap", "/mnt/net-creds/net-creds.pcap" ]