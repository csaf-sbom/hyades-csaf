# Local development
How to get it up and running locally for development

## Launch hyades components
This will include workers for both mirroring and scanning tasks

Switch to hyades folder
```
cd hyades
```

Run db and kafka/redpanda
```
docker compose up -d
```

For *first-run*, build it once!
```
mvn install -DskipTests -Dcheckstyle.skip
```

Start local development (or start it in Intellij)
```
mvn -pl mirror-service quarkus:dev -Dcheckstyle.skip
mvn -pl vulnerability-analyzer quarkus:dev -Dcheckstyle.skip
```

## Launch apiserver

This will provide backend functionality to the frontend and coordinate worker tasks
```
cd hyades-apiserver
```

For *first-run*, build it once!
```
mvn install -DskipTests -Dcheckstyle.skip
```

Run locally (or start it in Intellij)
```
mvn -pl apiserver jetty:run -Dcheckstyle.skip
```

## Launch frontend
Go to frontend folder
```
cd hyades-frontend
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

SELinux may not allow redpanda topic creation, disable temporarily
# setenforce 0
