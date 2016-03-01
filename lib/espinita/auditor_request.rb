module Espinita::AuditorRequest
  extend ActiveSupport::Concern

  included do
    before_filter :store_audited_user
  end

  def store_audited_user
    if self.respond_to?(Espinita.current_user_method, true)
      RequestStore.store[:audited_user] = self.send(Espinita.current_user_method)
    end

    RequestStore.store[:audited_ip] = self.try(:request).try(:remote_ip)
  end
end
