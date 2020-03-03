---
layout: post
title: PyLint Makes Me Feel Like a Software Engineer
---


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2
❯ pip3 install pylint
Collecting pylint
  Downloading https://files.pythonhosted.org/packages/e9/59/43fc36c5ee316bb9aeb7cf5329cdbdca89e5749c34d5602753827c0aa2dc/pylint-2.4.4-py3-none-any.whl (302kB)
     |████████████████████████████████| 307kB 2.3MB/s
Collecting isort<5,>=4.2.5
  Downloading https://files.pythonhosted.org/packages/e5/b0/c121fd1fa3419ea9bfd55c7f9c4fedfec5143208d8c7ad3ce3db6c623c21/isort-4.3.21-py2.py3-none-any.whl (42kB)
     |████████████████████████████████| 51kB 9.8MB/s
Collecting mccabe<0.7,>=0.6
  Downloading https://files.pythonhosted.org/packages/87/89/479dc97e18549e21354893e4ee4ef36db1d237534982482c3681ee6e7b57/mccabe-0.6.1-py2.py3-none-any.whl
Collecting astroid<2.4,>=2.3.0
  Downloading https://files.pythonhosted.org/packages/ad/ae/86734823047962e7b8c8529186a1ac4a7ca19aaf1aa0c7713c022ef593fd/astroid-2.3.3-py3-none-any.whl (205kB)
     |████████████████████████████████| 215kB 405kB/s
Collecting lazy-object-proxy==1.4.*
  Downloading https://files.pythonhosted.org/packages/e2/44/044dc5610d868cd4e9329549c07e8366c0b0aace410d2502a131c46576de/lazy_object_proxy-1.4.3-cp37-cp37m-macosx_10_13_x86_64.whl
Requirement already satisfied: wrapt==1.11.* in /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages (from astroid<2.4,>=2.3.0->pylint) (1.11.2)
Requirement already satisfied: six~=1.12 in /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages (from astroid<2.4,>=2.3.0->pylint) (1.12.0)
Collecting typed-ast<1.5,>=1.4.0; implementation_name == "cpython" and python_version < "3.8"
  Downloading https://files.pythonhosted.org/packages/0c/f0/c351d6aeb7f5ba00da2e5aac43ef09b71be95aed45bfca943a5016854269/typed_ast-1.4.1-cp37-cp37m-macosx_10_9_x86_64.whl (223kB)
     |████████████████████████████████| 225kB 6.7MB/s
Installing collected packages: isort, mccabe, lazy-object-proxy, typed-ast, astroid, pylint
Successfully installed astroid-2.3.3 isort-4.3.21 lazy-object-proxy-1.4.3 mccabe-0.6.1 pylint-2.4.4 typed-ast-1.4.1
WARNING: You are using pip version 19.3.1; however, version 20.0.2 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.

experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2 took 12s
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:23:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level  (fixme)
experts_all.py:23:83: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:26:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:29:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:32:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:36:58: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:38:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:39:17: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:41:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:44:59: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:52:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:55:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:60:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:63:0: C0304: Final newline missing (missing-final-newline)
experts_all.py:1:0: C0114: Missing module docstring (missing-module-docstring)
experts_all.py:15:0: E0401: Unable to import 'common_json' (import-error)
experts_all.py:22:19: W0621: Redefining name 'redis' from outer scope (line 9) (redefined-outer-name)
experts_all.py:22:0: C0116: Missing function or method docstring (missing-function-docstring)
experts_all.py:31:22: E1121: Too many positional arguments for function call (too-many-function-args)
experts_all.py:35:21: E1101: Module 'expert_invective' has no 'classify' member (no-member)
experts_all.py:36:21: E1101: Module 'expert_sentiment' has no 'classify' member (no-member)
experts_all.py:37:21: E1101: Module 'expert_antisemitism' has no 'classify' member (no-member)
experts_all.py:43:4: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:54:4: W0621: Redefining name 'redis' from outer scope (line 9) (redefined-outer-name)
experts_all.py:54:12: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:58:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:59:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:8:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:9:0: W0611: Unused import redis (unused-import)
experts_all.py:10:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

-------------------------------------
Your code has been rated at -12.76/10


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:23:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:39:17: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:41:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:44:59: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:52:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:63:0: C0304: Final newline missing (missing-final-newline)
experts_all.py:1:0: C0114: Missing module docstring (missing-module-docstring)
experts_all.py:15:0: E0401: Unable to import 'common_json' (import-error)
experts_all.py:22:19: W0621: Redefining name 'redis' from outer scope (line 9) (redefined-outer-name)
experts_all.py:22:0: C0116: Missing function or method docstring (missing-function-docstring)
experts_all.py:31:22: E1121: Too many positional arguments for function call (too-many-function-args)
experts_all.py:35:21: E1101: Module 'expert_invective' has no 'classify' member (no-member)
experts_all.py:36:21: E1101: Module 'expert_sentiment' has no 'classify' member (no-member)
experts_all.py:37:21: E1101: Module 'expert_antisemitism' has no 'classify' member (no-member)
experts_all.py:43:4: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:54:4: W0621: Redefining name 'redis' from outer scope (line 9) (redefined-outer-name)
experts_all.py:54:12: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:58:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:59:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:8:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:9:0: W0611: Unused import redis (unused-import)
experts_all.py:10:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

----------------------------------------------------------------------
Your code has been rated at -10.00/10 (previous run: -12.76/10, +2.76)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:23:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:1:0: C0114: Missing module docstring (missing-module-docstring)
experts_all.py:15:0: E0401: Unable to import 'common_json' (import-error)
experts_all.py:22:19: W0621: Redefining name 'redis' from outer scope (line 9) (redefined-outer-name)
experts_all.py:22:0: C0116: Missing function or method docstring (missing-function-docstring)
experts_all.py:31:22: E1121: Too many positional arguments for function call (too-many-function-args)
experts_all.py:35:21: E1101: Module 'expert_invective' has no 'classify' member (no-member)
experts_all.py:36:21: E1101: Module 'expert_sentiment' has no 'classify' member (no-member)
experts_all.py:37:21: E1101: Module 'expert_antisemitism' has no 'classify' member (no-member)
experts_all.py:43:4: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:54:4: W0621: Redefining name 'redis' from outer scope (line 9) (redefined-outer-name)
experts_all.py:54:12: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:58:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:59:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:8:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:9:0: W0611: Unused import redis (unused-import)
experts_all.py:10:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

---------------------------------------------------------------------
Your code has been rated at -8.28/10 (previous run: -10.00/10, +1.72)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2 took 2s
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:25:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:17:0: E0401: Unable to import 'common_json' (import-error)
experts_all.py:24:19: W0621: Redefining name 'redis' from outer scope (line 11) (redefined-outer-name)
experts_all.py:24:0: C0116: Missing function or method docstring (missing-function-docstring)
experts_all.py:33:22: E1121: Too many positional arguments for function call (too-many-function-args)
experts_all.py:37:21: E1101: Module 'expert_invective' has no 'classify' member (no-member)
experts_all.py:38:21: E1101: Module 'expert_sentiment' has no 'classify' member (no-member)
experts_all.py:39:21: E1101: Module 'expert_antisemitism' has no 'classify' member (no-member)
experts_all.py:45:4: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:56:4: W0621: Redefining name 'redis' from outer scope (line 11) (redefined-outer-name)
experts_all.py:56:12: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:60:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:61:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:10:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:11:0: W0611: Unused import redis (unused-import)
experts_all.py:12:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

--------------------------------------------------------------------
Your code has been rated at -7.93/10 (previous run: -8.28/10, +0.34)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2
❯ mdfind -name common_json.py
/Users/sjohnson/Sync/fuzzygroup/adl/antihate/antihate_experts/common_json.py
/Users/sjohnson/Sync/fuzzygroup/adl/antihate/antihate_experts/tests/test_common_json.py

experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2
❯ cp /Users/sjohnson/Sync/fuzzygroup/adl/antihate/antihate_experts/common_json.py .

experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:25:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:24:19: W0621: Redefining name 'redis' from outer scope (line 11) (redefined-outer-name)
experts_all.py:24:0: C0116: Missing function or method docstring (missing-function-docstring)
experts_all.py:30:17: E1101: Module 'common_json' has no 'some_method_dont_remember' member (no-member)
experts_all.py:33:22: E1121: Too many positional arguments for function call (too-many-function-args)
experts_all.py:37:21: E1101: Module 'expert_invective' has no 'classify' member (no-member)
experts_all.py:38:21: E1101: Module 'expert_sentiment' has no 'classify' member (no-member)
experts_all.py:39:21: E1101: Module 'expert_antisemitism' has no 'classify' member (no-member)
experts_all.py:45:4: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:56:4: W0621: Redefining name 'redis' from outer scope (line 11) (redefined-outer-name)
experts_all.py:56:12: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:60:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:61:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:10:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:11:0: W0611: Unused import redis (unused-import)
experts_all.py:12:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

--------------------------------------------------------------------
Your code has been rated at -7.93/10 (previous run: -7.93/10, +0.00)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2 took 2s
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:25:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:24:0: C0116: Missing function or method docstring (missing-function-docstring)
experts_all.py:30:17: E1101: Module 'common_json' has no 'some_method_dont_remember' member (no-member)
experts_all.py:33:22: E1121: Too many positional arguments for function call (too-many-function-args)
experts_all.py:37:21: E1101: Module 'expert_invective' has no 'classify' member (no-member)
experts_all.py:38:21: E1101: Module 'expert_sentiment' has no 'classify' member (no-member)
experts_all.py:39:21: E1101: Module 'expert_antisemitism' has no 'classify' member (no-member)
experts_all.py:45:4: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:56:17: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:60:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:61:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:10:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:11:0: W0611: Unused import redis (unused-import)
experts_all.py:12:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

--------------------------------------------------------------------
Your code has been rated at -7.24/10 (previous run: -7.93/10, +0.69)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2 took 2s
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:27:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:26:0: C0303: Trailing whitespace (trailing-whitespace)
experts_all.py:32:17: E1101: Module 'common_json' has no 'some_method_dont_remember' member (no-member)
experts_all.py:35:22: E1121: Too many positional arguments for function call (too-many-function-args)
experts_all.py:39:21: E1101: Module 'expert_invective' has no 'classify' member (no-member)
experts_all.py:40:21: E1101: Module 'expert_sentiment' has no 'classify' member (no-member)
experts_all.py:41:21: E1101: Module 'expert_antisemitism' has no 'classify' member (no-member)
experts_all.py:47:4: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:58:17: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:62:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:63:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:10:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:11:0: W0611: Unused import redis (unused-import)
experts_all.py:12:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

--------------------------------------------------------------------
Your code has been rated at -7.24/10 (previous run: -7.24/10, +0.00)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2 took 2s
❯ mate .

experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:27:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:33:0: C0301: Line too long (116/100) (line-too-long)
experts_all.py:36:22: E1121: Too many positional arguments for function call (too-many-function-args)
experts_all.py:40:21: E1101: Module 'expert_invective' has no 'classify' member (no-member)
experts_all.py:41:21: E1101: Module 'expert_sentiment' has no 'classify' member (no-member)
experts_all.py:42:21: E1101: Module 'expert_antisemitism' has no 'classify' member (no-member)
experts_all.py:48:4: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:59:17: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:63:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:64:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:10:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:11:0: W0611: Unused import redis (unused-import)
experts_all.py:12:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

--------------------------------------------------------------------
Your code has been rated at -5.52/10 (previous run: -7.24/10, +1.72)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:27:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:33:0: C0301: Line too long (116/100) (line-too-long)
experts_all.py:48:4: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:59:17: E0602: Undefined variable 'common_redis' (undefined-variable)
experts_all.py:63:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:64:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:10:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:11:0: W0611: Unused import redis (unused-import)
experts_all.py:12:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

-------------------------------------------------------------------
Your code has been rated at 1.38/10 (previous run: -5.52/10, +6.90)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2 took 2s
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:28:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:34:0: C0301: Line too long (116/100) (line-too-long)
experts_all.py:19:0: E0001: Cannot import 'common_redis' due to syntax error 'invalid syntax (<unknown>, line 6)' (syntax-error)
experts_all.py:64:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:65:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:10:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:11:0: W0611: Unused import redis (unused-import)
experts_all.py:12:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

------------------------------------------------------------------
Your code has been rated at 3.33/10 (previous run: 1.38/10, +1.95)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2 took 2s
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:28:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:34:0: C0301: Line too long (116/100) (line-too-long)
experts_all.py:64:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:65:8: E0602: Undefined variable 'process_data_from_topic' (undefined-variable)
experts_all.py:10:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:11:0: W0611: Unused import redis (unused-import)
experts_all.py:12:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

------------------------------------------------------------------
Your code has been rated at 5.00/10 (previous run: 3.33/10, +1.67)


experts-all on  develop [»🤷‍] via 🐍 v2.7.10 on ☁️  us-west-2 took 3s
❯ pylint experts_all.py
************* Module experts_all
experts_all.py:28:2: W0511: todo - how handle multiple buckets??? maybe comes in at multiprocessing level (fixme)
experts_all.py:34:0: C0301: Line too long (116/100) (line-too-long)
experts_all.py:10:0: W0611: Unused Pool imported from multiprocessing (unused-import)
experts_all.py:11:0: W0611: Unused import redis (unused-import)
experts_all.py:12:0: W0611: Unused KafkaConsumer imported from kafka (unused-import)

------------------------------------------------------------------
Your code has been rated at 8.33/10 (previous run: 5.00/10, +3.33)
