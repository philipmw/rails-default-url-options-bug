unless File.exist?('Gemfile')
  File.write('Gemfile', <<-GEMFILE)
    source 'https://rubygems.org'
    gem 'rails', github: 'rails/rails'
    gem 'arel', github: 'rails/arel'
    gem 'rspec'
    gem 'rspec-rails'
  GEMFILE

  system 'bundle'
end

require 'bundler'
Bundler.setup(:default)

require 'rails'
require 'action_controller/railtie'

class TestApp < Rails::Application
  config.root = File.dirname(__FILE__)
  config.session_store :cookie_store, key: 'cookie_store_key'
  secrets.secret_token    = 'secret_token'
  secrets.secret_key_base = 'secret_key_base'

  config.logger = Logger.new($stdout)
  Rails.logger  = config.logger

  routes.draw do
    resources :catalog
    resources :book
  end
end

class ApplicationController < ActionController::Base
  include Rails.application.routes.url_helpers

  def default_url_options
    STDERR.puts "default_url_options invoked"
    {'defarg' => 'defval'}
  end
end

class CatalogController < ApplicationController
  def index
    render inline: book_index_path
  end
end


require 'rspec'
require 'rspec/rails'

describe CatalogController, type: :request do
  # ***NOTE*** Including the line below causes url helpers to work consistently
  # before and after a request.  But when it's commented out, helpers behave
  # differently after a request.
  # include Rails.application.routes.url_helpers

  it 'generates URLs correctly' do
    puts "BEFORE GET"
    puts "catalog_index_path=#{catalog_index_path}"
    puts "catalog_index_path({})=#{catalog_index_path({})}"
    puts "catalog_index_path(b: 'c')=#{catalog_index_path(b: 'c')}"

    get catalog_index_path
    expect(response.body).to eq '/book?defarg=defval'

    puts "AFTER GET"
    puts "catalog_index_path=#{catalog_index_path}"
    puts "catalog_index_path({})=#{catalog_index_path({})}"
    puts "catalog_index_path(b: 'c')=#{catalog_index_path(b: 'c')}"
  end
end
