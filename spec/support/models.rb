class GeneralModel < ActiveRecord::Base
  include Espinita::Auditor

  belongs_to :user
end

class User < ActiveRecord::Base; end
