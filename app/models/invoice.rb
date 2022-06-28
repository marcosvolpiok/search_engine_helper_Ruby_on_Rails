class Invoice < ActiveRecord::Base
  has_many :invoice_lines
end

class InvoiceLine < ActiveRecord::Base
  belongs_to :invoice
end

class InvoicesController < ApplicationController

  invoice_line = new InvoiceLine
  invoice_line(permitted_params[invoice_line])
  invoice_line.save!


  invoice = new Invoice
  invoice(permitted_params[invoice])
  invoice.save!

  # param1,
  # param2

  def permitted_params
    params.permit(
      :param1,
      :param2
    )
  end
end

describe 'new invoice'
  context 'validate invoice creation'
    invoice = new Invoice
    invoice(params[invoice])
    invoice.save

    expect(Invoice.first).to be_equal (params[invoice])
  end
end