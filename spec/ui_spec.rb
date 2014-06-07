require 'ui'

describe UI do

  let(:ui) { UI.new }
  let(:menu) { Menu.new }
  
  it 'displays an introductory message' do
    expect(ui.header).to eq "********* JULIA'S AWESOME DINER *********\n\n"
  end

  it 'should raise an error if user inputs total cost wrongly' do
    allow(ui).to receive(:input) { "£1.00" }
    order = double :order, total_cost: "£8.00"
    expect{ui.client_confirms_cost_of(order)}.to raise_error RuntimeError
  end


end