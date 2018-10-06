ROBOT_ENV=ROBOT_JAVA_ARGS=-Xmx50G
ROBOT=$(ROBOT_ENV) robot
NCIT_UTILS_ENV=JAVA_OPTS=-Xmx50G
NCIT_UTILS=$(NCIT_UTILS_ENV) ncit-utils
BG_RUNNER=JAVA_OPTS=-Xmx50G blazegraph-runner 

all: ubergraph.jnl

mirror: ontologies.ofn
	rm -rf $@ &&\
	$(ROBOT) mirror -i $< -d $@ -o $@/catalog-v001.xml

ontologies-merged.ttl: ontologies.ofn mirror
	$(ROBOT) merge --catalog mirror/catalog-v001.xml --include-annotations true -i $< \
	remove --axioms 'disjoint' --trim true \
	remove --term 'owl:Nothing' --trim true \
	reason -r ELK -D debug.ofn -o $@

properties-nonredundant.ttl: ontologies-merged.ttl
	$(NCIT_UTILS) materialize-property-expressions ontologies-merged.ttl properties-nonredundant.ttl properties-redundant.ttl &&\
	touch properties-redundant.ttl

properties-redundant.ttl: properties-nonredundant.ttl

ubergraph.jnl: properties-nonredundant.ttl properties-redundant.ttl
	rm -f $@ &&\
	$(BG_RUNNER) load --journal=$@ --informat=turtle --graph 'http://ubergraph.renci.org/ontology' ontologies-merged.ttl &&\
	$(BG_RUNNER) load --journal=$@ --informat=turtle --graph 'http://ubergraph.renci.org/properties/nonredundant' properties-nonredundant.ttl &&\
	$(BG_RUNNER) load --journal=$@ --informat=turtle --graph 'http://ubergraph.renci.org/properties/redundant' properties-redundant.ttl