---
layout: post
title: Obscure Rails Error - Undefined Method Collation for nil:NilClass
---

undefined method `collation' for nil:NilClass

I added a validates_uniqueness_of :url

NoMethodError - undefined method `collation' for nil:NilClass:
  activerecord (5.0.2) lib/active_record/connection_adapters/abstract_mysql_adapter.rb:617:in `case_sensitive_comparison'
  activerecord (5.0.2) lib/active_record/validations/uniqueness.rb:75:in `build_relation'
  activerecord (5.0.2) lib/active_record/validations/uniqueness.rb:18:in `validate_each'
  activemodel (5.0.2) lib/active_model/validator.rb:151:in `block in validate'
  activemodel (5.0.2) lib/active_model/validator.rb:148:in `validate'
  activesupport (5.0.2) lib/active_support/callbacks.rb:405:in `block in make_lambda'
  activesupport (5.0.2) lib/active_support/callbacks.rb:169:in `block (2 levels) in halting'
  activesupport (5.0.2) lib/active_support/callbacks.rb:547:in `block (2 levels) in default_terminator'
  activesupport (5.0.2) lib/active_support/callbacks.rb:546:in `block in default_terminator'
  activesupport (5.0.2) lib/active_support/callbacks.rb:170:in `block in halting'
  activesupport (5.0.2) lib/active_support/callbacks.rb:454:in `block in call'
  activesupport (5.0.2) lib/active_support/callbacks.rb:454:in `call'
  activesupport (5.0.2) lib/active_support/callbacks.rb:101:in `__run_callbacks__'
  activesupport (5.0.2) lib/active_support/callbacks.rb:750:in `_run_validate_callbacks'
  activemodel (5.0.2) lib/active_model/validations.rb:408:in `run_validations!'
  activemodel (5.0.2) lib/active_model/validations/callbacks.rb:113:in `block in run_validations!'
  activesupport (5.0.2) lib/active_support/callbacks.rb:97:in `__run_callbacks__'
  activesupport (5.0.2) lib/active_support/callbacks.rb:750:in `_run_validation_callbacks'
  activemodel (5.0.2) lib/active_model/validations/callbacks.rb:113:in `run_validations!'
  activemodel (5.0.2) lib/active_model/validations.rb:338:in `valid?'
  activerecord (5.0.2) lib/active_record/validations.rb:65:in `valid?'
  activerecord (5.0.2) lib/active_record/validations.rb:82:in `perform_validations'
  activerecord (5.0.2) lib/active_record/validations.rb:44:in `save'
  activerecord (5.0.2) lib/active_record/attribute_methods/dirty.rb:22:in `save'
  activerecord (5.0.2) lib/active_record/transactions.rb:319:in `block (2 levels) in save'
  activerecord (5.0.2) lib/active_record/transactions.rb:395:in `block in with_transaction_returning_status'
  activerecord (5.0.2) lib/active_record/connection_adapters/abstract/database_statements.rb:232:in `block in transaction'
  activerecord (5.0.2) lib/active_record/connection_adapters/abstract/transaction.rb:189:in `within_new_transaction'
  activerecord (5.0.2) lib/active_record/connection_adapters/abstract/database_statements.rb:232:in `transaction'
  activerecord (5.0.2) lib/active_record/transactions.rb:211:in `transaction'
  activerecord (5.0.2) lib/active_record/transactions.rb:392:in `with_transaction_returning_status'
  activerecord (5.0.2) lib/active_record/transactions.rb:319:in `block in save'
  activerecord (5.0.2) lib/active_record/transactions.rb:334:in `rollback_active_record_state!'
  activerecord (5.0.2) lib/active_record/transactions.rb:318:in `save'
  activerecord (5.0.2) lib/active_record/suppressor.rb:41:in `save'
  app/models/course.rb:130:in `save_all_objects'
  app/controllers/courses_controller.rb:32:in `create'
  actionpack (5.0.2) lib/action_controller/metal/basic_implicit_render.rb:4:in `send_action'
  actionpack (5.0.2) lib/abstract_controller/base.rb:188:in `process_action'
  actionpack (5.0.2) lib/action_controller/metal/rendering.rb:30:in `process_action'
  actionpack (5.0.2) lib/abstract_controller/callbacks.rb:20:in `block in process_action'
  activesupport (5.0.2) lib/active_support/callbacks.rb:126:in `call'
  activesupport (5.0.2) lib/active_support/callbacks.rb:506:in `block (2 levels) in compile'
  activesupport (5.0.2) lib/active_support/callbacks.rb:455:in `call'
  activesupport (5.0.2) lib/active_support/callbacks.rb:101:in `__run_callbacks__'
  activesupport (5.0.2) lib/active_support/callbacks.rb:750:in `_run_process_action_callbacks'
  activesupport (5.0.2) lib/active_support/callbacks.rb:90:in `run_callbacks'
  actionpack (5.0.2) lib/abstract_controller/callbacks.rb:19:in `process_action'
  actionpack (5.0.2) lib/action_controller/metal/rescue.rb:20:in `process_action'
  actionpack (5.0.2) lib/action_controller/metal/instrumentation.rb:32:in `block in process_action'
  activesupport (5.0.2) lib/active_support/notifications.rb:164:in `block in instrument'
  activesupport (5.0.2) lib/active_support/notifications/instrumenter.rb:21:in `instrument'
  activesupport (5.0.2) lib/active_support/notifications.rb:164:in `instrument'
  actionpack (5.0.2) lib/action_controller/metal/instrumentation.rb:30:in `process_action'
  actionpack (5.0.2) lib/action_controller/metal/params_wrapper.rb:248:in `process_action'
  activerecord (5.0.2) lib/active_record/railties/controller_runtime.rb:18:in `process_action'
  actionpack (5.0.2) lib/abstract_controller/base.rb:126:in `process'
  actionview (5.0.2) lib/action_view/rendering.rb:30:in `process'
  actionpack (5.0.2) lib/action_controller/metal.rb:190:in `dispatch'
  actionpack (5.0.2) lib/action_controller/metal.rb:262:in `dispatch'
  actionpack (5.0.2) lib/action_dispatch/routing/route_set.rb:50:in `dispatch'
  actionpack (5.0.2) lib/action_dispatch/routing/route_set.rb:32:in `serve'
  actionpack (5.0.2) lib/action_dispatch/journey/router.rb:39:in `block in serve'
  actionpack (5.0.2) lib/action_dispatch/journey/router.rb:26:in `serve'
  actionpack (5.0.2) lib/action_dispatch/routing/route_set.rb:725:in `call'
  apartment (1.2.0) lib/apartment/elevators/generic.rb:24:in `call'
  apartment (1.2.0) lib/apartment/reloader.rb:18:in `call'
  meta_request (0.4.2) lib/meta_request/middlewares/app_request_handler.rb:13:in `call'
  meta_request (0.4.2) lib/meta_request/middlewares/meta_request_handler.rb:13:in `call'