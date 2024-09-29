# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :load_profile
  before_action :authenticate_turbo_frame_request!, only: :edit

  def show
    redirect_to user_path(current_user)
  end

  def edit; end

  def update
    @profile.assign_attributes(profile_params)
    if @profile.save
      flash[:success] = t("Updated")
      turbo_redirect_to user_path(current_user)
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def load_profile
    @profile = current_user.profile
  end

  def profile_params
    params.required(:profile).permit(:bio, :link, user_attributes: %i[name avatar])
  end

  def authenticate_turbo_frame_request!
    return if turbo_frame_request?

    redirect_to user_path(current_user)
  end
end
