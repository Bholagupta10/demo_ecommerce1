module ApplicationHelper

	def current_order
		if !session[:order_id].nil?
		  order.find(session[:order_id])
		else
		  order.new
		end
	end
end
