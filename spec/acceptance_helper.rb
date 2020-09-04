require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.format = [:json]
  config.curl_host = 'http://localhost:3000'
  config.api_name = 'Dog Sitting App API'
  config.api_explanation = 'Dog Sitting API Docs'
  config.request_headers_to_include = %w[Host Content-Type]
  config.response_headers_to_include = %w[Host Content-Type]
  config.curl_headers_to_filter = ['Authorization']
  config.keep_source_order = true
  config.request_body_formatter = :json
end
