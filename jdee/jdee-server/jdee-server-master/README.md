[![Build Status](https://travis-ci.org/jdee-emacs/jdee-server.png?branch=master)](https://travis-ci.org/jdee-emacs/jdee-server)

# jdee-server
JDEE Java backend

# Building:
1. It requires *Maven 3*
2. ```mvn -DskipTests=true assembly:assembly```

Copy ```target/jdee-bundle-${version}.jar``` to a directory and customize ```jdee-server-dir``` to point to the dir.
