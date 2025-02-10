ARG PG_VERSION
# Start with the official PostgreSQL image based on Debian
FROM postgres:${PG_VERSION}

# Run package updates and install necessary packages
RUN apt-get update \
    # Install PostgreSQL development headers and PGXN client
    && apt-get install -y \
        postgresql-server-dev-${PG_VERSION} \
        pgxnclient \
        make \
        gcc \
    # Install the 'temporal_tables' extension using PGXN
    && pgxn install temporal_tables \
    # Clear apt cache to reduce image size
    && rm -rf /var/lib/apt/lists/*
