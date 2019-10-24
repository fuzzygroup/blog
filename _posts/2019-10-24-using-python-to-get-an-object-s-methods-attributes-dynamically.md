---
layout: post
title: Using Python to Get an Object's Methods / Attributes Dynamically
category: python
tags: ["python", "ruby"]
---
{:.center}
![IMG_7530.jpeg](/blog/assets/IMG_7530.jpeg)

I'm a Ruby guy who is learning python and one of the ways that I learned Ruby was by working directly with code in a REPL.  Ever since [Jared](https://www.alloycode.com) beat this into my head over and over (and over; I'm slow at times), I've been addicted to Ruby techniques like:

```ruby
(User.methods - Object.methods).sort
User.public_methods
User.methods(false)
```

I was just trying to do this in Python to debug a broken AWS S3 boto example and came up with this:

```python
import sys
import boto3
import pdb

s3_client = boto3.client('s3')
pdb.set_trace()
dir(s3_client)

['_PY_TO_OP_NAME', '__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattr__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_cache', '_client_config', '_convert_to_request_dict', '_emit_api_params', '_endpoint', '_exceptions', '_exceptions_factory', '_get_waiter_config', '_load_exceptions', '_loader', '_make_api_call', '_make_request', '_register_handlers', '_request_signer', '_response_parser', '_serializer', '_service_model', 'abort_multipart_upload', 'can_paginate', 'complete_multipart_upload', 'copy', 'copy_object', 'create_bucket', 'create_multipart_upload', 'delete_bucket', 'delete_bucket_analytics_configuration', 'delete_bucket_cors', 'delete_bucket_encryption', 'delete_bucket_inventory_configuration', 'delete_bucket_lifecycle', 'delete_bucket_metrics_configuration', 'delete_bucket_policy', 'delete_bucket_replication', 'delete_bucket_tagging', 'delete_bucket_website', 'delete_object', 'delete_object_tagging', 'delete_objects', 'delete_public_access_block', 'download_file', 'download_fileobj', 'exceptions', 'generate_presigned_post', 'generate_presigned_url', 'get_bucket_accelerate_configuration', 'get_bucket_acl', 'get_bucket_analytics_configuration', 'get_bucket_cors', 'get_bucket_encryption', 'get_bucket_inventory_configuration', 'get_bucket_lifecycle', 'get_bucket_lifecycle_configuration', 'get_bucket_location', 'get_bucket_logging', 'get_bucket_metrics_configuration', 'get_bucket_notification', 'get_bucket_notification_configuration', 'get_bucket_policy', 'get_bucket_policy_status', 'get_bucket_replication', 'get_bucket_request_payment', 'get_bucket_tagging', 'get_bucket_versioning', 'get_bucket_website', 'get_object', 'get_object_acl', 'get_object_legal_hold', 'get_object_lock_configuration', 'get_object_retention', 'get_object_tagging', 'get_object_torrent', 'get_paginator', 'get_public_access_block', 'get_waiter', 'head_bucket', 'head_object', 'list_bucket_analytics_configurations', 'list_bucket_inventory_configurations', 'list_bucket_metrics_configurations', 'list_buckets', 'list_multipart_uploads', 'list_object_versions', 'list_objects', 'list_objects_v2', 'list_parts', 'meta', 'put_bucket_accelerate_configuration', 'put_bucket_acl', 'put_bucket_analytics_configuration', 'put_bucket_cors', 'put_bucket_encryption', 'put_bucket_inventory_configuration', 'put_bucket_lifecycle', 'put_bucket_lifecycle_configuration', 'put_bucket_logging', 'put_bucket_metrics_configuration', 'put_bucket_notification', 'put_bucket_notification_configuration', 'put_bucket_policy', 'put_bucket_replication', 'put_bucket_request_payment', 'put_bucket_tagging', 'put_bucket_versioning', 'put_bucket_website', 'put_object', 'put_object_acl', 'put_object_legal_hold', 'put_object_lock_configuration', 'put_object_retention', 'put_object_tagging', 'put_public_access_block', 'restore_object', 'select_object_content', 'upload_file', 'upload_fileobj', 'upload_part', 'upload_part_copy', 'waiter_names']

# or 
for attribute in dir(s3_client):
    print (attribute, getattr(s3_client,attribute))
    
__dir__ <built-in method __dir__ of S3 object at 0x10728cf10>
__doc__ None
__eq__ <method-wrapper '__eq__' of S3 object at 0x10728cf10>
__format__ <built-in method __format__ of S3 object at 0x10728cf10>
__ge__ <method-wrapper '__ge__' of S3 object at 0x10728cf10>
__getattr__ <bound method BaseClient.__getattr__ of <botocore.client.S3 object at 0x10728cf10>>
__getattribute__ <method-wrapper '__getattribute__' of S3 object at 0x10728cf10>
__gt__ <method-wrapper '__gt__' of S3 object at 0x10728cf10>
__hash__ <method-wrapper '__hash__' of S3 object at 0x10728cf10>
__init__ <bound method BaseClient.__init__ of <botocore.client.S3 object at 0x10728cf10>>
...
_client_config <botocore.config.Config object at 0x107296d50>
_convert_to_request_dict <bound method BaseClient._convert_to_request_dict of <botocore.client.S3 object at 0x10728cf10>>
_emit_api_params <bound method BaseClient._emit_api_params of <botocore.client.S3 object at 0x10728cf10>>
_endpoint s3(https://s3.us-east-2.amazonaws.com)
_exceptions None
_exceptions_factory <botocore.errorfactory.ClientExceptionsFactory object at 0x1065e9e90>
_get_waiter_config <bound method BaseClient._get_waiter_config of <botocore.client.S3 object at 0x10728cf10>>
_load_exceptions <bound method BaseClient._load_exceptions of <botocore.client.S3 object at 0x10728cf10>>
_loader <botocore.loaders.Loader object at 0x1066060d0>
_make_api_call <bound method BaseClient._make_api_call of <botocore.client.S3 object at 0x10728cf10>>
_make_request <bound method BaseClient._make_request of <botocore.client.S3 object at 0x10728cf10>>

# ... 
# A lot omitted; it was long
```

So, apparently the dir() method when called on a object, reveals quite a bit about the internal workings of the object.  Nifty!

## References

* [StackOverflow and Getting Method Dynamically in Ruby](https://stackoverflow.com/questions/8595184/how-to-list-all-methods-for-an-object-in-ruby/8595216)
* [StackOverflow and Getting Method Dynamically in Python](https://stackoverflow.com/questions/6886493/get-all-object-attributes-in-python)