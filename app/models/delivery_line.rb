# == Schema Information
# Schema version: 20090123112145
#
# Table name: delivery_lines
#
#  id                :integer       not null, primary key
#  delivery_id       :integer       not null
#  order_line_id     :integer       not null
#  product_id        :integer       not null
#  price_list_id     :integer       not null
#  price_id          :integer       not null
#  quantity          :decimal(16, 2 default(1.0), not null
#  unit_id           :integer       not null
#  amount            :decimal(16, 2 default(0.0), not null
#  amount_with_taxes :decimal(16, 2 default(0.0), not null
#  company_id        :integer       not null
#  created_at        :datetime      not null
#  updated_at        :datetime      not null
#  created_by        :integer       
#  updated_by        :integer       
#  lock_version      :integer       default(0), not null
#

class DeliveryLine < ActiveRecord::Base
end
