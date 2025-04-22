FROM postgres:17

# Copy initialization script
COPY queries/BPO.sql /docker-entrypoint-initdb.d/

# Copy SSL certificates
COPY cert.pem /var/lib/postgresql/cert.pem
COPY key.pem /var/lib/postgresql/key.pem

# Set permissions for certificates
RUN chmod 600 /var/lib/postgresql/cert.pem && \
    chmod 600 /var/lib/postgresql/key.pem
