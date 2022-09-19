# sli-tools

Basic tooling for working with Service-Level Indicator (SLI).

## Background

* [SLOs, SLIs, SLAs, oh my—CRE life lessons](https://cloud.google.com/blog/products/devops-sre/availability-part-deux-cre-life-lessons)
* [Tune up your SLI metrics: CRE life lessons](https://cloud.google.com/blog/products/management-tools/tune-up-your-sli-metrics-cre-life-lessons)
* [Setting SLOs: a step-by-step guide](https://cloud.google.com/blog/products/management-tools/practical-guide-to-setting-slos)
* [SRE fundamentals 2021: SLIs vs SLAs vs SLOs](https://cloud.google.com/blog/products/devops-sre/sre-fundamentals-sli-vs-slo-vs-sla)

## Prerequisites

* For `exe/sli-vhosts`: Access logs in OpenSearch / ElasticSearch with the following fields:
  * `apache.vhost` the Virtual Host name (e.g. `"example.com"`);
  * `apache.response` the HTTP response code (e.g. `200`, `404`, `502`).

## Usage

```sh-session
romain@zappy ~/Projects/sli-tools % bundle exec exe/sli-vhosts -m 30
Virtual Host                                   SLI      EB Usg  Errors
example.com                                100.000 %     0.000 %        0/934722
gitlab.example.com                          99.997 %     2.972 %       52/1749625
mattermost.example.com                      99.953 %    46.650 %       36/77170
```
