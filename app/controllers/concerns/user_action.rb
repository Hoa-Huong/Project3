module UserAction
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_user, only: [:edit, :update]
    before_action :correct_user , only: [:edit, :update]
  end


end
