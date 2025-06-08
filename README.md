# DISCLAIMER
> This is **NOT** a production instance, but instead an initial stab at getting an apollo + galaxy instance up and working together

# Apollo Setup Documentation

## Dual Apollo Configuration

### Service Ports:
- **Galaxy**: http://localhost:8080
- **Apollo2**: http://localhost:8889 (Traditional Apollo interface)
- **Apollo3**: http://localhost:8888 (JBrowse-based interface)

### Apollo3 Services:
- `apollo3-server`: Apollo3 collaboration server (port 3999)
- `apollo3-client`: Apollo3 web client with JBrowse2 (port 8888)
- `apollo3-mongo`: MongoDB primary (port 27017)
- `apollo3-mongo-replica`: MongoDB replica (port 27018)

### Apollo2 Services:
- `apollo2-app`: Apollo2 application (port 8889)
- `apollo2-postgres`: PostgreSQL database for Apollo2 (port 5433)

### Environment Files:
- `.envs/.apollo3`: Apollo3 configuration (MongoDB-based)
- `.envs/.apollo2`: Apollo2 configuration (PostgreSQL-based)
- `.envs/.apollo2-postgres`: Apollo2 database configuration
- `.envs/.galaxy`: Galaxy configuration (currently configured for Apollo3)

### Database Ports:
- Galaxy PostgreSQL: 5432
- Apollo2 PostgreSQL: 5433
- Apollo3 MongoDB: 27017
- Apollo3 MongoDB Replica: 27018

### Starting the Services:

```bash
# Start all services
docker compose -f local.yml up -d

# or just apollo2 + galaxy
docker compose -f local.yml up -d galaxy-app galaxy-postgres apollo2-app apollo2-postgres

# Start only specific services
docker compose -f local.yml up -d galaxy-app apollo3-server apollo3-client
docker compose -f local.yml up -d apollo2-app apollo2-postgres
```

### Initial Setup Required:

1. Apollo2 will need initial database setup and user creation
2. Both instances can run simultaneously for testing and comparison
3. Data directories are separate to avoid conflicts
