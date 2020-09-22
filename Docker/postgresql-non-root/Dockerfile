# https://suedbroecker.net/2020/06/23/run-a-postgressql-container-as-a-non-root-user-in-openshift/

FROM docker.io/postgres:12
# Create the needed temp file before the first postgreSQL execution

RUN mkdir temp

# Create group and user

RUN groupadd -g 1001 non-root-postgres-group
RUN useradd -u 1001 non-root-postgres-user --group non-root-postgres-group

# Set user rights to allow the on-root-postgres-user 
# to access the temp folder

RUN chown -R non-root-postgres-user:non-root-postgres-group /temp
RUN chmod 777 /temp

# Change to non-root privilege

USER non-root-postgres-user

EXPOSE 5432
