class LocationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:confirm]
	before_action :set_loc, only: [:confirm, :destroy]

	def user
		@locs = Location.where(user_id: current_user.id).page(params[:page])
	end

	def product
		@locs = Location.where(product_id: params[:product_id], status: 0).page(params[:page])
	end

	def confirm
		if @loc == nil
			redirect_to product_locations_url, alert: 'Unable to update delivery.' 
		else
			@temp = @loc.product_id
			@name = product_name(@temp)
			if @user == nil
				@loc.destroy
			else
				@loc.product_id = nil
				@loc.msg = "#{current_user.name} has delivered #{@loc.msg}x #{@name}."
				@loc.status = 1
				@loc.save!
			end
			respond_to do |format|
				format.html { redirect_to product_locations_url(product_id: @temp) }
				format.json { head :no_content }
			end
		end
	rescue
		redirect_to product_locations_url, alert: 'Unable to update delivery.' 
	end

	def destroy
		if @loc.status != 1
			redirect_to user_locations_url(user_id: current_user), alert: 'Unable to dismiss pending delivery.'
		end 
		@loc.destroy
		respond_to do |format|
			format.html { redirect_to user_locations_url(user_id: current_user) }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_user
			@user = User.find(params[:user_id])
		rescue ActiveRecord::RecordNotFound => e
			@user = nil
		end

		def set_loc
			@loc = Location.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			@loc = nil
		end
end
