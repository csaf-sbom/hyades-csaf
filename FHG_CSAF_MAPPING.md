| CSAF Field                              | CycloneDX Field                      | Notes                                                                 |
|-----------------------------------------|--------------------------------------|----------------------------------------------------------------------|
| `document/tracking/id`                  | `vulnerabilities/id`                 | Unique identifier for the vulnerability.                             |
| `document/tracking/summary`             | `vulnerabilities/description`        | A short description of the vulnerability.                            |
| `document/tracking/revision_history`    | `vulnerabilities/notes`              | Revision history can be added as notes.                              |
| `vulnerabilities/title`                 | `vulnerabilities/source/name`        | Title or name of the vulnerability.                                  |
| `vulnerabilities/details`               | `vulnerabilities/description`        | Detailed description of the vulnerability.                           |
| `vulnerabilities/cve`                   | `vulnerabilities/cve`                | Common Vulnerabilities and Exposures (CVE) identifier.               |
| `vulnerabilities/cwe`                   | `vulnerabilities/cwes`               | Common Weakness Enumeration (CWE) identifiers.                       |
| `vulnerabilities/impact`                | `vulnerabilities/rating`             | Impact assessment of the vulnerability, often mapped to severity.    |
| `vulnerabilities/published`             | `vulnerabilities/published`          | Date when the vulnerability was published.                           |
| `vulnerabilities/updated`               | `vulnerabilities/updated`            | Date when the vulnerability was last updated.                        |
| `vulnerabilities/ids`                   | `vulnerabilities/ids`                | External identifiers related to the vulnerability, such as references.|
| `vulnerabilities/notes`                 | `vulnerabilities/notes`              | Additional notes or comments.                                        |
| `vulnerabilities/acknowledgments`       | `vulnerabilities/credits`            | Acknowledgment of contributors or researchers.                       |
| `vulnerabilities/references`            | `vulnerabilities/references`         | Links to related resources or advisories.                            |
| `vulnerabilities/affected`              | `affects/ref`                        | Components affected by the vulnerability, mapping to component references.|
| `product_tree/full_product_names`       | `components`                         | Full product names indicating affected components.                   |
| `product_tree/branches`                 | `components/hierarchy`               | Hierarchical representation of affected products.                    |
| `product_tree/relationships`            | `dependencies`                       | Describes relationships between products and components.             |
| `threats`                               | `vulnerabilities/threats`            | Potential threats associated with the vulnerability.                 |
| `remediations`                          | `vulnerabilities/advisories`         | Suggested remediations or mitigations for the vulnerability.         |
| `scores/cvss`                           | `vulnerabilities/ratings`            | CVSS scores indicating the severity of the vulnerability.            |