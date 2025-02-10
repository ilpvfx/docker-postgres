ARG POSTGRES_TAG
# Start with the official PostgreSQL image based on Debian
FROM postgres:$POSTGRES_TAG


# Run package updates and install necessary packages
RUN set -x && apt-get update \
    # Install PostgreSQL development headers and PGXN client \
    # PG_MAJOR is set by the upstream image
    && apt-get install -y \
        postgresql-server-dev-$PG_MAJOR \
        pgxnclient \
        make \
        gcc \
    # Install the 'temporal_tables' extension using PGXN
    && pgxn install temporal_tables \
    # Clear apt cache to reduce image size
    && rm -rf /var/lib/apt/lists/*
