(setq jdee-global-classpath '("c:/Users/sliu11/MacLeasing/Projects/dependencies-sources/iportal-classes"
                              "c:/Users/sliu11/MacLeasing/Projects/iPortal/iportal/target/iportal/WEB-INF/classes"))


(setq jdee-compile-option-directory "c:/Users/sliu11/MacLeasing/Projects/iPortal/iportal/target/iportal/WEB-INF/classes")

(setq jdee-sourcepath '("c:/Users/sliu11/MacLeasing/Projects/dependencies-sources/iportal"
                        "c:/Users/sliu11/MacLeasing/Projects/iPortal/iportal/src/main/java"
                        "c:/Users/sliu11/MacLeasing/Projects/iPortal/iportal/target/generated-sources/xmlbeans"))

;;(setq jdee-run-option-debug '("Server" "Socket" "javadebug" "localhost" "9999" nil));; This is for running application in debug mode

(setq jdee-db-option-connect-socket '(nil "8787"));;this is for connecting to remote process running in debug server mode
;;(setq jdee-db-option-connect-socket '("itgsyddev252" "8469"));;this is for connecting to remote process running in debug server mode
;;(setq jdee-db-option-connect-socket '("itgsyddev252" "8469"));;this is for connecting to remote process running in debug server mode

(setenv "GTAGSLIBPATH" "/Users/sliu11/MacLeasing/Projects/dependencies-sources/iportal;/Users/sliu11/MacLeasing/Projects/dependencies-sources/jdk1.7")
