require 'espinita/engine'
require 'request_store'

require 'espinita/auditor'
require 'espinita/auditor_behavior'
require 'espinita/auditor_request'

module Espinita
  class << self
    attr_accessor :current_user_method

    def current_user_method
      @current_user_method ||= :current_user
    end
  end
end
