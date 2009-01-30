# == Schema Information
# Schema version: 20090123112145
#
# Table name: invoice_lines
#
#  id                :integer       not null, primary key
#  invoice_id        :integer       not null
#  order_line_id     :integer       not null
#  product_id        :integer       not null
#  price_list_id     :integer       not null
#  price_id          :integer       not null
#  quantity          :decimal(16, 2 default(1.0), not null
#  amount            :decimal(16, 2 default(0.0), not null
#  amount_with_taxes :decimal(16, 2 default(0.0), not null
#  position          :integer       
#  company_id        :integer       not null
#  created_at        :datetime      not null
#  updated_at        :datetime      not null
#  created_by        :integer       
#  updated_by        :integer       
#  lock_version      :integer       default(0), not null
#

class InvoiceLine < ActiveRecord::Base
end
