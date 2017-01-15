---
layout: post
title: Simple JavaScript Basics
---
# How Do I Know if JQuery is Installed
$('*')
# How Do I Submit a Form on Page Load
<form method="post" action="<%=SAML_URLS[:lithium_endpoint_consume]%>" id="sso_form"> 
<input type="hidden" name="SAMLResponse" value="<%=@SAMLResponse%>" /> 
<input type="hidden" name="RelayState" value="<%=@RelayState%>" /> 
<input type="submit" value=" Go " id="form_submit" /> 
</form> 
<script>
  $(document).ready(function(){
    $('#sso_form').submit();
  });
</script>
# How Do I Submit a Form with JavaScript
<script>
$('#form_submit').click(function(e){
  e.preventDefault();
  $('#sso_form').submit();  
});
</script>