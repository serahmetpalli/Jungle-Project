class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'].to_s, password: ENV['AUTH_PASSWORD'].to_s
  def show
    @product_count= Product.count
    @category_list= Product.group(:category_id).count
  end
end
