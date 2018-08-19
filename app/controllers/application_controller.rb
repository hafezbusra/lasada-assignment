class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :product_name, :user_name, :duration, :loc_count
	include CurrentCart
	before_action :set_cart

	def duration(secs)
		mins  = secs / 60
		hours = mins / 60
		days  = hours / 24
		years = days / 365

		if years > 0
			return "#{years}y"
		elsif days > 0
			return "#{days}d"
		elsif hours > 0
			return "#{hours}h"
		elsif mins > 0
			return "#{mins}m"
		elsif secs >= 0
			return "#{secs}s"
		end
	end

	def loc_count(id)
		return Location.where(product_id: id).count
	end

	def product_name(id)
		return Product.find(id).title
	rescue
		routing_error and return
	end

	def user_name(id)
		return User.find(id).name
	rescue
		routing_error and return
	end

	def routing_error(error = 'Routing error', status = :not_found, exception=nil)
		render "layouts/route_error"
	end
end
