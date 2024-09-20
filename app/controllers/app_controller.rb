# frozen_string_literal: true

class AppController < ApplicationController
  skip_before_action :authenticate_user!
end
