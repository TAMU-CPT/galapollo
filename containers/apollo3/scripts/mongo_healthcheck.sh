#!/bin/sh

mongosh --port 27017 --quiet --eval "
try {
  rs.status()
  console.log('replica set ok')
} catch {
  rs.initiate({
    _id: 'rs0',
    members: [
      { _id: 0, host: 'apollo-mongo:27017', priority: 1 },
      { _id: 1, host: 'apollo-mongo-replica:27018', priority: 0.5 },
    ],
  })
  console.log('replica set initiated')
}
"