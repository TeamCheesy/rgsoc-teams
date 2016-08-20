class StatusUpdatesController < ApplicationController
  # I think I don't need this; it doesn't make a difference anyway
  # PATH_PARENTS = [:status_updates]

  def show
    @status_update = Activity.with_kind('status_update').find params[:id]
  end
end
