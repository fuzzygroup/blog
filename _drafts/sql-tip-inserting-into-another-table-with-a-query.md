---
layout: post
title: SQL Tip - Inserting Into Another Table with a Query
---

SELECT * INTO fi_app_banks_before FROM fi_app_banks

create table fi_app_banks_pre_exclusion as select * from fi_app_banks;
