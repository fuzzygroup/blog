---
layout: post
title: Adding QR Code Support to Your Rails App
category: rails
tags: ["rails", "qr"]
---
A QR code is a bar code that a

<%=image_tag(generate_qr(generate_project_url(@project)), class: "qr-code text-center")%>