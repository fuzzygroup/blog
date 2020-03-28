---
layout: post
title: Grep and Covid
category: covidnearme
tags: ["covidnearme", "grep"]
---

grep Massachusetts cases_0324.csv | awk 'BEGIN { FS = "," } ; {s+=$8} END {print s};'