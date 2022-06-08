# frozen_string_literal: true

require 'database_cleaner/active_record'

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
SpreeSample::Engine.load_samples if defined?(SpreeSample)
SolidusBolt::Engine.load_seed if defined?(SolidusBolt) && ENV['environment']

Spree::PaymentMethod.where.not(type: 'SolidusBolt::PaymentMethod').update_all(available_to_users: false)
