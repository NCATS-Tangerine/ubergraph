# Ubergraph [![image](https://user-images.githubusercontent.com/112839/112872474-563aac00-90b8-11eb-8a53-2ca19672f2a4.png)](https://doi.org/10.5281/zenodo.4641309)

Integrated OBO ontology store

- Merged set of mutually referential OBO ontologies:
  - Uberon anatomy
  - Cell Ontology (CL)
  - Gene Ontology (GO)
  - Biospatial Ontology (BSPO)
  - Phenotype and Trait Ontology (PATO)
  - Human Phenotype Ontology (HPO)
  - Monarch Disease Ontology (MONDO)
  - Chemical Entities of Biological Interest (ChEBI)
  - Relations Ontology (RO)
  - Environmental conditions, treatments and exposures ontology (ECTO)
  - Environment Ontology (ENVO)
  - Ontology for Biomedical Investigations (OBI)
  - Medical Action Ontology (MAXO)
  - Evidence and Conclusion Ontology (ECO)
  - NCBI Taxonomy (slim version)
  - Experimental Factor Ontology (EFO)
  - Protein Ontology (PRO)
  - NCIt OBO Edition (NCIT)
- Precomputed OWL classification (class hierarchy)
- Materialized “class relations” from existential property restrictions (in separate named graphs)
- Blazegraph RDF triplestore; SPARQL query interface

SPARQL endpoint: `https://stars-app.renci.org/ubergraph/sparql`
- Query interface in YASGUI: https://api.triplydb.com/s/_26lcKdBY

## Support
Development of Ubergraph has been supported by the [NCATS Biomedical Data Translator project](https://github.com/NCATSTranslator), as well as by [RENCI](https://renci.org).
