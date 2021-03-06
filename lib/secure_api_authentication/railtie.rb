# encoding: utf-8

# Copyright (c) 2012 David Kiger
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module SecureApiAuthentication
  class Railtie < Rails::Railtie
    initializer "secure_api_authentication_railtie.config_initializer" do
      SecureApiAuthentication::Checker.time_window      = 4
      SecureApiAuthentication::Checker.header_timestamp = 'x-timestamp'
      SecureApiAuthentication::Checker.header_signature = 'x-signature'
      SecureApiAuthentication::Checker.header_api_key   = 'x-api-key'
      SecureApiAuthentication::Checker.verbose_errors   = false
      if File.exists? Rails.root.join('config', 'secure_api_authentication.yml')
        begin
          config_data = YAML::load_file(Rails.root.join('config', 'secure_api_authentication.yml'))[Rails.env]
          SecureApiAuthentication::Checker.time_window      = config_data['request_window'].to_i unless config_data['request_window'].nil?
          SecureApiAuthentication::Checker.header_timestamp = config_data['header_names']['timestamp'] unless config_data['header_names'].nil? or config_data['header_names']['timestamp'].nil?
          SecureApiAuthentication::Checker.header_signature = config_data['header_names']['signature'] unless config_data['header_names'].nil? or config_data['header_names']['signature'].nil?
          SecureApiAuthentication::Checker.header_api_key   = config_data['header_names']['api_key'] unless config_data['header_names'].nil? or config_data['header_names']['api_key'].nil?
          SecureApiAuthentication::Checker.verbose_errors   = config_data['verbose_errors'] unless config_data['verbose_errors'].nil?
        rescue Exception => e
          # do nothing here -- we already have set the defaults
          Rails.logger.debug e.message
        end
      end
    end
  end
end
