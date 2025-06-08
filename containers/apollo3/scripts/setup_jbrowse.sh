#!/bin/sh
set -e

# Append Proxy Configuration
cat /usr/local/apache2/conf/httpd.conf.append >> /usr/local/apache2/conf/httpd.conf

# JBrowse
echo "Fetching JBrowse v${JBROWSE_VERSION}..."
wget --output-document jbrowse-web.zip \
    "https://github.com/GMOD/jbrowse-components/releases/download/v${JBROWSE_VERSION}/jbrowse-web-v${JBROWSE_VERSION}.zip"
unzip -o jbrowse-web.zip
rm jbrowse-web.zip

# Apollo
echo "Fetching Apollo v${APOLLO_VERSION}..."
wget --output-document=- --quiet \
    "https://registry.npmjs.org/@apollo-annotation/jbrowse-plugin-apollo/-/jbrowse-plugin-apollo-${APOLLO_VERSION}.tgz" | \
    tar --extract --gzip --file=- --strip=2 package/dist/jbrowse-plugin-apollo.umd.production.min.js
mv jbrowse-plugin-apollo.umd.production.min.js apollo.js

# Sequence Ontology
echo "Fetching sequence ontology..."
wget --quiet "https://github.com/The-Sequence-Ontology/SO-Ontologies/raw/refs/heads/master/Ontology_Files/so.json"
mv so.json sequence_ontology.json

echo "JBrowse and Apollo setup complete"