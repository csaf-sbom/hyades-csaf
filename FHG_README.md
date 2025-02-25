# Local development
How to get it up and running locally for development
## Launch hyades components
This will include workers for both mirroring and scanning tasks
```
git clone git@github.com:csaf-sbom/hyades.git
```
Run db and kafka/redpanda
```
docker compose up -d
```

For *first-run*, build it once!
```
mvn package -DskipTests -Dcheckstyle.skip
```

Start local development
```
mvn -pl mirror-service quarkus:dev -Dcheckstyle.skip
mvn -pl vulnerability-analyzer quarkus:dev -Dcheckstyle.skip
```

## Launch apiserver (this repository)
This will provide backend functionality to the frontend and coordinate worker tasks
```
git clone git@github.com:csaf-sbom/hyades-apiserver.git
```

Run locally using fhgrun.sh: maven jetty plugin+config
```
./fhgrun.sh
```

## Allow access to API endpoints
Create the CSAF_MANAGEMENT permission
```
docker compose exec postgres psql -U dtrack -d dtrack -c "INSERT INTO \"PERMISSION\" (\"DESCRIPTION\", \"NAME\") VALUES ('CSAF Management permission', 'CSAF_MANAGEMENT');"
```

Add CSAF_MANAGEMENT to your DT user:
```Administration -> Access Management -> Managed Users```


## Launch frontend
Clone frontend
```
git clone git@github.com:csaf-sbom/hyades-frontend.git
```

Run the frontend **AFTER** starting services and apiserver, it will chose the next available port automatically. 

**NOTE** if starting this first, it will claim ports required by apiserver, therefore start it last!
```
npm start
```

# other notes
Liquibase plugin (if not found)
```
mvn org.liquibase:liquibase-maven-plugin:4.31.1:update
```